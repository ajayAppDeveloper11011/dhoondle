import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import 'otp_screen.dart';



class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(Images.logo),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 30,
                      color: AppColors.HeaderTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      // controller: MobileController,
                      //obscureText: true,
                      decoration: InputDecoration(
                        fillColor: AppColors.FillColor,
                        filled: true,
                        hintText: "Mobile",
                        hintStyle:
                            GoogleFonts.roboto(color: AppColors.HintTextColor),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffBFBFBF)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffBFBFBF)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffBFBFBF)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Color(0xffBFBFBF))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Color(0xffBFBFBF))),
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(20),
                        //     borderSide: new BorderSide(color: Color(0xffBFBFBF))
                        // )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      // Get.to(OtpScreen());
                      Get.toNamed('/otp');
                    },
                    color: AppColors.ButtonColor,
                    textColor: Colors.black,
                    minWidth: 320,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      'Log In',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20,
                        color: AppColors.ButtonTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("By continuing, you agree to the",
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: AppColors.HintTextColor,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Privacy Policy",
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: AppColors.RedTextColor,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do not have an account",
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: AppColors.HintTextColor,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Signup",
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: AppColors.RedTextColor,
                              fontWeight: FontWeight.w500)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
