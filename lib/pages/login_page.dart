import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vehicle_campro/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final userNameTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Get.toNamed(Routes.getCameraPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text('VCP',
                  style: TextStyle(
                      color: Color(0xFF36BFA6),
                      fontSize: 64,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'VEHICLE CAM PRO',
                style: TextStyle(
                    color: Color(0xFF36BFA6),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/quadraatlogo.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(left: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  )
                                ]),
                            child: TextFormField(
                              controller: userNameTextEditingController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Username is required';
                                }
                              },
                              decoration: const InputDecoration(
                                label: Text('Username'),
                                labelStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                // focusedBorder: OutlineInputBorder(
                                //   borderSide:
                                //       BorderSide(color: Color(0xFF36BFA6)),
                                // ),
                                // hintText: ('Enter username')
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: TextFormField(
                            controller: passwordTextEditingController,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is required';
                              }
                            },
                            decoration: const InputDecoration(
                              label: Text('Password'),
                              labelStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF36BFA6)),
                              ),
                              //  hintText: ('Enter password')
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            _submitForm();
                          },
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xFF36BFA6),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                                child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
