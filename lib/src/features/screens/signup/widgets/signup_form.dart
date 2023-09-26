import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/colors.dart';
import '../../../controllers/signup_controller.dart';
import '../../../controllers/splash_controller.dart';

class SignupForm extends StatelessWidget {
   SignupForm({
    Key? key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;
  final signUpController=Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: TextFormField(
              controller: signUpController.nameController.value,
              //obscureText: true,
              decoration: InputDecoration(
                fillColor: AppColors.FillColor,
                filled: true,
                hintText: "Name",
                hintStyle: GoogleFonts.roboto(color: AppColors.HintTextColor),
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
              onChanged: (value) {

                signUpController.validatename(value);
              },
              // validator: (name){
              //   if (name!.isEmpty) {
              //     return "Enter name";
              //     // ToastMessage.msg("Please enter phone number");
              //   }
              //   else if (name.length !> 2) {
              //     return "Enter valid name";
              //     // ToastMessage.msg("Mobile Number must be of 10 digit");
              //   }
              // },
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: TextFormField(
               controller: signUpController.addressController.value,
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

              onChanged: (value) {

                signUpController.validateaddress(value);
              },

              // validator: (address){
              //   if (address!.isEmpty) {
              //     return "Enter address";
              //     // ToastMessage.msg("Please enter phone number");
              //   }
              //   else if (address.length !> 2) {
              //     return "Enter valid address";
              //     // ToastMessage.msg("Mobile Number must be of 10 digit");
              //   }
              // },
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: TextFormField(
               controller: signUpController.emailController.value,
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
              validator: (value){
                if(value!.isEmpty){ return "Please enter email";
                }else if(EmailValidator.validate(value.trim())){
                  return null;
                }else{
                  return"Invalid email address";
                }
              },
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: TextFormField(
               controller: signUpController.mobileController.value,
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
              onChanged: (value) {

                signUpController.validatePhoneNumber(value);
              },
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}