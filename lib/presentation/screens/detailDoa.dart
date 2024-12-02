// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bit_taqwa_app/utils/color.dart';

class DetailDoa extends StatelessWidget {
  final String title;
  final String arabicText;
  final String translation;
  final String reference;
  const DetailDoa({
    Key? key,
    required this.title,
    required this.arabicText,
    required this.translation,
    required this.reference,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text("Detail Doa", style: TextStyle(fontFamily: "PoppinsMedium", color: ColorApp.white),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_outlined), color: ColorApp.white,),
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg_detail_doa.png"),
          fit: BoxFit.cover,
          ),
        ),

        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorApp.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 10,
                  spreadRadius: 2,

                )
              ]
            ),

            child: Column(
              children: [
                Text(title, textAlign: TextAlign.center, style: TextStyle(fontFamily: "PoppinsBold", fontSize: 24, color: ColorApp.text),),

                SizedBox(
                  height: 16,
                ),

                Text(arabicText, textAlign: TextAlign.center, style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 20, color: ColorApp.text),),

                SizedBox(
                  height: 16,
                ),

                Text(translation, textAlign: TextAlign.center, style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 16, color: Colors.blue[200]),),

                SizedBox(
                  height: 16,
                ),

                Text(reference, textAlign: TextAlign.center, style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 12, color: Colors.grey),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
