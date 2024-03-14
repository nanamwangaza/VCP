// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:vehicle_campro/widgets/dialog.dart';
import 'package:http/http.dart' as http;

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required List<CameraDescription> cameras});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  late List<CameraDescription> cameras;
  CameraController? cameraController;
  bool camInitialized = false;
  bool isLoading = false;

  createCamController() {
    availableCameras().then(
      (value) {
        cameras = value;
        cameraController = CameraController(cameras[0], ResolutionPreset.max,
            enableAudio: false, imageFormatGroup: ImageFormatGroup.bgra8888);
        cameraController?.initialize().then((_) {
          setState(() {
            camInitialized = true;
          });
        }).catchError((Object e) {
          if (e is CameraException) {
            switch (e.code) {
              case 'CameraAccessDenied':
                break;
              default:
                break;
            }
          }
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    createCamController();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> disposeCamController() async {
    final CameraController? oldController = cameraController;
    if (oldController != null) {
      cameraController = null;
      camInitialized = false;
      return oldController.dispose();
    } else {
      return;
    }
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 400),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

    void showProgressIndicator(BuildContext context, String message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(message),
                ],
              ),
            ),
          );
        });
  }

  Future<String?> uploadImageToBackend(String imageData) async {
  const username = 'brian';
  const password = 'theengiekuec3oekaum6Mu!u0';
  const baseUrl = 'https://api.armell.ai/api/v2/recognize_bytes/?region=EU&topn=10&confidence=400';

  // Prepare basic authentication credentials
  final basicAuth = base64Encode(utf8.encode('$username:$password'));
  final authorizationHeader = 'Basic $basicAuth';

  // Construct the full URL with query string
  final Uri uri = Uri.parse(baseUrl);

  try {
    final response = await http.post(
      uri,
      headers: <String, String>{
        'Authorization': authorizationHeader,
        'Content-Type': 'text/plain',
      },
      body: jsonEncode({'image': imageData}),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      if (responseJson['vehicle'] != null &&
          responseJson['vehicle'].isNotEmpty) {
        return responseJson['vehicle'][0]['plate']['license'];
      } else {
        return null;
      }
    } else {
      // Handle error status codes
      print('Error: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  } on http.ClientException catch (e) {
    // Handle client-side exceptions (e.g., network errors)
    print('Client exception: $e');
    return null;
  } on Exception catch (e) {
    // Handle other exceptions (e.g., decoding errors)
    print('Exception: $e');
    return null;
  }
}

  // File transformPicture(File image) {
    // final completer = Completer<String>();
    // try {
    //   final imageBytes = await jpeg.readAsBytes();
    //   img.Image i = img.JpegDecoder().decodeImage(imageBytes)!;
    //   img.Image sqr = img.copyResizeCropSquare(i, 512);
    //   List<int> png = img.encodePng(sqr);
    //   String base64Image = base64Encode(png);
    //   print(base64Image);
    //   completer.complete(base64Image);
    // } catch (error) {
    //   print('Could not transform image: $error');
    //   completer.completeError('Could not transform image');
    // }
    // return completer.future;

  //   List<int>imageBytes = File(image.path).readAsBytesSync();
  //  String base64String = base64Encode(imageBytes);
  //  return base64String;
  // }

void takePicture(BuildContext context) async {
  if (cameraController != null) {
    showSnackBar(context, "Taking picture");
    XFile? raw = await cameraController!.takePicture();
    if (raw != null) {
      // Read the image file
      Uint8List imageBytes = await raw.readAsBytes();

      // Decode the image bytes
      img.Image? image = img.decodeImage(imageBytes);

      if (image != null) {
        // Resize the image to a smaller size
        img.Image resizedImage = img.copyResize(image, width: 512);

        // Convert resized image to PNG format (if needed)
        List<int> pngBytes = img.encodePng(resizedImage);

        // Convert PNG bytes to Base64
        String base64Image = base64Encode(pngBytes);
           
           uploadImageToBackend('');
        // Print the Base64 string
        print("Base64 Image: $base64Image");
      } else {
        print("Failed to decode image.");
      }
    } else {
      print("Failed to take picture.");
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 500,
              height: 680,
              child: (camInitialized)
                  ? CameraPreview(
                      cameraController!,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                          );
                        },
                      ),
                    )
                  : Container(),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Color(0xFF36BFA6),
            child: const Icon(Icons.camera_alt_rounded,
                size: 34, color: Colors.black),
            onPressed: () {
              takePicture(context);
            },
          ),
        ),
      ),
    );
  }
}
