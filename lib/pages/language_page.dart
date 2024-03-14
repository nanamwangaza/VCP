import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vehicle_campro/routes/routes.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width:double.maxFinite,
        height: double.maxFinite,
        child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Text('VCP', style: TextStyle(color:Color (0xFF36BFA6), fontSize:64, fontWeight: FontWeight.bold)),
           const SizedBox(height: 20,),
           const Text('VEHICLE CAM PRO',style: TextStyle(color: Color (0xFF36BFA6),fontSize: 14,fontWeight: FontWeight.bold),),
             const SizedBox(height: 20,),
              const CircleAvatar(radius:50,backgroundImage: AssetImage('assets/images/quadraatlogo.png'),),
              const SizedBox(height: 20,),
              const Text('Choose Language', style: TextStyle(color: Color (0xFF36BFA6),fontSize: 14,fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.getLoginPage());
                },
                child: Container(
                  width: 300,
                  height: 50, 
                  child: const Center(child: Text('English',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                  decoration: BoxDecoration(color:const Color (0xFF36BFA6), borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(height: 20,),
               GestureDetector(
                 onTap: (){
                  Get.toNamed(Routes.getLoginPage());
                },
                 child: Container(
                  width: 300,
                  height: 50, 
                  child: const Center(child: Text('Kiswahili',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                  decoration: BoxDecoration(color:const Color (0xFF36BFA6), borderRadius: BorderRadius.circular(20)),
                               ),
               )
          
          ],
        ),
      ),
    );
  }
}