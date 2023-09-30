import 'dart:convert';

import 'package:dhoondle/src/features/screens/property_screen.dart';
import 'package:dhoondle/src/features/screens/services_tabbar.dart';
import 'package:dhoondle/src/features/screens/setting%202%20(1).dart';
import 'package:dhoondle/src/features/screens/setting3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import '../../api_model/service_list_api.dart';
import '../../constants/Api.dart';
import '../../constants/colors.dart';
import '../../constants/helper.dart';
import '../../constants/images.dart';
import '../../constants/text.dart';
import '../controllers/common_model.dart';

class AddServiceScreen extends StatefulWidget {
  String service_id="";
   AddServiceScreen({required this.service_id});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  var chooseservice = [
    "Plumbing",
    "Carpainting",
    "Cleaning",
  ];
  String? dropdownvalueOfChooseService = null;
  String? dropdownvalueOfroom = null;
  String? dropdownvalueOfCatagory = null;
  bool _isVisible = false;
  bool _hasData = true;
  String restaurentText = '';
  List<ServiceList> restaurent = [];
  List<String> _restaurent = [];
  Map newMapOfMonths={};
  ServiceListApiModel? serviceListApiModel;
  TextEditingController descriptioncontroller=TextEditingController();
  TextEditingController addresscontroller=TextEditingController();
  TextEditingController numbercontroller=TextEditingController();
  String selectedOption="";
  String serviceid="";
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Helper.checkInternet(getservices());
  }

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
        title: Text(TextScreen.add_service,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xffEAEDF2),
                      border: Border.all(color: AppColors.addpropertyfillclr, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: Padding(
                            padding:  EdgeInsets.only(left: 5),
                            child: Text("Choose Service",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: AppColors.txtgreyclr,
                                    fontSize: 15,
                                  ),
                                )),
                          ),
                          isExpanded: true,
                          value: selectedOption,
                          icon: const Icon(Icons.keyboard_arrow_down),

                          items: newMapOfMonths.map((key,value) {
                            return MapEntry(key, DropdownMenuItem(
                              value: value,
                              child: Text(key.toString(),
                                style: TextStyle(
                                    color: Colors.grey,fontSize: 18
                                ),
                              ),
                            ));
                          }).values.toList(),
                          onChanged: (value) {
                            print("value============>${value.toString()}");
                            setState(() {
                              selectedOption=value.toString();
                              serviceid=value.toString();
                              // Helper.checkInternet(GetAppointmentListApi());
                            });
                          },


                          // items: chooseservice.map((String items) {
                          //   return DropdownMenuItem(
                          //     value: items,
                          //     child: Text(items),
                          //   );
                          // }).toList(),
                          //
                          // onChanged: (String? newValue) {
                          //   setState(() {
                          //     dropdownvalueOfChooseService = newValue!;
                          //   });
                           ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                     controller: descriptioncontroller,
                    //obscureText: true,
                    decoration: InputDecoration(
                      // fillColor: AppColors.addpropertyfillclr,
                      fillColor: Color(0xffEAEDF2),
                      filled: true,
                      hintText: "Description",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                      hintStyle: GoogleFonts.poppins(
                          color: AppColors.txtgreyclr, fontSize: 15),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.addpropertyfillclr),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.addpropertyfillclr),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.addpropertyfillclr),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              width: 1, color: AppColors.addpropertyfillclr)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              width: 1, color: AppColors.addpropertyfillclr)),
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(20),
                      //     borderSide: new BorderSide(color: Color(0xffBFBFBF))
                      // )
                    ),
                    validator: (value){
                      if(value!.isEmpty){ return "Please enter your password";
                      }
                      else if(value.length < 8){
                        ToastMessage.msg("password must be of 8 digit");
                      }
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                     controller: numbercontroller,
                    //obscureText: true,
                    decoration: InputDecoration(
                      // fillColor: AppColors.addpropertyfillclr,
                      fillColor: Color(0xffEAEDF2),
                      filled: true,
                      hintText: "+91",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          Images.telephonetxtfield,
                          height: 5,
                        ),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                      hintStyle: GoogleFonts.poppins(
                          color: AppColors.txtgreyclr, fontSize: 15),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.addpropertyfillclr),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.addpropertyfillclr),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.addpropertyfillclr),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              width: 1, color: AppColors.addpropertyfillclr)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              width: 1, color: AppColors.addpropertyfillclr)),

                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(20),
                      //     borderSide: new BorderSide(color: Color(0xffBFBFBF))
                      // )

                    ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please enter your number");
                        }
                        else if (value.length != 10) {
                          return ("Number must be equal to ten digits");
                        }
                      }

                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                     controller: addresscontroller,
                    //obscureText: true,
                    decoration: InputDecoration(
                      // fillColor: AppColors.addpropertyfillclr,
                      fillColor: Color(0xffEAEDF2),
                      filled: true,
                      hintText: "Address",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                      hintStyle: GoogleFonts.poppins(
                          color: AppColors.txtgreyclr, fontSize: 15),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.addpropertyfillclr),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.addpropertyfillclr),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.addpropertyfillclr),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              width: 1, color: AppColors.addpropertyfillclr)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              width: 1, color: AppColors.addpropertyfillclr)),
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(20),
                      //     borderSide: new BorderSide(color: Color(0xffBFBFBF))
                      // )
                    ),
                    validator: (value){
                      if(value!.isEmpty){ return "Please enter your address";
                      }
                      else if(value.length < 8){
                        ToastMessage.msg("password must be of 8 digit");
                      }
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.8,
                        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                        decoration: BoxDecoration(
                          color: Color(0xffEAEDF2),
                          border: Border.all(color: AppColors.addpropertyfillclr, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Text("Facilities",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: AppColors.txtgreyclr,
                                fontSize: 15,
                              ),
                            )),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3.1,
                        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          border: Border.all(color: AppColors.addpropertyfillclr, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Center(
                          child: Text("Add",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2.3,
                        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          border: Border.all(color: AppColors.addpropertyfillclr, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Center(
                          child: Text("AC",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2.3,
                        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          border: Border.all(color: AppColors.addpropertyfillclr, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Center(
                          child: Text("TV",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.15,
                        width: MediaQuery.of(context).size.width/3,
                        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                        decoration: BoxDecoration(
                          // color: AppColors.primaryColor,
                          border: Border.all(color: AppColors.addpropertyfillclr, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Center(
                            child: Icon(Icons.add,size: 50,color: AppColors.primaryColor,)
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text("Add Images of \nyour previous work",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xffB2B2B2),
                                fontSize: 14,fontWeight: FontWeight.w300
                            ),
                          )),

                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.18,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(Images.room_img,fit: BoxFit.fill,)),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                          child: Image.asset(Images.cross,height: 40,))

                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  MaterialButton(
                    onPressed: () {
                      // Get.to(OtpScreen());
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Setting3()));
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ServicesTabbar()));
                    },
                    color: AppColors.ButtonColor,
                    textColor: Colors.black,
                    minWidth: 320,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      'Submit',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20,
                        color: AppColors.ButtonTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  setProgress(bool show) {
    if (mounted)
      setState(() {
        _isVisible = show;
      });
  }


  Future<void> getservices() async {

    print("<=============getservices api=============>");

    setProgress(true);

    final prefs = await SharedPreferences.getInstance();
    var user_id=   await prefs.getString('user_id');
    try{
      var res = await http.get(Uri.parse(Api.getServiceList+"?user_id=${user_id}"));
      // var res = await http.post(Uri.parse(Api.getMyServiceList), );
      print("Response ============>"+ res.body);

      if (res.statusCode == 200) {
        try {
          final jsonResponse = jsonDecode(res.body);

          ServiceListApiModel model = ServiceListApiModel.fromJson(jsonResponse);

          if (model.status == "true") {
            restaurent.addAll(model.serviceList!);

            print("restaurent===============${restaurent.runtimeType}");
            _restaurent.clear();
            for(int i=0; i< restaurent.length; i++){
              _restaurent.add(restaurent[i].services.toString());
              newMapOfMonths[restaurent[i].services]=restaurent[i].serviceId;
            }
            print("newMapOfMonths===============${newMapOfMonths.toString()}");

            setState(() {
              serviceListApiModel = model;
               selectedOption = serviceListApiModel!.serviceList![0].services!.toString();
            });

            setProgress(false);
            // ToastMessage.msg(model.message.toString());

            // Helper.moveToScreenwithPush(context, OtpVerifyScreen(number: model.data!.phone.toString(),));
            // sessionHelper.put(SessionHelper.NAME,model.data!.name.toString());
            // sessionHelper.put(SessionHelper.EMAIL,model.data!.email.toString());
            // sessionHelper.put(SessionHelper.IMAGE,model.data!.image.toString());
            // sessionHelper.put(SessionHelper.DOB,model.data!.dob.toString());
            // sessionHelper.put(SessionHelper.USER_ID,model.data!.userId.toString());

          }
          else{

            serviceListApiModel = null;
            setProgress(false);
            print("false ============>");
            // ToastMessage.msg(model.message.toString());
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


  Future<void>addService() async {
    print("<=============addServiceApi =============>");
    setProgress(true);
    final prefs = await SharedPreferences.getInstance();
    var user_id=   await prefs.getString('user_id');


    Map data = {
      'user_id': user_id.toString(),
    'service_id':serviceid.toString(),
    'service':selectedOption,
    'description':descriptioncontroller.text.toString(),
    'number':numbercontroller.text.toString(),
    'amount':500,
    'address':descriptioncontroller.text.toString(),
    'image':""

    };

    print("Request =============>" + data.toString());
    try {
      var res = await http.post(Uri.parse(Api.addService), body: data);
      print("Response ============>" + res.body);

      if (res.statusCode == 200) {
        print("jaydeep ============>");
        try {
          final jsonResponse = jsonDecode(res.body);
          CommonModel model = CommonModel.fromJson(jsonResponse);

          if (model.status == "true") {
            print("Model status true");

            setProgress(false);

            // setState(() {
            //   getPropertyList = model;
            // });

            // ToastMessage.msg(model.message.toString());
          } else {
            setState(() {
              _hasData = false;
            });
            setProgress(false);
            print("false ### ============>");
            ToastMessage.msg(model.message.toString());
          }
        } catch (e) {
          _hasData = false;
          print("false ============>");
          ToastMessage.msg(StaticMessages.API_ERROR);
          print('exception ==> ' + e.toString());
        }
      } else {
        print("status code ==> " + res.statusCode.toString());
        ToastMessage.msg(StaticMessages.API_ERROR);
      }
    } catch (e) {
      _hasData = false;
      ToastMessage.msg(StaticMessages.API_ERROR);
      print('Exception ======> ' + e.toString());
    }
    setProgress(false);
  }

}
