import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pinput/pinput.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import '../features/screens/bottomNavigation.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isValidated = false;
  TextEditingController OtpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Image.asset(Images.logo),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Enter OTP",
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 30,
                    color: AppColors.HeaderTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),

                // OTPTextField(
                //     //controller: otpController,
                //     length: 5,
                //
                //
                //     width: MediaQuery.of(context).size.width*0.7,
                //     textFieldAlignment: MainAxisAlignment.spaceAround,
                //     fieldWidth: 30,
                //
                //     fieldStyle: FieldStyle.underline,
                //     outlineBorderRadius: 15,
                //     style: TextStyle(fontSize: 17,),
                //    ),

               /* OTPTextField(

                  length: 5,

                  width: MediaQuery.of(context).size.width*0.6,


                  fieldWidth: 30,
                  style: TextStyle(
                      fontSize: 17,


                  ),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,

                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),*/
                // OtpTextField(
                //   numberOfFields: 5,
                //   borderColor: Color(0xff878787),
                //   focusedBorderColor: Color(0xff878787),
                //   // styles: otpTextStyles,
                //   showFieldAsBox: false,
                //   borderWidth: 4.0,
                //   //runs when a code is typed in
                //   onCodeChanged: (String code) {
                //     //handle validation or checks here if necessary
                //   },
                //   //runs when every textfield is filled
                //   onSubmit: (String verificationCode) {},
                // ),

                 Pinput(
                  length: 5,
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "OTP expires in : 53 sec",
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 19,
                    color: Color(0xff1D1D1D),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                MaterialButton(
                    onPressed: () {
                      // Get.to(BottomNaigation());
                      Get.toNamed('/bottom');
                    },
                    color: AppColors.ButtonColor,
                    textColor: Colors.black,
                    minWidth: 320,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text("Submit",
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: AppColors.ButtonTextColor,
                            fontWeight: FontWeight.w500))),
                SizedBox(
                  height: 30,
                ),
                Text("Resend",
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        color: AppColors.HeaderTextColor,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
