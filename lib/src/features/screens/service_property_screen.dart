import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhoondle/src/features/screens/property_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/text.dart';
import 'add_services.dart';

class ServiceScreenTabbar extends StatefulWidget {
  const ServiceScreenTabbar({Key? key}) : super(key: key);

  @override
  State<ServiceScreenTabbar> createState() => _ServiceScreenTabbarState();
}

class _ServiceScreenTabbarState extends State<ServiceScreenTabbar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar:AppBar(
      //   backgroundColor: AppColors.primaryColor,
      //   leading: Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: Image.asset(Images.logo),
      //   ),
      //   centerTitle: true,
      //   elevation: 0,
      //   title: Text(TextScreen.Home),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(15.0),
      //       child: Image.asset(Images.search,height:size.height*0.1 ,),
      //     ),
      //   ],
      // ) ,
      body: Container(
        height: size.height,
        width: size.width,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => {Get.to(PropertyDetailsScreen())},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffDADADA)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(shape: BoxShape.circle),
                                child: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: Images.man,
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

                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                height:size.width*0.4 ,
                                width: size.width*0.55,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text("John Doe", style: GoogleFonts.poppins(
                                        color: Color(0xff4C4C4C),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18
                                    ),),
                                    Text("Plumbing", style: GoogleFonts.poppins(
                                        color: Color(0xff4C4C4C),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                    ),),
                                    Text("I am a high level of experience in Plumbing Services with best Offer and less time Consumption", style: GoogleFonts.poppins(
                                        color: Color(0xffA7A7A7),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                    ),overflow: TextOverflow.clip,
                                    )
                                    ,
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  Images.eye,
                                  height: size.height * 0.035,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Image.asset(
                                  Images.pencil,
                                  height: size.height * 0.03,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                InkWell(
                                  onTap: () {
                                    showAlertDailog();
                                  },
                                  child: Image.asset(
                                    Images.bin,
                                    height: size.height * 0.03,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: AppColors.primaryColor,
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddServiceScreen()));
          // Add your action here
          // For example, you can navigate to another screen or perform some action.
          // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
        },
        child: Icon(Icons.add), // Add your FAB icon here
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
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
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
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
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
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
