import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class SuccessDialog extends StatelessWidget {
  final String plateNumber;
  final String imagePath;
  //final location;

  const SuccessDialog(
      {super.key, required this.plateNumber, required this.imagePath,});

  @override
  Widget build(BuildContext context) {   
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 68.0), 
            child: Text(
              "Success",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
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
      content: Container(
        width: 500,
        height: 300,
        child: Column(
          children: [
            const Text(
              'Confirm to save image',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF36BFA6)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 100,
              child: Image.file(File(imagePath), fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFF36BFA6), width: 1)),
              child: Center(
                child: Text(
                  plateNumber,
                  style: const TextStyle(
                      color: Color(0xFF36BFA6),
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
               style: ElevatedButton.styleFrom(
               backgroundColor: const Color(0xFF36BFA6),
               
            ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        child: AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: const Text("Edit license plate"),
                          content: TextField(
                            onChanged: (value){},
                            decoration: const InputDecoration(
                              hintText: "Enter License Plate",                              
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: const Text("OK"))
                          ],
                        ),
                      );
                    });
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Icon(Icons.edit, color:Colors.white, size: 16,),
                Text('Edit', style: TextStyle(color: Colors.white, fontSize: 16),)
                ],
              ),
            ),
           
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Image saved'),
                duration: Duration(milliseconds: 400),
              ),
            );
            Navigator.pop(context);
          },
            style: ElevatedButton.styleFrom(
               backgroundColor: const Color(0xFF36BFA6),
               
            ),
          child: const Row(
            children: [
              Icon(Icons.done, color:Colors.white, size: 16,),
              Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 16),),
            ],
          ),
        ),
          ],
        ),
        
      ],
    );
  }
}
