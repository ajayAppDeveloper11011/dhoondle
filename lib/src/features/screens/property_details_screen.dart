import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/text.dart';

class PropertyDetailsScreen extends StatefulWidget {
  const PropertyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  List imgURL = [
    Images.flat,
    Images.flat,
    Images.flat,
  ];
  int currentIndex = 0;
  List<String> images = <String>[
    "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
    "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    "https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
  ];
  CarouselController carouselController = CarouselController();
  String isSelect = "";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index, int itemIndex) {
                    return Center(
                        child: Stack(
                      children: [
                        Container(
                          height: size.height * 0.28,
                          width: MediaQuery.of(context).size.width,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.2),
                            //     spreadRadius: 2,
                            //     blurRadius: 2,
                            //     offset: Offset(0, 1), // changes position of shadow
                            //   ),
                            // ],
                          ),
                          child: CachedNetworkImage(
                            imageUrl: Images.flat,
                            fit: BoxFit.fill,
                            height: size.height * 0.3,
                            placeholder: (context, url) =>
                                LinearProgressIndicator(
                              color: Colors.white.withOpacity(0.2),
                              backgroundColor: Colors.white.withOpacity(.5),
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: size.height * 0.28,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.withOpacity(0.2),
                                //     spreadRadius: 2,
                                //     blurRadius: 2,
                                //     offset: Offset(0, 1), // changes position of shadow
                                //   ),
                                // ],
                              ),
                              child: Center(
                                // child: Icon(
                                //   Icons.flag,
                                //   size: 20,
                                //   color: AppColor.primaryColor,
                                // ),
                                child: Image.asset(
                                  Images.flat,
                                  fit: BoxFit.fill,
                                  height: size.height * 0.28,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 40, right: 20, child: Image.asset(Images.Frame)),
                      ],
                    ));
                  },
                  options: CarouselOptions(
                      height: 250,
                      autoPlay: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                          // projectId = _homeModel!.projectData![index].projectId.toString();
                          // print("projectId========================${projectId.toString()}");
                        });
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: 3,
                  effect: SlideEffect(
                      dotWidth: 12,
                      dotHeight: 12,
                      activeDotColor: AppColors.textcolor,
                      dotColor: AppColors.greycolor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        TextScreen.Flat,
                        style: GoogleFonts.roboto(
                            color: AppColors.textcolor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Row(
                        children: [
                          Image.asset(
                            Images.Telephone,
                            height: size.height * 0.03,
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Image.asset(
                            Images.Whatsapp,
                            height: size.height * 0.03,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Text(
                        TextScreen.Description,
                        style: GoogleFonts.roboto(
                            color: AppColors.textcolor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        TextScreen.This,
                        style: GoogleFonts.roboto(
                            color: AppColors.greycolor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                      child: Divider(
                        thickness: 1,
                        color:AppColors.greycolordark,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Text(
                        TextScreen.rent,
                        style: GoogleFonts.roboto(
                            color: AppColors.textcolor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        TextScreen.rentrs,
                        style: GoogleFonts.roboto(
                            color: AppColors.greycolor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Text(
                        TextScreen.Address,
                        style: GoogleFonts.roboto(
                            color: AppColors.textcolor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        TextScreen.addressrent,
                        style: GoogleFonts.roboto(
                            color: AppColors.greycolor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Text(
                        TextScreen.city,
                        style: GoogleFonts.roboto(
                            color: AppColors.textcolor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        TextScreen.indore,
                        style: GoogleFonts.roboto(
                            color: AppColors.greycolor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Text(
                        TextScreen.room,
                        style: GoogleFonts.roboto(
                            color: AppColors.textcolor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        TextScreen.furnished,
                        style: GoogleFonts.roboto(
                            color: AppColors.greycolor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Text(
                        TextScreen.owner_name,
                        style: GoogleFonts.roboto(
                            color: AppColors.textcolor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        TextScreen.owner,
                        style: GoogleFonts.roboto(
                            color: AppColors.greycolor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Text(
                        TextScreen.facilities,
                        style: GoogleFonts.roboto(
                            color: AppColors.textcolor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                   Padding(
                     padding: const EdgeInsets.symmetric(
                         horizontal: 20.0, vertical: 5),
                     child: Row(
                       children: [
                         Container(
                           height: 40,
                           width: 80,
                           decoration: BoxDecoration(
                               color: Color(0xffF46060),
                               borderRadius: BorderRadius.circular(15)
                           ),
                           child:  Center(
                             child: Text(
                               TextScreen.ac,
                               style: GoogleFonts.roboto(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w500,
                                   fontSize: 16),
                             ),
                           ),
                         ),
                         SizedBox(
                           width: 5,
                         ),
                         Container(
                           height: 40,
                           width: 80,
                           decoration: BoxDecoration(
                               color: Color(0xffF46060),
                               borderRadius: BorderRadius.circular(15)
                           ),
                           child:  Center(
                             child: Text(
                               TextScreen.ac,
                               style: GoogleFonts.roboto(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w500,
                                   fontSize: 16),
                             ),
                           ),
                         ),
                         SizedBox(
                           width: 5,
                         ),
                         Container(
                           height: 40,
                           width: 80,
                           decoration: BoxDecoration(
                               color: Color(0xffF46060),
                               borderRadius: BorderRadius.circular(15)
                           ),
                           child:  Center(
                             child: Text(
                               TextScreen.tv,
                               style: GoogleFonts.roboto(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w500,
                                   fontSize: 16),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(
                         horizontal: 20.0, vertical: 5),
                     child: Row(
                       children: [
                         Container(
                           height: 40,
                           width: 80,
                           decoration: BoxDecoration(
                             color: Color(0xffF46060),
                             borderRadius: BorderRadius.circular(15)
                           ),
                           child:  Center(
                             child: Text(
                               TextScreen.ac,
                               style: GoogleFonts.roboto(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w500,
                                   fontSize: 16),
                             ),
                           ),
                         ),
                         SizedBox(
                           width: 5,
                         ),
                         Container(
                           height: 40,
                           width: 80,
                           decoration: BoxDecoration(
                               color: Color(0xffF46060),
                               borderRadius: BorderRadius.circular(15)
                           ),
                           child:  Center(
                             child: Text(
                               TextScreen.ac,
                               style: GoogleFonts.roboto(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w500,
                                   fontSize: 16),
                             ),
                           ),
                         ),
                         SizedBox(
                           width: 5,
                         ),
                         Container(
                           height: 40,
                           width: 80,
                           decoration: BoxDecoration(
                               color: Color(0xffF46060),
                               borderRadius: BorderRadius.circular(15)
                           ),
                           child:  Center(
                             child: Text(
                               TextScreen.tv,
                               style: GoogleFonts.roboto(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w500,
                                   fontSize: 16),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                    SizedBox(
                      height: size.height*0.1,
                    )
                  ],
                )

                // Stack(
                //   children: [
                //     Container(
                //       height: size.height*0.3,
                //       padding: EdgeInsets.symmetric(horizontal: 20),
                //       margin: EdgeInsets.symmetric(horizontal: 20),
                //       decoration: BoxDecoration(
                //           image: DecorationImage(
                //               image: AssetImage(Images.flat)
                //           )
                //       ),
                //
                //     ),
                //     Positioned(
                //         top: 40,
                //         right: 20,
                //         child: Image.asset(Images.Frame)),
                //
                //
                //
                //   ],
                // ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //   child: Divider(
                //     thickness: 6,
                //     color:AppColors.home_divider_color,
                //   ),
                // )
              ],
            ),
          )),
    );
  }
}
