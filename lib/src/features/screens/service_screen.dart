import 'package:dhoondle/src/constants/colors.dart';
import 'package:dhoondle/src/features/screens/plumber_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/images.dart';


class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  List<Choice> choices = [
    Choice(
        color: Colors.white,
        image: Images.img1,
        title: 'Electrician'),
    Choice(color: Colors.white, image: Images.img2, title: 'Plumber'),
    Choice(color: Colors.white, image: Images.img3, title: 'Cleaner'),
  ];
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
        title: Text('Services',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    childAspectRatio: 2 / 2),
                itemCount: choices.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: InkWell(
                      onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PlumberScreen()))
                        // Get.toNamed('/plumber')
                      },
                      child: Container(
                          // height: 200.0,
                          // width: 200.0,
                          decoration: const BoxDecoration(
                            color: Color(0xFFffffff),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4.0, // soften the shadow
                                spreadRadius: 0.0, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 5  horizontally
                                  5.0, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                          ),

                          // width: MediaQuery.of(context).size.width * 0.5,
                          // height: MediaQuery.of(context).size.height * 0.3,
                          // decoration: BoxDecoration(
                          //     boxShadow: [
                          //       BoxShadow(
                          //         color: Color(0xff000000),
                          //         blurRadius: 4.0, // soften the shadow
                          //         spreadRadius: 0.0, //extend the shadow
                          //         offset: Offset(
                          //           0.0, // Move to right 5  horizontally
                          //           0.0, // Move to bottom 5 Vertically
                          //         ),
                          //       )
                          //     ],
                          //     color: choices[index].color,
                          //     //color: Colors.white,
                          //     border: Border.all(color: Color(0xffEAEDF2)),
                          //     borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    choices[index].image,
                                    fit: BoxFit.fill,
                                    // height: 80,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                choices[index].title,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          )),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class Choice {
  String title = "";
  String image = "";
  Color color = Colors.white;
  Choice({required this.color, required this.image, required this.title});
}
