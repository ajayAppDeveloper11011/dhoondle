import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/images.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Images.logo,height: 100,width: 100,),
        SizedBox(height: 20,),
        Text("Signup" ,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 30),
          ),),
      ],
    );
  }
}