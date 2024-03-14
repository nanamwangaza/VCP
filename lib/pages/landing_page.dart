import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vehicle_campro/routes/routes.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
     //print('screen height is' + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const SizedBox(height: 50,),
           const Text('VCP', style: TextStyle(color:Color (0xFF36BFA6), fontSize:64, fontWeight: FontWeight.bold)),
           const SizedBox(height: 20,),
           const Text('VEHICLE CAM PRO',style: TextStyle(color: Color (0xFF36BFA6),fontSize: 14,fontWeight: FontWeight.bold),),
             const SizedBox(height: 20,),
            const CircleAvatar(radius:50,backgroundImage: AssetImage('assets/images/quadraatlogo.png'),),
              const SizedBox(height: 20),
              
           Container(
            height:300,
            width: 500,
                decoration: const BoxDecoration(
                 image: DecorationImage(image: AssetImage('assets/images/car.png'),fit: BoxFit.cover)
                ),
              ),
              const SizedBox(height: 20,),
            
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.getLanguagePage());
                              },
                              child: Container(
                                            width: 300,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF36BFA6),
                                              borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: const Center(child: Text('Continue',style:TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold) ,)),
                                          ),
                            )
          ],
        )],
      ),
    );
  }
}