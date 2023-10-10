import 'dart:io';

import 'package:dhoondle/src/features/screens/profile_screen.dart';
import 'package:dhoondle/src/features/screens/service_screen.dart';
import 'package:dhoondle/src/features/screens/tabbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/text.dart';
import 'home_screen.dart';


class BottomNaigation extends StatefulWidget {
  const BottomNaigation({Key? key}) : super(key: key);

  @override
  State<BottomNaigation> createState() => _BottomNaigationState();
}

class _BottomNaigationState extends State<BottomNaigation> {

  int _totalNotifications = 10;
  int selectedIndex = 0;
  PageController? _pageController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (context) {
              return _exitPopup();
            });
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => selectedIndex = index);
            },
            children: <Widget>[
              TabbarScreen(),
              ServiceScreen(),
              ProfileScreen()

            ]),

        bottomNavigationBar: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 70,
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(30),
                //     topRight: Radius.circular(30)
                // ),
                color:AppColors.primaryColor
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      setState(() {
                        onItemTapped(0);
                      });
                      // Get.toNamed('/home');
                    },
                    child:
                    selectedIndex == 0?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 0,),
                        Container(
                            height: 0,
                            width: 40,
                            child: Divider(
                              color: Colors.white,
                              thickness: 3,
                            )
                        ),
                        SizedBox(height: 10,),
                        Column(
                          children: [
                            Image.asset(Images.home,
                              height: 25,width: 25,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(height: 2,),
                            Text("Home",
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                        :
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 45,width: 45,
                          child: Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Image.asset(Images.home,
                              height: 25,width: 25,fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        onItemTapped(1);
                      });
                      // Get.toNamed('/ServiceScreen');
                    },
                    child:
                    selectedIndex == 1?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 0,),
                        Container(
                            height: 0,
                            width: 40,
                            child: Divider(
                              color: Colors.white,
                              thickness: 3,
                            )
                        ),
                        SizedBox(height: 10,),
                        Column(
                          children: [
                            Image.asset(Images.services,
                              height: 25,width: 25,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(height: 2,),
                            Text(TextScreen.Services,
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                        :
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 45,width: 45,
                          child: Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Image.asset(Images.unselected_services,
                              height: 25,width: 25,fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        onItemTapped(2);
                      });
                      // Get.toNamed('/profile');
                    },
                    child:
                    selectedIndex == 2?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 0,),
                        Container(
                            height: 0,
                            width: 40,
                            child: Divider(
                              color: Colors.white,
                              thickness: 3,
                            )
                        ),
                        SizedBox(height: 10,),
                        Column(
                          children: [
                            Image.asset(Images.profile,
                              height: 25,width: 25,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(height: 2,),
                            Text(TextScreen.Profile,
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                        :
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 45,width: 45,
                          child: Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Image.asset(Images.unselected_profile,
                              height: 25,width: 25,fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }

  Widget _exitPopup() {
    return AlertDialog(
      title: const Text("Are You Sure"),
      content: const Text("You Want To Exit The App"),
      actions: <Widget>[
        MaterialButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            "No",
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ),
        MaterialButton(
          onPressed: () {
            exit(0);
            // Helper.checkInternet(apiOfflineStatus("0"));
          },
          // Navigator.of(context).pop(true),
          child: Text(
            "Yes",
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }


  void onItemTapped(int value) {

    setState(() {
      selectedIndex = value;

      // _pageController!.animateToPage(value,
      //     duration: Duration(milliseconds: 300), curve: Curves.easeOut);

      _pageController!.jumpToPage(value);
    });
  }
}
