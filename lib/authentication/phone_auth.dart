// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:ecommerce_app/authentication/otp.dart';
import 'package:ecommerce_app/theme/app_theme.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  static String verify = '';
  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _countryController = TextEditingController();
  String phone = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countryController.text = "+91";
  }

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
                  EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/auth/enter_otp.svg",
                    // "/auth/enter_otp.svg",
                    height: 180,
                  ),
                  Text(
                    "Sign in with \nPhone Number",
                    style: AppTheme.appText(
                      size: 20,
                      weight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "You need to register your phone number before getting started !",
                    style: AppTheme.appText(
                      size: 12,
                      weight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 60,
                      height: 60,
                      padding: EdgeInsets.only(left: 2, bottom: 2, top: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            child: TextFormField(
                              style: AppTheme.appText(
                                size: 16,
                                weight: FontWeight.w400,
                              ),
                              controller: _countryController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: AppTheme.appText(
                                  size: 16,
                                  weight: FontWeight.w400,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "|",
                            style: AppTheme.appText(
                              size: 30,
                              weight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              style: AppTheme.appText(
                                size: 16,
                                weight: FontWeight.w400,
                              ),
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Phone",
                                hintStyle: AppTheme.appText(
                                  size: 16,
                                  weight: FontWeight.w400,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  phone = value;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Phone Number";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '${_countryController.text + phone}',
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            PhoneAuth.verify = verificationId;
                            nextScreen(context, Otp());
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      }
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
                          "Send OTP",
                          style: AppTheme.appText(
                            size: 18,
                            weight: FontWeight.w500,
                            color: AppTheme.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
