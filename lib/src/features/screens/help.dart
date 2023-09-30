import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/colors.dart';
import '../../constants/helper.dart';
import '../../constants/images.dart';
import 'about_us.dart';



class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final Uri _url = Uri.parse('https://aheadly.ng/');



  String _isselect = "1";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          title: Text("Help",
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isselect="1";
                              var command = Uri.parse("tel://+91 9301500430");
                              customLaunch(command);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color:_isselect=="1"? Color(0xffEA2D63
                                ):Colors.transparent),
                                color:_isselect=="1"? Color(0XFFfdeaef):Colors.transparent
                            ),
                            child: Column(
                              children: [
                                Image.asset(Images.callus,
                                  height: 70,width: 50,),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Call US",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.greycolor),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isselect="2";
                              var command = Uri.parse("tel://+91 8120520054");
                              customLaunch(command);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color:_isselect=="2"? Color(0xffEA2D63
                                ):Colors.transparent),
                                color:_isselect=="2"? Color(0XFFfdeaef):Colors.transparent
                            ),
                            child: Column(
                              children: [
                                Image.asset(Images.contactus,
                                  height: 70,width: 50,),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Contact US",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.greycolor),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isselect="4";
                              Helper.moveToScreenwithPush(context, Aboutscreen());
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color:_isselect=="4"? Color(0xffEA2D63
                                ):Colors.transparent),
                                color:_isselect=="4"? Color(0XFFfdeaef):Colors.transparent
                            ),
                            child: Column(
                              children: [
                                Image.asset(Images.aboutus,height: 70,width: 50,),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("About Us",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.greycolor),
                                    ))
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       InkWell(
                //         onTap: () {
                //           setState(() {
                //             _isselect="4";
                //             Helper.moveToScreenwithPush(context, AboutUs());
                //           });
                //         },
                //         child: Container(
                //           padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(20),
                //               border: Border.all(color:_isselect=="4"? Color(0xffEA2D63
                //               ):Colors.transparent),
                //               color:_isselect=="4"? Color(0XFFfdeaef):Colors.transparent
                //           ),
                //           child: Column(
                //             children: [
                //               Image.asset(ProjectImage.aboutus,height: 70,),
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Text("About Us",
                //                   style: GoogleFonts.poppins(
                //                     textStyle: TextStyle(
                //                         fontSize: 16,
                //                         fontWeight: FontWeight.w500,
                //                         color: AppColor.textclr),
                //                   ))
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 14,
                ),
                InkWell(
                  // onTap: () {
                  //   setState(() {
                  //     _isselect="3";
                  //   });
                  // },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:_isselect=="3"? Color(0xffEA2D63
                        ):Colors.transparent),
                        color:_isselect=="3"? Color(0XFFfdeaef):Colors.transparent
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image.asset(Images.address,height: 50,),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Address",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greycolor),
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 200,
                          child: Text("Vijay Nagar is a major Residential area and commercial hub of Indore, and its PIN Code is 452010. Vijay Nagar is the part of Greater Indore located in the eastern part of the City..",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greycolor),
                              )),
                        )
                      ],
                    ),
                  ),
                ),

                // Expanded(
                //   child: GridView.builder(
                //     shrinkWrap: true,
                //     // physics: NeverScrollableScrollPhysics(),
                //     scrollDirection: Axis.vertical,
                //     itemCount: 8,
                //     gridDelegate:
                //     SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //       crossAxisSpacing: 15.0,
                //       mainAxisSpacing: 10,
                //       childAspectRatio: (4.5 / 4.5),
                //     ),
                //     itemBuilder: (BuildContext context, int index) {
                //
                //       print(
                //           "_relatedModel!.groupList!.length.toString()");
                //       return   InkWell(
                //         onTap: () {
                //           setState(() {
                //             _isselect="1";
                //           });
                //         },
                //         child: Container(
                //           padding: EdgeInsets.symmetric(horizontal: 0,vertical: 20),
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(20),
                //               border: Border.all(color:_isselect=="1"? Color(0xffEA2D63
                //               ):Colors.transparent),
                //               color:_isselect=="1"? Color(0XFFfdeaef):Colors.transparent
                //           ),
                //           child: Column(
                //             children: [
                //               Image.asset(_details[index].image,height: 70,),
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Text(_details[index].text,
                //                   style: GoogleFonts.poppins(
                //                     textStyle: TextStyle(
                //                         fontSize: 16,
                //                         fontWeight: FontWeight.w500,
                //                         color: AppColor.textclr),
                //                   ))
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // )

              ],
            ),
          ),
        ),

      ),
    );
  }

  Future<void> customLaunch(command) async {
    if (await canLaunchUrl(command)) {
      await launchUrl(command);
    } else {
      print(' could not launch $command');
    }
  }


}

class Details {
  String image = "";
  String text = "";
  Details({required this.image, required this.text});
}
