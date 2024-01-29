import 'package:ecommerce_app/authentication/phone_auth.dart';
import 'package:ecommerce_app/pages/home.dart';
import 'package:ecommerce_app/theme/app_theme.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:svg_flutter/svg.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  bool _isLoading = false;
  String otp = '';
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final _defaultPinTheme = PinTheme(
      width: 56,
      height: 50,
      textStyle: TextStyle(
        fontSize: 20,
        color: AppTheme.primaryColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
    );
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.grey.shade600,
            size: 26,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ),
            )
          : SingleChildScrollView(
              padding:
                  EdgeInsets.only(left: 25, right: 25, bottom: 20, top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/auth/enter_otp.svg",
                    // "/auth/enter_otp.svg",
                    height: 180,
                  ),
                  Text(
                    "Verify Phone Number",
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
                    "Enter the OTP sent on \nyour registered number!",
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
                    child: Pinput(
                      length: 6,
                      showCursor: true,
                      defaultPinTheme: _defaultPinTheme,
                      onChanged: (value) {
                        setState(() {
                          otp = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          // Create a PhoneAuthCredential with the code
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                            verificationId: PhoneAuth.verify,
                            smsCode: otp,
                          );
                          // Sign the user in (or link) with the credential
                          await auth.signInWithCredential(credential);
                          nextScreenReplacement(context, Home());
                        } catch (e) {
                          print("Incorrect OTP!");
                        }
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
                          "Verify",
                          style: AppTheme.appText(
                            size: 18,
                            weight: FontWeight.w500,
                            color: AppTheme.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Edit phone number?",
                      style: AppTheme.appText(
                        size: 16,
                        weight: FontWeight.w500,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
