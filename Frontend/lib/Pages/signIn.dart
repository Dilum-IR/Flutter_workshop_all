import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:session2/Pages/signUp.dart';

import '../API_connection/API_connection.dart';
import '../bottomNavigationBar.dart';
import 'package:http/http.dart' as http;

class Signin_page extends StatefulWidget {
  const Signin_page({Key? key}) : super(key: key);

  @override
  State<Signin_page> createState() => _Signin_pageState();
}

class _Signin_pageState extends State<Signin_page> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isVisibility = true.obs;

  late String userName;
  var getData = false;

  void userSignIn() async {
    try {
      print(emailController.text.trim());
      var response = await http.post(Uri.parse(API.signin), body: {
        "username": emailController.text.trim(),
        "password": passwordController.text.trim(),
      });
      print("Status code: ${response.statusCode}");

      if (response.statusCode == 200) {
        var resBodySignIn = jsonDecode(response.body);
        print(resBodySignIn);
        if (resBodySignIn['login_success'] == true) {
          userName = resBodySignIn['user'];
          print("$userName\n");
          Fluttertoast.showToast(msg: "Sign In Successfully..");
          Get.to(BotomNavigationBar());
          emailController.text = "";
          passwordController.text = "";
          setState(() {
            getData = false;
          });
        } else {
          Fluttertoast.showToast(msg: "Sign In Unsuccessfully..");
          setState(() {
            getData = false;
          });
        }
      } else {
        print("Status code: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

// form border style
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
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: cons.maxHeight,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: Image.network(
                              "http://lovesrilanka.org/wp-content/uploads/2020/04/LS_Ella_Main_Desktop_1920x700.jpg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                                  // sign in Form
                                  Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        // Form Email
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
                                                    vertical: 6),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),

                                        // Form Password
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

                                        // Sign In button
                                        Material(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: InkWell(
                                            onTap: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                userSignIn();
                                                // Get.to(
                                                //     const BotomNavigationBar(),
                                                //     transition:
                                                //         Transition.size);
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
                                                "Sign In",
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
                                        "Don't have an account ?",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      // Sign Up Button (Don't have account)
                                      TextButton(
                                        onPressed: () {
                                          Get.to(const Signup_page());
                                        },
                                        child: const Text(
                                          "Sign Up Here",
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Forget Password?
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Forget Password",
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
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
