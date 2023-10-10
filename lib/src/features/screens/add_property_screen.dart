import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/helper.dart';
import '../../constants/images.dart';
import '../../constants/text.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 80,
        leading: InkWell(
          onTap: () {
            Helper.popScreen(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(Icons.arrow_back,color: Colors.white,),
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
color: Colors.red,
        height: MediaQuery.of(context).size.height,
        // height: 900,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
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
                contentPadding: EdgeInsets.symmetric(horizontal: 22,vertical: 18),
                hintStyle: GoogleFonts.poppins(color: AppColors.txtgreyclr,fontSize: 15),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color: AppColors.addpropertyfillclr),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color:AppColors.addpropertyfillclr),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color:AppColors.addpropertyfillclr),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1,
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                    BorderSide(width: 1, color:AppColors.addpropertyfillclr)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                    BorderSide(width: 1, color: AppColors.addpropertyfillclr)),
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
                contentPadding: EdgeInsets.symmetric(horizontal: 22,vertical: 18),
                hintStyle: GoogleFonts.poppins(color: AppColors.txtgreyclr,fontSize: 15),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color: AppColors.addpropertyfillclr),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color:AppColors.addpropertyfillclr),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color:AppColors.addpropertyfillclr),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1,
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                    BorderSide(width: 1, color:AppColors.addpropertyfillclr)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                    BorderSide(width: 1, color: AppColors.addpropertyfillclr)),
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
                contentPadding: EdgeInsets.symmetric(horizontal: 22,vertical: 18),
                hintStyle: GoogleFonts.poppins(color: AppColors.txtgreyclr,fontSize: 15),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color: AppColors.addpropertyfillclr),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color:AppColors.addpropertyfillclr),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color:AppColors.addpropertyfillclr),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1,
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                    BorderSide(width: 1, color:AppColors.addpropertyfillclr)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                    BorderSide(width: 1, color: AppColors.addpropertyfillclr)),
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
                  child: Image.asset(Images.telephonetxtfield,height: 5,),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 22,vertical: 18),
                hintStyle: GoogleFonts.poppins(color: AppColors.txtgreyclr,fontSize: 15),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color: AppColors.addpropertyfillclr),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color:AppColors.addpropertyfillclr),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color:AppColors.addpropertyfillclr),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1,
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                    BorderSide(width: 1, color:AppColors.addpropertyfillclr)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                    BorderSide(width: 1, color: AppColors.addpropertyfillclr)),
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
                contentPadding: EdgeInsets.symmetric(horizontal: 22,vertical: 18),
                hintStyle: GoogleFonts.poppins(color: AppColors.txtgreyclr,fontSize: 15),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color: AppColors.addpropertyfillclr),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color:AppColors.addpropertyfillclr),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color:AppColors.addpropertyfillclr),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1,
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                    BorderSide(width: 1, color:AppColors.addpropertyfillclr)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                    BorderSide(width: 1, color: AppColors.addpropertyfillclr)),
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
                hintText: "City",
                contentPadding: EdgeInsets.symmetric(horizontal: 22,vertical: 18),
                hintStyle: GoogleFonts.poppins(color: AppColors.txtgreyclr,fontSize: 15),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color: AppColors.addpropertyfillclr),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color:AppColors.addpropertyfillclr),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color:AppColors.addpropertyfillclr),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1,
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                    BorderSide(width: 1, color:AppColors.addpropertyfillclr)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                    BorderSide(width: 1, color: AppColors.addpropertyfillclr)),
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
                hintText: "Room Type",
                contentPadding: EdgeInsets.symmetric(horizontal: 22,vertical: 18),
                hintStyle: GoogleFonts.poppins(color: AppColors.txtgreyclr,fontSize: 15),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color: AppColors.addpropertyfillclr),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color:AppColors.addpropertyfillclr),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(width: 1, color:AppColors.addpropertyfillclr),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1,
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                    BorderSide(width: 1, color:AppColors.addpropertyfillclr)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                    BorderSide(width: 1, color: AppColors.addpropertyfillclr)),
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(20),
                //     borderSide: new BorderSide(color: Color(0xffBFBFBF))
                // )
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}
