import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';

import '../constants/Api.dart';
import '../constants/colors.dart';
import '../constants/helper.dart';
import '../constants/images.dart';
import '../features/models/sign_up_model.dart';
import '../features/screens/signup/widgets/signup_bottom.dart';
import '../features/screens/signup/widgets/signup_form.dart';
import '../features/screens/signup/widgets/signup_header.dart';
import '../webview.dart';
import 'log_in_screen.dart';
import 'otp_screen.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool _isVisible=false;
  TextEditingController  nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController() ;
  TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
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
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: TextFormField(
                            controller: nameController,
                            textInputAction: TextInputAction.next,
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

                            validator: (name){
                              if (name!.isEmpty) {
                                return "Enter name";
                                // ToastMessage.msg("Please enter phone number");
                              }
                              // else if (name.length !> 2) {
                              //   return "Enter valid name";
                              //   // ToastMessage.msg("Mobile Number must be of 10 digit");
                              // }
                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: addressController,
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


                            validator: (value){
                              if(value!.isEmpty){ return "Please enter your address";
                              }
                              else if(value.length < 8){
                                return "Enter valid address";
                              }
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
                            controller: emailController,
                            textInputAction: TextInputAction.next,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null; // Return null if the field is empty (optional)
                              } else if (EmailValidator.validate(value.trim())) {
                                return null; // Return null if the email is valid
                              } else {
                                return "Invalid email address"; // Return an error message for invalid email
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: TextFormField(
                              controller: mobileController,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
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
                              // onChanged: (value) {
                              //
                              //   signUpController.validatePhoneNumber(value);
                              // },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Please enter your number");
                                }
                                else if (value.length != 10) {
                                  return ("Number must be equal to ten digits");
                                }
                              }

                          ),
                        ),
                        SizedBox(height: 30,),
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
                            InkWell(
                              onTap: () => {
                                HelperClass.moveToScreenwithPush(context, Terms())
                              },
                              child: Text("Privacy Policy",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: AppColors.RedTextColor,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        MaterialButton(
                            onPressed: (){
                              // if (_formKey.currentState!.validate())
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                Helper.checkInternet(phoneCheckWithFirebase());
                              }

                              // print(signUpController.nameController.value.text.toString());
                              // Get.toNamed('/otp');
                              // Get.to(LogInScreen());
                            },
                            color:  Color(0xffD70404),textColor: Colors.black,
                            minWidth: 320,shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                            child:
                            Text("Sign up", style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.displayLarge,
                              fontSize: 20,
                              color: AppColors.ButtonTextColor,
                              fontWeight: FontWeight.bold,
                            ),)

                        ),
                        SizedBox(height: 100,),
                        Center(
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: AppColors.HintTextColor,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: () => {
                                  Get.toNamed('/login')
                                },
                                child: Text("Log In",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: AppColors.RedTextColor,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(child: Helper.getProgressBar(context, _isVisible))
          ],
        ),
      ),
    );
  }
  setProgress(bool show) {
    setState(() {
      _isVisible = show;
    });
  }

  Future<void> phoneCheckWithFirebase() async{
    setProgress(true);
    //firebase otp code
    // String phone = "+" + countryCodeCreated + phoneController.text.trim();
    String phone = "+91" + mobileController.text.toString();
    //new code start
    final _fireStore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await _fireStore.collection('customer_details').where("customer_phone", isEqualTo: phone).get();
    // final allData =
    // querySnapshot.docs.map((doc) => doc.get('phone')).toList();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print("========all data==========${allData}");

    if (allData.length==0) {
      //new code end
      //firebase otp code
      // String phone = "+" + countryCodeCreated + phoneController.text.trim();
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (credential) {
            setProgress(false);
          },
          verificationFailed: (ex) {
            ToastMessage.msg(ex.code.toString());
            log("ex"+ ex.code.toString());
            setProgress(false);
          },
          codeSent: (verificationId, forceResendingToken) {
            setProgress(false);
            //API to call

            Helper.checkInternet( signUp(verificationId,forceResendingToken ));
            //  Helper.moveToScreenwithPush(context, OtpVerifyScreen(
            //    forceResendingToken: forceResendingToken,
            //    number: numberController.text.trim(),
            //    verificationId: verificationId,
            //    afterSignUp: true,
            //  ));
          },
          codeAutoRetrievalTimeout: (verificationId) {
            setProgress(false);
          },
          timeout: Duration(seconds: 30)
      );
      //firebase otp code end
      //firebase otp code end
    }
    else{
      FirebaseAuth.instance.signOut();
      ToastMessage.msg("Phone number already registered, Please sign in");
      // Fluttertoast.showToast( msg:"");
      setProgress(false);
    }
  }

   signUp (String verificationId, int? forceResendingToken)async{
    try{
      final response= await post(Uri.parse(Api.signup),
          body: {
            'name':nameController.value.text.toString(),
            'address':addressController.value.text.toString(),
            'email':emailController.value.text.toString(),
            'phone':mobileController.value.text.toString(),
            'device_token':"13446"
          });
      var data = jsonDecode(response.body);
      print(response.statusCode);
      print(data);
      if(response.statusCode == 200){

        if(data['status']== 'true'){
          // Get.snackbar('Your otp is', data['data']['otp']);

          Helper.moveToScreenwithPush(context, OtpScreen(
            forceResendingToken: forceResendingToken,
            number: mobileController.text.trim(),
            verificationId: verificationId,
            afterSignUp: true,
          ));
        }
        else{
          Get.snackbar('Something went wrong', data['message']);
        }
      }
      else{
        Get.snackbar('Exception', 'something went wrong');
      }
    }
    catch(e){
      Get.snackbar('Exception', e.toString());
    }
  }

}
