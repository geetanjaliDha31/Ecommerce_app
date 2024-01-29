// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_final_fields, avoid_print
import 'package:ecommerce_app/authentication/sign_in.dart';
import 'package:ecommerce_app/pages/home.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/theme/app_theme.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:ecommerce_app/helper/helperFun.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;
  bool _obscureConfirmText = false;
  String email = "";
  String password = "";
  String confirmPass = "";
  String fullName = "";
  String dob = "";

  final _formKey = GlobalKey<FormState>();

  // final _emailController = TextEditingController();
  // final _nameController = TextEditingController();
  final _pwdController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _date = TextEditingController();

  bool _isLoading = false;
  AuthServices authServices = AuthServices();

  // FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
                  EdgeInsets.only(left: 15, right: 15, bottom: 12, top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Getting Started!",
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
                    "Create an account to continue ",
                    style: AppTheme.appText(
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 28,
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
                                return "Enter Name";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: AppTheme.primaryColor,
                            keyboardType: TextInputType.name,
                            // controller: _nameController,
                            style: AppTheme.appText(
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                            onChanged: (value) {
                              setState(() {
                                fullName = value;
                              });
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: AppTheme.primaryColor,
                              ),
                              hintText: "Full Name",
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
                              if (value!.isEmpty) {
                                return "Enter Email";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: AppTheme.primaryColor,
                            keyboardType: TextInputType.emailAddress,
                            // controller: _emailController,
                            obscureText: false,
                            style: AppTheme.appText(
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
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
                              if (value!.isEmpty) {
                                return "Enter Birthdate";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: AppTheme.primaryColor,
                            keyboardType: TextInputType.name,
                            controller: _date,
                            onChanged: (value) {
                              setState(() {
                                dob = value;
                              });
                            },
                            style: AppTheme.appText(
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.calendar_today_rounded,
                                color: AppTheme.primaryColor,
                              ),
                              hintText: "Date of Birth",
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
                            onTap: () async {
                              DateTime? pickDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2120),
                                builder: (context, child) {
                                  return Theme(
                                      data: Theme.of(context).copyWith(
                                        splashColor: AppTheme.primaryColor,
                                        colorScheme: const ColorScheme.light(
                                          inverseSurface: AppTheme.blackColor,
                                          primary: AppTheme.primaryColor,
                                          onPrimary: AppTheme.whiteColor,
                                          onSurface: AppTheme.blackColor,
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor:
                                                AppTheme.primaryColor,
                                          ),
                                        ),
                                      ),
                                      child: child!);
                                },
                              );
                              if (pickDate != null) {
                                setState(() {
                                  _date.text =
                                      DateFormat("yyyy-MM-dd").format(pickDate);
                                  dob = _date.text;
                                });
                              }
                            },
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
                              if (value!.isEmpty) {
                                return 'Please re-enter password';
                              }
                              print(_pwdController.text);

                              print(_confirmPassController.text);

                              if (_pwdController.text !=
                                  _confirmPassController.text) {
                                return "Password does not match";
                              }
                              return null;
                            },
                            cursorColor: AppTheme.primaryColor,
                            keyboardType: TextInputType.text,
                            // controller: _confirmPassController,
                            obscureText: _obscureConfirmText,
                            onChanged: (value) {
                              setState(() {
                                confirmPass = value;
                              });
                            },
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
                                    _obscureConfirmText = !_obscureConfirmText;
                                  });
                                },
                                child: Icon(
                                  _obscureConfirmText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: _obscureConfirmText
                                      ? Colors.grey
                                      : AppTheme.primaryColor,
                                ),
                              ),
                              hintText: "Confirm Password",
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
                    height: 55,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        signUp();
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
                          "SIGN UP",
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
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: AppTheme.appText(
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          nextScreen(context, SignIn());
                        },
                        child: Text(
                          "SignIn",
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

  signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
    }
    await authServices
        .registerUserWithEmailAndPassword(
            fullName, email, password, confirmPass, dob)
        .then(
      (value) async {
        if (value == true) {
          await helperFun.saveUserLoggedInStatus(true);
          await helperFun.saveUserNameSp(fullName);
          await helperFun.saveUserEmailSp(email);
          nextScreenReplacement(context, const Home());
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      },
    );
  }
}
