// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_final_fields, avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/authentication/phone_auth.dart';
import 'package:ecommerce_app/authentication/sign_up.dart';
import 'package:ecommerce_app/pages/home.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/db_services.dart';
import 'package:ecommerce_app/theme/app_theme.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';
import 'package:ecommerce_app/helper/helperFun.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscureText = true;
  String email = "";
  String password = "";

  final _formKey = GlobalKey<FormState>();

  // final _emailController = TextEditingController();
  // final _nameController = TextEditingController();
  // final _pwdController = TextEditingController();
  bool _isLoading = false;
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ),
            )
          : SingleChildScrollView(
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign in Now",
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "To get exciting products \n at you doorstep!",
                    style: AppTheme.appText(
                      size: 14,
                      weight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SvgPicture.asset(
                    "assets/auth/sign_in.svg",
                    // "/auth/sign_in.svg",
                    height: 150,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          height: 60,
                          padding: EdgeInsets.only(left: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade300,
                            boxShadow: AppTheme.textFieldShadow,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Email";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            cursorColor: AppTheme.primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            // controller: _emailController,
                            obscureText: false,
                            style: AppTheme.appText(
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: AppTheme.primaryColor,
                              ),
                              hintText: "Email",
                              hintStyle: AppTheme.appText(
                                size: 14,
                                weight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          height: 60,
                          padding: EdgeInsets.only(left: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade300,
                            boxShadow: AppTheme.textFieldShadow,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return "Enter strong password";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                            cursorColor: AppTheme.primaryColor,
                            keyboardType: TextInputType.text,
                            // controller: _pwdController,
                            obscureText: _obscureText,
                            style: AppTheme.appText(
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: AppTheme.primaryColor,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: _obscureText
                                      ? Colors.grey
                                      : AppTheme.primaryColor,
                                ),
                              ),
                              hintText: "Password",
                              hintStyle: AppTheme.appText(
                                size: 14,
                                weight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      signIn();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 60,
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: AppTheme.buttonShadow,
                      ),
                      // margin: EdgeInsets.all(),
                      child: Center(
                        child: Text(
                          "SIGN IN",
                          style: AppTheme.appText(
                            size: 18,
                            weight: FontWeight.w600,
                            color: AppTheme.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "OR",
                    style: AppTheme.appText(size: 16, weight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: () {
                      nextScreen(context, PhoneAuth());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 60,
                      height: 60,
                      child: Card(
                        color: AppTheme.whiteColor,
                        shadowColor: AppTheme.blackColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              width: 1,
                              color: Colors.grey.shade500,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              // "/icons/phone.png",
                              "assets/icons/phone.png",
                              height: 25,
                              width: 25,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Signin with Phone Number",
                              style: AppTheme.appText(
                                size: 14,
                                weight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: AppTheme.appText(
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          nextScreen(context, SignUp());
                        },
                        child: Text(
                          "SignUp",
                          style: AppTheme.appText(
                              size: 16,
                              weight: FontWeight.bold,
                              color: AppTheme.primaryColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
    );
  }

  signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authServices
          .signinWithEmailAndPassword(email, password)
          .then((value) async {
        if (value == true) {
          //querysnp returns a  list of documents which satisfies a condition
          QuerySnapshot snapshot = await DatabaseServices(
                  uid: FirebaseAuth.instance.currentUser!.uid)
              .getUserData(email);
          // saving the values to our shared preferences
          await helperFun.saveUserLoggedInStatus(true);
          await helperFun.saveUserEmailSp(email);
          await helperFun.saveUserNameSp(snapshot.docs[0]['fullName']);
          nextScreenReplacement(context, const Home());
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
