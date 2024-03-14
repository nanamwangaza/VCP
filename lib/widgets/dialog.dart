import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class CustomDialog extends StatelessWidget {
  final String plateNumber;
  final String imagePath;

  const CustomDialog({
    super.key,
    required this.plateNumber,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {   
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 68.0),
                  child: Text(
                    "Success",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF36BFA6),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text("Confirm to save the image"),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: 250,
              height: 100,
               child: Image.file(File(imagePath), fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFF36BFA6)
                )
              ),
              child: Center(
                child: Text(
                  plateNumber,
                  style: const TextStyle(
                    color: Color(0xFF36BFA6),
                    fontSize: 20 ,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18 ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                    foregroundColor: const Color(0xFF36BFA6),
                    side: const BorderSide(
                      color: Color(0xFF36BFA6)
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            title: const Text("Edit license plate",
                            style: TextStyle( color: Color(0xFF36BFA6)),),
                            content: TextField(
                              onChanged: (value) {},
                              decoration: const InputDecoration(
                                hintText: "Enter License Plate",
                                hintStyle: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey)
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK",
                                  style: TextStyle(color: Color(0xFF36BFA6)),))
                            ],
                          );
                        });
                  },
                  child: const Text("Edit",
                  style: TextStyle(color: Color(0xFF36BFA6)),),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF36BFA6),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                  ),
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Image saved'),
                        duration: Duration(milliseconds: 400),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Confirm",
                  style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
