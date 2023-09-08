import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';

class PlumberScreen extends StatefulWidget {
  const PlumberScreen({super.key});

  @override
  State<PlumberScreen> createState() => _PlumberScreenState();
}

class _PlumberScreenState extends State<PlumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Image.asset(
            Images.logo,
            height: 200,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        title: Text('Plumbers',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color:Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          // width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.17,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:  Images.profile_new,
                                      fit: BoxFit.fill,
                                      width: 90,
                                      height: 90,
                                      placeholder: (context, url) =>
                                          LinearProgressIndicator(
                                        color: Colors.white.withOpacity(0.2),
                                        backgroundColor:
                                            Colors.white.withOpacity(.5),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        width: 80,
                                        height: 80,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          // color: Color(0xFFD9D9D9),
                                        ),
                                        child: Center(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Image.asset(
                                          Images.profile_new,
                                          height: 100,
                                          width: 100,
                                        ),
                                            )),
                                      ),
                                    ),

                                    // Image.asset(ProjectImage.profile,height: 102,width: 120,),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("John Doe",
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Color(0xff4C4C4C),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Plumbing",
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff4C4C4C))),
                                        Row(
                                          children: [
                                            FlutterRating(
                                              rating: 4,
                                              starCount: 5,
                                              borderColor: Colors.yellow,
                                              color: Color(0xffFFC121),
                                              allowHalfRating: true,
                                              size: 20,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              onRatingChanged: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            SizedBox(width: 5,),

                                            // RatingBar.builder(
                                            //   unratedColor: ,
                                            //   initialRating: 4,
                                            //   minRating: 1,
                                            //   direction: Axis.horizontal,
                                            //   allowHalfRating: true,
                                            //   itemCount: 5, itemSize: MediaQuery.of(context).size.height*0.03,
                                            //   itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                            //   itemBuilder: (context, _) => Icon(
                                            //     Icons.star,
                                            //     size: 10,
                                            //     color: Color(0xffFFC121),
                                            //   ),
                                            //   onRatingUpdate: (rating) {
                                            //     print(rating);
                                            //   },
                                            // ),
                                            //  Image.asset(ProjectImage.star),
                                            Text(
                                              "4.0",
                                              style: GoogleFonts.poppins(
                                                  color: Color(0xff4E4E4E),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Images.Telephone,
                                      height: 32,
                                      width: 32,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      Images.Whatsapp,
                                      height: 32,
                                      width: 32,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
  showAlertDailog() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(),
            content:
            Container(
              height: 230,
              width: 200,
              //width: MediaQuery.of(context).size.width,
             // decoration: BoxDecoration(
               //    color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(Images.delete),


                    ),
                    SizedBox(height: 15,),
                    Text("Off for sometime ?", style: GoogleFonts.poppins(
                        color: Color(0xff4C4C4C),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),),
                    SizedBox(height: 40,),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),color: AppColors.PopButtonColor ),


                          child: Center(child: Text("Yes",style: GoogleFonts.poppins(
                              color: AppColors.ButtonTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),



                         // TextStyle(color: Color(0xffFFFFFF)),
                    )
                          ),

                        ),
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),color: AppColors.PopButtonColor, ),
                          child: Center(child: Text("No",style:GoogleFonts.poppins(
                              color: AppColors.ButtonTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),

                          //TextStyle(color: Color(0xffFFFFFF)),
                          )
                          ),
                          height: 40,
                          width: 110,


                        ),



                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
        );
  }
}
