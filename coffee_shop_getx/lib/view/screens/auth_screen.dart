import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/global_constants.dart';
import '../../controllers/auth_controller.dart';

class AuthScreen extends StatelessWidget {
  late AuthController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find<AuthController>();
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: authbackcolor,
      body: Container(
        padding:  EdgeInsets.all(30.0),
        child: ListView(
          children: [
             Center(
              child: Text("Coffee Shop",
                  style: titlestyle),
            ),
             SizedBox(height: size.height*.12),
            Form(
              key: controller.globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white24),
                      ),
                      filled: true,
                      fillColor: Colors.white24,
                      labelText: "Name",
                      labelStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(
                        color: Colors.red, ),
                    validator: (String? val) =>
                        val!.trim().isEmpty ? "Please insert name" : null,
                    onSaved: (String? value) {
                      controller.name = value!;
                    },
                  ),
                   SizedBox(height:  size.height*.03),
                  TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white24),
                      ),
                      filled: true,
                      fillColor: Colors.white24,
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(
                        color: Colors.red,),
                    validator: (String? val) =>
                        val!.trim().isEmpty ? "Please insert email" : null,
                    onSaved: (String? value) {
                      controller.email = value!;
                    },
                  ),
                   SizedBox(height:size.height*.03),
                  Obx(
                    () => TextFormField(
                      obscureText: controller.isObsecure.value,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white24),
                        ),
                        filled: true,
                        fillColor: Colors.white24,
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(color: Colors.white),
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.toggleObsecure();
                          },
                          child: controller.isObsecure.value
                              ? Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                      style: const TextStyle(
                          color: Colors.red),
                      validator: (String? val) =>
                          val!.trim().isEmpty ? "Please insert password" : null,
                      onSaved: (String? value) {
                        controller.password = value!;
                      },
                    ),
                  ),
                   SizedBox(height:size.height*.08),
                  ElevatedButton(
                    onPressed: () {
                      controller.saveSession();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Center(child: Text("Submit")),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
