import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../api_model/login_api_model.dart';
import '../../constants/Api.dart';

class LoginController extends GetxController{
  final formKey = GlobalKey<FormState>();
  LoginOtp?_loginOtp;

  final phoneNumber = ''.obs;
  final isValid = RxBool(false);
  static LoginController get find =>Get.find();
  final mobileController = TextEditingController().obs;





  // String? validateEmail(String value) {
  //   if (!GetUtils.isEmail(value)) {
  //     return "Provide valid Email";
  //   }
  //   return null;
  // }

  void validatePhoneNumber(String value) {
    // Implement your validation logic here
    if (value.length == 10) {
      isValid.value = true;

    } else {
      isValid.value = false;
    }

  }
  void checkLogin() {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        // Validation passed, you can proceed with your logic here
        formKey.currentState!.save();

      }
    }
  }


  void login() async{
    print("================login api=============");
    try{
      final response= await post(Uri.parse(Api.login),
          body: {
            'number':mobileController.value.text.toString(),
            'device_token':"13446"
          }
          );
      var data = jsonDecode(response.body);



      print(response.statusCode);
      print(data);

      if(response.statusCode == 200){
        LoginOtp model = LoginOtp.fromJson(data);
        if(model.status == 'true'){
          Get.snackbar('Your otp is',model!.data!.otp.toString());

          Get.toNamed('/otp',arguments: mobileController.value.text.toString());
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


  //  validateData() {
  //   isValid.value = _isValidData(mobileController.value.text.toString());
  // }

  // bool _isValidData(String phone) {
  //   if (phone!.isEmpty) {
  //     return false;
  //     // ToastMessage.msg("Please enter phone number");
  //   } else if (phone.length < 10) {
  //     return false;
  //     // ToastMessage.msg("Mobile Number must be of 10 digit");
  //   }
  //   return true;
  //   // Implement your validation logic here
  //   // Return true if data is valid, otherwise return false
  // }
}


  // validationslogin(phone){
  //     if (phone!.isEmpty) {
  //       return "Please enter phone number";
  //       // ToastMessage.msg("Please enter phone number");
  //     } else if (phone.length != 10) {
  //       return "Mobile Number must be of 10 digit";
  //       // ToastMessage.msg("Mobile Number must be of 10 digit");
  //     }
  //   }


