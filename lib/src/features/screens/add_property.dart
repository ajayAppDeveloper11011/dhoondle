import 'package:dhoondle/src/features/screens/property_screen.dart';
import 'package:dhoondle/src/features/screens/services_tabbar.dart';
import 'package:dhoondle/src/features/screens/setting%202%20(1).dart';
import 'package:dhoondle/src/features/screens/setting3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/text.dart';

class AddPropertynew extends StatefulWidget {
  const AddPropertynew({super.key});

  @override
  State<AddPropertynew> createState() => _AddPropertynewState();
}

class _AddPropertynewState extends State<AddPropertynew> {
  var city = [
    "Indore",
    "Bhopal",
    "Ujjain",
    "Mumbai",
  ];
  var roomtype = [
    "AC",
    "NON AC",
  ];
  var catagory = [
    "Studio room",
    "1RK",
  ];
  String? dropdownvalueOfCity = null;
  String? dropdownvalueOfroom = null;
  String? dropdownvalueOfCatagory = null;
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
        title: Text(TextScreen.add_property,
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
            child: Column(
              children: [
                TextField(
                  // controller: MobileController,
                  //obscureText: true,
                  decoration: InputDecoration(
                    // fillColor: AppColors.addpropertyfillclr,
                    fillColor: Color(0xffEAEDF2),
                    filled: true,
                    hintText: "Title",
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
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  // controller: MobileController,
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
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  // controller: MobileController,
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
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  // controller: MobileController,
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
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  // controller: MobileController,
                  //obscureText: true,
                  decoration: InputDecoration(
                    // fillColor: AppColors.addpropertyfillclr,
                    fillColor: Color(0xffEAEDF2),
                    filled: true,
                    hintText: "Rent",
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
                ),
                SizedBox(
                  height: 12,
                ),

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
                          child: Text("City",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: AppColors.txtgreyclr,
                                  fontSize: 15,
                                ),
                              )),
                        ),
                        isExpanded: true,
                        value: dropdownvalueOfCity,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: city.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalueOfCity = newValue!;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
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
                          child: Text("Room",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: AppColors.txtgreyclr,
                                  fontSize: 15,
                                ),
                              )),
                        ),
                        isExpanded: true,
                        value: dropdownvalueOfroom,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: city.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalueOfroom = newValue!;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
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
                          child: Text("Category",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: AppColors.txtgreyclr,
                                  fontSize: 15,
                                ),
                              )),
                        ),
                        isExpanded: true,
                        value: dropdownvalueOfCatagory,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: city.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalueOfCatagory = newValue!;
                          });
                        }),
                  ),
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
                      width: MediaQuery.of(context).size.width/3.2,
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
                      width: 10,
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
                  height: 40,
                ),
                MaterialButton(
                  onPressed: () {
                    // Get.to(OtpScreen());
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ServicesTabbar()));
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Setting3()));
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
    );
  }
}
