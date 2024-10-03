import 'package:bit_taqwa_app/utils/color.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Widget Header(){
      return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg_header_dashboard_morning.png"),
          fit: BoxFit.cover,
          ),
        ),

        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(6),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorApp.white,
                ),

                child: Text("Asslammualaikum, Athar", style: TextStyle(fontFamily: "PoppinsMedium"),),
              ),
            ),
            SizedBox(height: 16,),
            Text("Subuh", style: TextStyle(fontFamily: "PoppinsMedium", fontSize: 16),),

            SizedBox(height: 4,),

            Text("04:48", style: TextStyle(fontFamily: "PoppinsBold", fontSize: 36),),

            SizedBox(height: 4,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: ColorApp.red,
                  size: 16,
                ),

                SizedBox(width: 4,),

                Text("Berjo, Karanganyar", style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 12),),
              ],
            )
          ],
        ),
      );
    }
    Widget CardMenus(){

      return Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: ColorApp.primary
        ),
        child: SingleChildScrollView(scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              children: [
                Image.asset("assets/images/ic_menu_doa.png"),
                Text("Doa-Doa", style: TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 14, color: ColorApp.white),),
              ],
            ),

            SizedBox(width: 12,),

            Column(
              children: [
                Image.asset("assets/images/ic_menu_zakat.png"),
                Text("Zakat", style: TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 14, color: ColorApp.white),),
              ],
            ),

            SizedBox(width: 12,),
            
            Column(
              children: [
                Image.asset("assets/images/ic_menu_jadwal_sholat.png"),
                Text("Jadwal Sholat", style: TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 14, color: ColorApp.white),),
              ],
            ),

            SizedBox(width: 12,),
            
            Column(
              children: [
                Image.asset("assets/images/ic_menu_video_kajian.png"),
                Text("Video Kajian", style: TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 14, color: ColorApp.white),),
              ],
            ),
          ],
        ),
        ),
      );
    }
    Widget Inspiration(){
      return Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text("Inspirations", style: TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 20),)
            ),

            SizedBox(height: 8,),

            Image.asset("assets/images/img_inspiration.png",
              fit: BoxFit.cover,
            ),

            SizedBox(height: 8,),

            Image.asset("assets/images/img_inspiration_2.jpeg",
              fit: BoxFit.cover,
            ),

            SizedBox(height: 8,),

            Image.asset("assets/images/img_inspiration_3.jpeg",
              fit: BoxFit.cover,
            ),

            SizedBox(height: 8,),

            Image.asset("assets/images/img_inspiration_4.jpeg",
              fit: BoxFit.cover,
            ),

            SizedBox(height: 8,),

            Image.asset("assets/images/img_inspiration_5.jpeg",
              fit: BoxFit.cover,
            ),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: ListView(
        children: [
          Header(),
          CardMenus(),
          Inspiration(),
        ],
      ),
    );
  }
}