import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhoondle/src/features/screens/property_details_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../api_model/get_property_model.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/text.dart';
import '../controllers/api_controller.dart';
import '../controllers/home_controller_property_list.dart';

class HomeScreen extends StatefulWidget {
  String category="";
   HomeScreen({required this.category});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final dio = Dio();
  GetPropertyCategoryModel? _getPropertyCategoryModel;
  var isLoading = true.obs;
  ApiController controller = Get.put(ApiController());
  HomePropertyController homePropertyController = Get.put(HomePropertyController());
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getpropertyapi();
    homePropertyController.homeApi(widget.category);


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
      body:homePropertyController.getPropertyList==null?Container(
        height: 400,
        child: Text("No property found"),):
      Container(
          height: size.height,
          width: size.width,
          child:




          homePropertyController.getPropertyList!.propertyList.isEmpty?Container(
            height: 400,
            child: Center(child: Text("No property found")),):
          ListView.builder(
              itemCount: controller.getPropertyCategoryModel!.categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => {
                  // Get.to(PropertyDetailsScreen())
                  Get.toNamed('/propertydetail')
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Stack(
                          children: [

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl:homePropertyController.getPropertyList!.propertyList[index]!.image.toString(),
                                  fit: BoxFit.fill,
                                  height: size.height*0.3,
                                  placeholder: (context, url) =>
                                      LinearProgressIndicator(
                                        color: Colors.white.withOpacity(0.2),
                                        backgroundColor: Colors.white.withOpacity(.5),
                                      ),
                                  errorWidget: (context, url, error) =>  Container(
                                    height: size.height*0.3,
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    margin: EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(Images.flat)
                                        )
                                    ),

                                  ),
                                ),
                              ),
                            ),



                            Positioned(
                                top: 40,
                                right: 20,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(Images.Frame)
                                        )
                                    ),
                                    child: Text("Rent:${homePropertyController.getPropertyList!.propertyList[index]!.price.toString()}"))),
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
                          child: Text(homePropertyController.getPropertyList!.propertyList[index]!.address.toString()+homePropertyController.getPropertyList!.propertyList[index]!.city.toString(), style: GoogleFonts.poppins(
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
                  ),
                );
              }),
      ),
    );
  }

}
