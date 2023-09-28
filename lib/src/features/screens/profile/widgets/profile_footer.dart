import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/text.dart';
import '../../../controllers/logout_controller.dart';

class ProfileFooter extends StatelessWidget {
   ProfileFooter({
    Key? key,
  }) : super(key: key);
  final logoutController=Get.put(LogOutController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => {
            Get.toNamed('/becomeservice')
            // Get.to(BecomeServiceProvider())
            // becomeservice
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: 40,
            child: Text(TextScreen.become,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: AppColors.txtgreyclr,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Divider(
            color: Color(0xffB8B8B8),
          ),
        ),
        Text(TextScreen.transaction,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: AppColors.txtgreyclr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Divider(
            color: Color(0xffB8B8B8),
          ),
        ),
        Text(TextScreen.term,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: AppColors.txtgreyclr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Divider(
            color: Color(0xffB8B8B8),
          ),
        ),
        Text(TextScreen.help,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: AppColors.txtgreyclr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Divider(
            color: Color(0xffB8B8B8),
          ),
        ),
        Text(TextScreen.about_us,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: AppColors.txtgreyclr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Divider(
            color: Color(0xffB8B8B8),
          ),
        ),
        InkWell(
          onTap: () => {
            logoutController.logoutApi()
          },
          child: Text(TextScreen.log_out,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
        ),
      ],
    );
  }
}