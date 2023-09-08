import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/text.dart';
import '../../registration/otp_screen.dart';
import 'become_service_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: ClipRect(
            child: Image.asset(
              Images.logo,
              height: 200,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(TextScreen.Home,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            )),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(25),
        //     child: Image.asset(Images.search,),
        //   ),
        // ],
      ),
      body: Container(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [

                  Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: _image == null
                            ? ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: "",
                              fit: BoxFit.fill,
                              width: 90,
                              height: 90,
                              placeholder: (context, url) =>
                                  LinearProgressIndicator(
                                    color: Colors.white.withOpacity(0.2),
                                    backgroundColor: Colors.white.withOpacity(.5),
                                  ),
                              errorWidget: (context, url, error) => Container(
                                width: 80,
                                height: 80,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: Color(0xFFD9D9D9),
                                ),
                                child: Center(
                                    child: Image.asset(
                                      Images.man,
                                      height: 100,
                                      width: 100,
                                    )),
                              ),
                            ))
                            : ClipOval(
                          child: Image.file(_image!,
                              height: 120, width: 120, fit: BoxFit.fill),
                        ),
                      ),
                      Positioned(
                        left: 70,
                        top: 70,
                        child: InkWell(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Image.asset(Images.edit),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(TextScreen.John,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: AppColors.txtgreyclr,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Divider(
                  color: Color(0xffB8B8B8),
                ),
              ),
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
              Text(TextScreen.log_out,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
            ],
          ),
        ) ,
      ),
    );
  }

  _imgFromCamera() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    setState(() {
      _image = File(image!.path);
    });
  }

  _imgFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    // _image=_cropImage(image);
    setState(() {
      _image = File(image!.path);
      String path = _image.toString();
      print("path" + _image!.path);
    });

    // Helper.checkInternet(uploadImage(_image!.path));
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        // Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      // Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
