import 'package:bit_taqwa_app/presentation/screens/doa_list.dart';
import 'package:bit_taqwa_app/presentation/widgets/Doa_Item.dart';
import 'package:bit_taqwa_app/utils/color.dart';
import 'package:flutter/material.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text("Doa - Doa", style: TextStyle(fontFamily: "PoppinsMedium", color: ColorApp.white),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_outlined), color: ColorApp.white,),
      ),

      body: Column(
        children: [
          Image.asset("assets/images/bg_header_doa.png"),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 24,
              crossAxisSpacing: 12,
              children: [
                DoaItem(image: "assets/images/ic_doa_pagi_malam.png", title: "Pagi & Malam", onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoaList(category: 'Pagi & Malam',),));
                },),

                DoaItem(image: "assets/images/ic_doa_rumah.png", title: "Rumah", onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoaList(category: 'Rumah',),));
                },),

                DoaItem(image: "assets/images/ic_doa_makanan_minuman.png", title: "Makan & Minum", onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoaList(category: 'Makanan & Minuman',),));
                },),

                DoaItem(image: "assets/images/ic_doa_perjalanan.png", title: "Perjalanan", onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoaList(category: 'Perjalanan',),));
                },),

                DoaItem(image: "assets/images/ic_doa_sholat.png", title: "Sholat", onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoaList(category: 'Sholat',),));
                },),

                DoaItem(image: "assets/images/ic_doa_etika_baik.png", title: "Etika", onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoaList(category: 'Etika Baik',),));
                },),
              ],
            ),
          ),),
        ],
      ),
    );
  }
}