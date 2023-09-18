import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pinput/pinput.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import '../features/screens/bottomNavigation.dart';
import '../features/screens/otp/widgets/otp_footer.dart';
import '../features/screens/otp/widgets/otp_form.dart';
import '../features/screens/otp/widgets/otp_header.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isValidated = false;
  TextEditingController OtpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var number= Get.arguments;
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
                //otp header section
                Otpheader(),

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
                //otp form section
                OtpForm(formKey: _formKey),
                //otp footer section
                OtpFooter(number: number.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






