import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/colors.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: TextField(
              // controller: MobileController,
              //obscureText: true,
              decoration: InputDecoration(
                fillColor: AppColors.FillColor,
                filled: true,
                hintText: "Name",
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
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: TextField(
              // controller: MobileController,
              //obscureText: true,
              decoration: InputDecoration(
                fillColor: AppColors.FillColor,
                filled: true,
                hintText: "Address",
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
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: TextField(
              // controller: MobileController,
              //obscureText: true,
              decoration: InputDecoration(
                fillColor: AppColors.FillColor,
                filled: true,
                hintText: "Email (Optional)",
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
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(0.0),
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
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}