import 'dart:convert';

import 'package:dhoondle/src/constants/helper.dart';
import 'package:dhoondle/src/features/screens/search_screen.dart';
import 'package:dhoondle/src/features/screens/test_screen_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import '../../api_model/get_property_model.dart';
import '../../constants/Api.dart';


import '../../api_model/get_property_model.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/text.dart';
import '../controllers/api_controller.dart';
import 'bottomNavigation.dart';
import 'home_screen.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({Key? key}) : super(key: key);

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen>
    with SingleTickerProviderStateMixin {
  int initPosition = 0;
  GetPropertyCategoryModel?_getPropertyCategoryModel;
  late TabController _tabController;
  ApiController controller = Get.put(ApiController());



  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
    controller.getpropertyapi();
    Helper.checkInternet(categoryapi());


  }


  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar:AppBar(
            backgroundColor: AppColors.primaryColor,
            toolbarHeight: 80,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(Images.logo,height: 200,),
            ),
            centerTitle: true,
            elevation: 0,
            title: Text(TextScreen.Home, style: GoogleFonts.roboto(
            textStyle: TextStyle(
            color:
               Colors.white,
                fontSize: 18,
                fontWeight:
                FontWeight.w500),
          )),
            actions: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: InkWell(
                    onTap: (){
                      Helper.moveToScreenwithPush(context, SearchScreen());
                    },
                    child: Image.asset(Images.search,)),
              ),
            ],
          ) ,
          body: SafeArea(
    child: _getPropertyCategoryModel==null? Container(): CustomTabView(
      initPosition: initPosition,
      itemCount: _getPropertyCategoryModel!.categoryList.length,

      tabBuilder: (context, index) => Tab(text: _getPropertyCategoryModel!.categoryList[index].category.toString().toUpperCase()),
      // pageBuilder: (context, index) => Center(child: Text(_getPropertyCategoryModel!.categoryList[index].category.toString())),
      pageBuilder: (context, index) =>  HomeScreen(category:  _getPropertyCategoryModel!.categoryList[index].category.toString().toUpperCase()),
      onPositionChange: (index) {
        print('current position: $index');
        initPosition = index;
      },
      onScroll: (position) => print('$position'),
    ),
          //   child:Obx(
          //     () => controller.isLoading.value? Container():   Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height,
          //     child: DefaultTabController(
          //         length: 4,
          //         child: Column(
          //           children: <Widget>[
          //             Padding(
          //               padding: EdgeInsets.only(top: 10),
          //               child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                   children: [
          //                     Container(
          //                       width: MediaQuery.of(context).size.width,
          //                       child: TabBar(
          //                         automaticIndicatorColorAdjustment: true,
          //                         isScrollable: false,
          //                         labelStyle: GoogleFonts.openSans(
          //                             textStyle: TextStyle(
          //                               fontSize: 15,
          //                               fontWeight: FontWeight.w500,
          //                               color: Colors.white,
          //                             )),
          //                         unselectedLabelColor: AppColors.greycolor,
          //                         labelColor: Colors.grey,
          //                         controller: _tabController,
          //                         indicatorSize: TabBarIndicatorSize.tab,
          //                         indicatorWeight: 2,
          //                         indicatorColor: AppColors.textcolor,
          //                         tabs: [
          //                           Tab(
          //                             child: InkWell(
          //                               onTap: () {
          //                                 setState(() {
          //                                   _tabController.index = 0;
          //                                 });
          //                               },
          //                               child: Center(
          //                                   child: _tabController.index == 0
          //                                       ? Container(
          //                                     // padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          //                                     decoration: BoxDecoration(
          //                                       borderRadius:
          //                                       BorderRadius.circular(
          //                                           20),
          //                                     ),
          //                                     child: MaterialButton(
          //                                         padding:
          //                                         EdgeInsets.symmetric(
          //                                             horizontal: 0,
          //                                             vertical: 0),
          //                                         // textColor: Colors.white,
          //                                         child: Text("RK",
          //                                             style: GoogleFonts
          //                                                 .roboto(
          //                                               textStyle: TextStyle(
          //                                                   color: AppColors
          //                                                       .textcolor,
          //                                                   fontSize: 16,
          //                                                   fontWeight:
          //                                                   FontWeight
          //                                                       .w500),
          //                                             )),
          //                                         onPressed: () {}),
          //                                   )
          //                                       : Text("RK",
          //                                       style: GoogleFonts.roboto(
          //                                         textStyle: TextStyle(
          //                                             color:
          //                                             AppColors.greycolor,
          //                                             fontSize: 16,
          //                                             fontWeight:
          //                                             FontWeight.w500),
          //                                       ))),
          //                             ),
          //                           ),
          //                           Tab(
          //                             child: InkWell(
          //                               onTap: () {
          //                                 setState(() {
          //                                   _tabController.index = 1;
          //                                 });
          //                               },
          //                               child: Center(
          //                                   child: _tabController.index == 01
          //                                       ? Container(
          //                                     // padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          //                                     decoration: BoxDecoration(
          //                                       borderRadius:
          //                                       BorderRadius.circular(
          //                                           20),
          //                                     ),
          //                                     child: MaterialButton(
          //                                         padding:
          //                                         EdgeInsets.symmetric(
          //                                             horizontal: 0,
          //                                             vertical: 0),
          //                                         // textColor: Colors.white,
          //                                         child: Text("1BHK",
          //                                             style: GoogleFonts
          //                                                 .roboto(
          //                                               textStyle: TextStyle(
          //                                                   color:AppColors.textcolor,
          //                                                   fontSize: 16,
          //                                                   fontWeight:
          //                                                   FontWeight
          //                                                       .w500),
          //                                             )),
          //                                         onPressed: () {}),
          //                                   )
          //                                       : Text("1BHK",
          //                                       style: GoogleFonts.roboto(
          //                                         textStyle: TextStyle(
          //                                             color:
          //                                            AppColors.greycolor,
          //                                             fontSize: 16,
          //                                             fontWeight:
          //                                             FontWeight.w500),
          //                                       ))),
          //                             ),
          //                           ),
          //                           Tab(
          //                             child: InkWell(
          //                               onTap: () {
          //                                 setState(() {
          //                                   _tabController.index = 2;
          //                                 });
          //                               },
          //                               child: Center(
          //                                   child: _tabController.index == 02
          //                                       ? Container(
          //                                     // padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          //                                     decoration: BoxDecoration(
          //                                       borderRadius:
          //                                       BorderRadius.circular(
          //                                           20),
          //                                     ),
          //                                     child: MaterialButton(
          //                                         padding:
          //                                         EdgeInsets.symmetric(
          //                                             horizontal: 0,
          //                                             vertical: 0),
          //                                         // textColor: Colors.white,
          //                                         child: Text("2BHK",
          //                                             style: GoogleFonts
          //                                                 .roboto(
          //                                               textStyle: TextStyle(
          //                                                   color:AppColors.textcolor,
          //                                                   fontSize: 16,
          //                                                   fontWeight:
          //                                                   FontWeight
          //                                                       .w500),
          //                                             )),
          //                                         onPressed: () {}),
          //                                   )
          //                                       : Text("2BHK",
          //                                       style: GoogleFonts.roboto(
          //                                         textStyle: TextStyle(
          //                                             color:
          //                                           AppColors.greycolor,
          //                                             fontSize: 16,
          //                                             fontWeight:
          //                                             FontWeight.w500),
          //                                       ))),
          //                             ),
          //                           ),
          //                           Tab(
          //                             child: InkWell(
          //                               onTap: () {
          //                                 setState(() {
          //                                   _tabController.index = 3;
          //                                 });
          //                               },
          //                               child: Center(
          //                                   child: _tabController.index == 03
          //                                       ? Container(
          //                                     // padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          //                                     decoration: BoxDecoration(
          //                                       borderRadius:
          //                                       BorderRadius.circular(
          //                                           20),
          //                                     ),
          //                                     child: MaterialButton(
          //                                         padding:
          //                                         EdgeInsets.symmetric(
          //                                             horizontal: 0,
          //                                             vertical: 0),
          //                                         // textColor: Colors.white,
          //                                         child: Text("Villa",
          //                                             style: GoogleFonts
          //                                                 .roboto(
          //                                               textStyle: TextStyle(
          //                                                   color: AppColors.textcolor,
          //                                                   fontSize: 16,
          //                                                   fontWeight:
          //                                                   FontWeight
          //                                                       .w500),
          //                                             )),
          //                                         onPressed: () {}),
          //                                   )
          //
          //
          //                                   //controller.getPropertyCategoryModel!.categoryList[3].category.toString(),
          //                                       : Text("Villa",
          //                                       style: GoogleFonts.roboto(
          //                                         textStyle: TextStyle(
          //                                             color:
          //                                            AppColors.greycolor,
          //                                             fontSize: 16,
          //                                             fontWeight:
          //                                             FontWeight.w500),
          //                                       ))),
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     // Image.asset(ProjectImage.search,height: 40,),
          //                     // SizedBox(width: 10,),
          //                     // Image.asset(ProjectImage.home,height: 40,)                      ],
          //                   ]),
          //             ),
          //             Expanded(
          //               child: TabBarView(
          //                 controller: _tabController,
          //                 physics: NeverScrollableScrollPhysics(),
          //                 children: [
          //
          //                   HomeScreen(category: "RK",),
          //                   HomeScreen(category: "1BHK",),
          //                   HomeScreen(category: "2BHK",),
          //                   HomeScreen(category: "Villa"),
          //
          //
          //                 ],
          //
          //                 // children: <Widget>[
          //                 //   new Center(
          //                 //     child: new Card(
          //                 //       child: new Container(
          //                 //           height: 450.0,
          //                 //           width: 300.0,
          //                 //           child: new IconButton(
          //                 //             icon: new Icon(Icons.favorite, size: 100.0),
          //                 //             tooltip: 'Favorited',
          //                 //             onPressed: null,
          //                 //           )
          //                 //       ),
          //                 //     ),
          //                 //   ),
          //                 //   new Center(
          //                 //     child: new Card(
          //                 //       child: new Container(
          //                 //           height: 450.0,
          //                 //           width: 300.0,
          //                 //           child: new IconButton(
          //                 //             icon: new Icon(Icons.local_pizza, size: 50.0,),
          //                 //             tooltip: 'Pizza',
          //                 //             onPressed: null,
          //                 //           )
          //                 //       ),
          //                 //     ),
          //                 //   ),
          //                 // ],
          //
          //
          //               ),
          //             ),
          //
          //
          //
          //
          //           ],
          //         )),
          //   ),
          // )),
    )));
  }
  Future<void>categoryapi() async {
    print("<=============categoryapi =============>");

    final prefs = await SharedPreferences.getInstance();
    var user_id=   await prefs.getString('user_id');

    // setProgress(true);

    try {
      var res = await http.get(Uri.parse(Api.getPropertyCategory+"?user_id=${user_id}"),);
      print("Response ============>" + res.body);

      if (res.statusCode == 200) {
        print("urvashi ============>");
        try {
          final jsonResponse = jsonDecode(res.body);
          GetPropertyCategoryModel model = GetPropertyCategoryModel.fromJson(jsonResponse);

          if (model.status == "true") {
            print("Model status true");
            setState(() {
              _getPropertyCategoryModel=model;
            });

            // setProgress(false);

            // setState(() {
            //   _getprofileApi = model;
            //   fullNameController.text= _getprofileApi!.data.name.toString();
            //   addressController.text= _getprofileApi!.data.address.toString();
            //   emailController.text= _getprofileApi!.data.email.toString();
            //   mobileController.text= _getprofileApi!.data.mobile.toString();
            //
            // });

            // ToastMessage.msg(model.message.toString());
          } else {
            setState(() {
              // _hasData = false;
            });
            // setProgress(false);
            print("false ### ============>");
            // ToastMessage.msg(model.message.toString());
          }
        } catch (e) {
          // _hasData = false;
          // print("false ============>");
          // ToastMessage.msg(StaticMessages.API_ERROR);
          print('exception ==> ' + e.toString());
        }
      } else {
        print("status code ==> " + res.statusCode.toString());
        // ToastMessage.msg(StaticMessages.API_ERROR);
      }
    } catch (e) {
      // _hasData = false;
      // ToastMessage.msg(StaticMessages.API_ERROR);
      print('Exception ======> ' + e.toString());
    }
    // setProgress(false);
  }

}

class CustomTabView extends StatefulWidget {
  const CustomTabView({
    super.key,
    required this.itemCount,
    required this.tabBuilder,
    required this.pageBuilder,
    this.stub,
    this.onPositionChange,
    this.onScroll,
    this.initPosition,
  });

  final int itemCount;
  final IndexedWidgetBuilder tabBuilder;
  final IndexedWidgetBuilder pageBuilder;
  final Widget? stub;
  final ValueChanged<int>? onPositionChange;
  final ValueChanged<double>? onScroll;
  final int? initPosition;

  @override
  CustomTabsState createState() => CustomTabsState();
}

class CustomTabsState extends State<CustomTabView>
    with TickerProviderStateMixin {
  late TabController controller;
  late int _currentCount;
  late int _currentPosition;

  @override
  void initState() {
    _currentPosition = widget.initPosition ?? 0;
    controller = TabController(
      length: widget.itemCount,
      vsync: this,
      initialIndex: _currentPosition,
    );
    controller.addListener(onPositionChange);
    controller.animation!.addListener(onScroll);
    _currentCount = widget.itemCount;
    super.initState();
  }

  @override
  void didUpdateWidget(CustomTabView oldWidget) {
    if (_currentCount != widget.itemCount) {
      controller.animation!.removeListener(onScroll);
      controller.removeListener(onPositionChange);
      controller.dispose();

      if (widget.initPosition != null) {
        _currentPosition = widget.initPosition!;
      }

      if (_currentPosition > widget.itemCount - 1) {
        _currentPosition = widget.itemCount - 1;
        _currentPosition = _currentPosition < 0 ? 0 : _currentPosition;
        if (widget.onPositionChange is ValueChanged<int>) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && widget.onPositionChange != null) {
              widget.onPositionChange!(_currentPosition);
            }
          });
        }
      }

      _currentCount = widget.itemCount;
      setState(() {
        controller = TabController(
          length: widget.itemCount,
          vsync: this,
          initialIndex: _currentPosition,
        );
        controller.addListener(onPositionChange);
        controller.animation!.addListener(onScroll);
      });
    } else if (widget.initPosition != null) {
      controller.animateTo(widget.initPosition!);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.animation!.removeListener(onScroll);
    controller.removeListener(onPositionChange);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount < 1) return widget.stub ?? Container();

    return Column(
     // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
          width:MediaQuery.of(context).size.width ,
          alignment:widget.itemCount<=5? Alignment.center: Alignment.topLeft,
          child: TabBar(
            isScrollable: true,
            controller: controller,
            labelStyle: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          )),
            unselectedLabelColor: Color(0xffA7A7A7),
             labelColor: Colors.black,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.greycolor,
                  width: 5,
                ),
              ),
            ),
            tabs: List.generate(
              widget.itemCount,
                  (index) => widget.tabBuilder(context, index),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: List.generate(
              widget.itemCount,
                  (index) => widget.pageBuilder(context, index),
            ),
          ),
        ),
      ],
    );
  }

  void onPositionChange() {
    if (!controller.indexIsChanging) {
      _currentPosition = controller.index;
      if (widget.onPositionChange is ValueChanged<int>) {
        widget.onPositionChange!(_currentPosition);
      }
    }
  }

  void onScroll() {
    if (widget.onScroll is ValueChanged<double>) {
      widget.onScroll!(controller.animation!.value);
    }
  }
}