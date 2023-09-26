import 'dart:convert';

import 'package:dhoondle/src/features/screens/property_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../api_model/get_property_model.dart';
import '../../constants/Api.dart';
import '../../constants/colors.dart';
import '../../constants/helper.dart';
import '../../constants/images.dart';
import '../../constants/text.dart';
import 'package:http/http.dart'as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  GetPropertyCategoryModel?_getPropertyCategoryModel;
  bool _hashData = false;
  bool _isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Helper.checkInternet(getprofileApi());
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
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
      body:
      // _getPropertyCategoryModel == null
      //     ?_hashData
      //     ?Container()
      //     :Container(
      //   height: MediaQuery.of(context).size.height/2,
      //   width: MediaQuery.of(context).size.width,
      //   color: Colors.black,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("No data found")
      //     ],
      //   ),
      // ):


      Container(
          height: size.height,
          width: size.width,
          child:ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => {
                  // Get.to(PropertyDetailsScreen())
                  Get.toNamed('/propertydetail')
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Stack(
                        children: [
                          Container(
                            height: size.height*0.3,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(Images.flat)
                                )
                            ),

                          ),
                          Positioned(
                              top: 40,
                              right: 20,
                              child: Image.asset(Images.Frame)),



                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(TextScreen.Flat, style: GoogleFonts.poppins(
                            color: AppColors.textcolor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(TextScreen.Bhawarkua, style: GoogleFonts.poppins(
                            color: AppColors.greycolor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,

                          children: [
                            Image.asset(Images.Telephone,height: size.height*0.045,),
                            SizedBox(
                              width: size.width*0.1,
                            ),
                            Image.asset(Images.Whatsapp,height: size.height*0.045,)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          thickness: 6,
                          color:AppColors.home_divider_color,
                        ),
                      )
                    ],
                  ),
                );
              }),
      ),
    );
  }

  setProgress(bool show) {
    if (mounted)
      setState(() {
        _isVisible = show;
      });
  }

  Future<void> getprofileApi() async {

    print("<=============GetprofileApi =============>");

    // SessionHelper sessionHelper =await SessionHelper.getInstance(context);
    // String userId = sessionHelper.get(SessionHelper.USER_ID) ?? "0";



    // print("<=============userId =============>"+ userId);

    setProgress(true);
    Map data = {

      'name':"shekhar",


    };

    print("Request =============>"+ data.toString());
    try{
      var res = await http.post(Uri.parse(Api.getPropertyCategory), body: data);
      print("Response ============>"+ res.body);

      if (res.statusCode == 200) {
        print("jaydeep ============>");
        try {
          final jsonResponse = jsonDecode(res.body);
          GetPropertyCategoryModel model =  GetPropertyCategoryModel.fromJson(jsonResponse);

          if (model.status == "true") {
            print("Model status true");

            setProgress(false);

            setState(() {
              _getPropertyCategoryModel=model;
              // nameController.text = _getprofileModel!.data!.fullName.toString();
              // phoneController.text = _getprofileModel!.data!.phone.toString();
              // emailController.text = _getprofileModel!.data!.email.toString();
              // imagesource=_getprofileModel!.data!.image.toString();
              // select=_getprofileModel!.data!.gender.toString();




            });

            ToastMessage.msg(model.message.toString());
          }
          else{
            setProgress(false);
            print("false ### ============>");
            ToastMessage.msg(model.message.toString());
          }
        }
        catch (e) {
          print("false ============>");
          ToastMessage.msg(StaticMessages.API_ERROR);
          print('exception ==> '+ e.toString());
        }
      }else {
        print("status code ==> "+res.statusCode.toString());
        ToastMessage.msg(StaticMessages.API_ERROR);
      }
    }catch (e) {
      ToastMessage.msg(StaticMessages.API_ERROR);
      print('Exception ======> '+ e.toString());
    }
    setProgress(false);
  }


}
