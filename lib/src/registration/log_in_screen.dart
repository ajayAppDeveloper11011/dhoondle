import 'package:dhoondle/src/features/models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import '../features/screens/login/widgets/login_footer.dart';
import '../features/screens/login/widgets/login_form.dart';
import '../features/screens/signup/widgets/signup_header.dart';
import 'otp_screen.dart';



class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
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
                  //signup header
                  SignupHeader(model: SignupModel(headertext: 'Welcome'),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.04,
                  ),
                  //form section
                  LoginForm(formKey: _formKey),


                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),

                  //footer section
                  FooterLogin()

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




