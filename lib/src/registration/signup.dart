import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/images.dart';
import '../features/models/sign_up_model.dart';
import '../features/screens/signup/widgets/signup_bottom.dart';
import '../features/screens/signup/widgets/signup_form.dart';
import '../features/screens/signup/widgets/signup_header.dart';
import 'log_in_screen.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //header part
                  SignupHeader(model: SignupModel(headertext: 'Sign up'),),

                  SizedBox(
                    height: 20,
                  ),
                  //form part
                  SignupForm(formKey: _formKey),
                 //footer part
                 //  SignupBottom(model: SignupModelfooter(footertext: 'Sign up'),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
