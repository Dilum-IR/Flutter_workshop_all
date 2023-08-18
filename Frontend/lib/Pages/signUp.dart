import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:session2/Pages/signIn.dart';

import '../API_connection/API_connection.dart';
import 'package:http/http.dart' as http;

class Signup_page extends StatefulWidget {
  const Signup_page({Key? key}) : super(key: key);

  @override
  State<Signup_page> createState() => _Signup_pageState();
}

class _Signup_pageState extends State<Signup_page> {
  var formKey = GlobalKey<FormState>();
  var fnameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var isVisibility = true.obs;

  // email validation Process => is this email used or not
  // validateEmail() async {
  //   try {
  //     var response = await http.post(Uri.parse(API.emailValidate), body: {
  //       'user_email': emailController.text.trim().toString(),
  //     });
  //     // response is success code is 200
  //     print(response.statusCode);
  //
  //     if (response.statusCode == 200) {
  //       var resBody = jsonDecode(response.body);
  //       print(resBody);
  //
  //       // get response is true it mean email is already use someone
  //       if (resBody['emailFound'] == true) {
  //         Fluttertoast.showToast(
  //             msg: "Email is already in someone else use. Try another email");
  //       } else {
  //         // register the new users
  //
  //         if (passwordController.text.trim().toString() ==
  //             rePasswordController.text.trim().toString()) {
  //           registerUserRecord();
  //         } else {
  //           Fluttertoast.showToast(msg: "Your Passwords are not same");
  //         }
  //       }
  //     } else {
  //       print(response.statusCode);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     Fluttertoast.showToast(msg: e.toString());
  //   }
  // }

  void checkSamePwd() {
    if (passwordController.text.trim().toString() ==
        rePasswordController.text.trim().toString()) {
      registerUserRecord();
    } else {
      Fluttertoast.showToast(msg: "Your Passwords are not same");
    }
  }

  // Registration process
  void registerUserRecord() async {
    try {
      var response = await http.post(Uri.parse(API.signup), body: {
        "user_firstname": fnameController.text.trim(),
        "user_email": emailController.text.trim(),
        "user_password": passwordController.text.trim(),
        "user_phone": phoneController.text.trim()
      } //Convert to Json format
          );

      // response is success code is 200
      if (response.statusCode == 200) {
        var resBodySignUp = jsonDecode(response.body);

        // get response is true it mean email is already use someone
        if (resBodySignUp['success'] == true) {
          Fluttertoast.showToast(
              msg: "Congratulations!.. Your sign Up Process is Successfully..");
          Get.to(const Signin_page());
        } else {
          Fluttertoast.showToast(
              msg: "Your sign Up is Unsuccessfully..Try Again ");
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  var formBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
    borderSide: BorderSide(
      color: Colors.white60,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, cons) {
            return Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.network(
                      "http://lovesrilanka.org/wp-content/uploads/2020/04/LS_Ella_Main_Desktop_1920x700.jpg"),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: cons.maxHeight,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 270, 20, 0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white24,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, -3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // sign up Form
                                  Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        // first name
                                        TextFormField(
                                          controller: fnameController,
                                          validator: (value) => value == ""
                                              ? "Please Enter First name"
                                              : null,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                              Icons.person,
                                              color: Color(0xff063970),
                                            ),
                                            hintText: "First Name ...",
                                            border: formBorder,
                                            enabledBorder: formBorder,
                                            focusedBorder: formBorder,
                                            disabledBorder: formBorder,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 40,
                                              vertical: 6,
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),

                                        // Email
                                        TextFormField(
                                          controller: emailController,
                                          validator: (value) => value == ""
                                              ? "Please Enter Email"
                                              : null,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                              Icons.email,
                                              color: Color(0xff063970),
                                            ),
                                            hintText: "Email ...",
                                            border: formBorder,
                                            enabledBorder: formBorder,
                                            focusedBorder: formBorder,
                                            disabledBorder: formBorder,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 40,
                                              vertical: 6,
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),

                                        // Phone Number
                                        TextFormField(
                                          controller: phoneController,
                                          validator: (value) => value == ""
                                              ? "Please Enter Phone number"
                                              : null,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                              Icons.phone,
                                              color: Color(0xff063970),
                                            ),
                                            hintText: "Phone Number ...",
                                            border: formBorder,
                                            enabledBorder: formBorder,
                                            focusedBorder: formBorder,
                                            disabledBorder: formBorder,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 40,
                                              vertical: 6,
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),

                                        // password
                                        Obx(
                                          () => TextFormField(
                                            controller: passwordController,
                                            validator: (value) => value == ""
                                                ? "Please Enter Password"
                                                : null,
                                            obscureText: isVisibility.value,
                                            // using for password Secure
                                            decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                Icons.key,
                                                color: Color(0xff063970),
                                              ),
                                              hintText: "Password ...",
                                              border: formBorder,
                                              enabledBorder: formBorder,
                                              focusedBorder: formBorder,
                                              disabledBorder: formBorder,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 40,
                                                      vertical: 6),
                                              fillColor: Colors.white,
                                              filled: true,
                                              suffixIcon: Obx(
                                                () => GestureDetector(
                                                  onTap: () {
                                                    isVisibility.value =
                                                        !isVisibility.value;
                                                  },
                                                  child: Icon(
                                                    isVisibility.value
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color: Color(0xff063970),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),

                                        // Re-Password
                                        Obx(
                                          () => TextFormField(
                                            controller: rePasswordController,
                                            validator: (value) => value == ""
                                                ? "Please Enter Password"
                                                : null,
                                            obscureText: isVisibility.value,
                                            // using for password Secure
                                            decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                Icons.key,
                                                color: Color(0xff063970),
                                              ),
                                              hintText: "Re-Password ...",
                                              border: formBorder,
                                              enabledBorder: formBorder,
                                              focusedBorder: formBorder,
                                              disabledBorder: formBorder,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 40,
                                                      vertical: 6),
                                              fillColor: Colors.white,
                                              filled: true,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),

                                        // sign up button
                                        Material(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: InkWell(
                                            onTap: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                // sign up process
                                                // validateEmail();
                                                checkSamePwd();
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg: "Try Again");
                                              }
                                            },
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 15,
                                                horizontal: 40,
                                              ),
                                              child: Text(
                                                "Sign Up",
                                                style: TextStyle(
                                                  color: Color(0xff063970),
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Already have an account ?",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      // Sign Up Button (Don't have account)
                                      TextButton(
                                        onPressed: () {
                                          Get.to(const Signin_page());
                                        },
                                        child: const Text(
                                          "Sign In Here",
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
