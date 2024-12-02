import 'package:bit_taqwa_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';

class ZakatScreen extends StatefulWidget {
  ZakatScreen({super.key});

  @override
  State<ZakatScreen> createState() => _ZakatScreenState();
}

class _ZakatScreenState extends State<ZakatScreen> {
  final MoneyMaskedTextController moneyController = MoneyMaskedTextController(
    thousandSeparator: '.', decimalSeparator: '', precision: 0,
  );

  double totalHarta = 0;

  double zakatDikeluarkan = 0;

  double mininumHarta = 85000000;

  String formatedHarta = "";

  String formatedZakatDikeluarkan = "";

  void HitungZakat(){
    String cleanValue = moneyController.text.replaceAll(".", "");

    double inputValue = double.tryParse(cleanValue)?? 0;

    if (inputValue >= mininumHarta) {
      //jika inputan itu lebih dari mininum Harta akan kita ubah Value nya
      setState(() {
        totalHarta = inputValue;
        zakatDikeluarkan = (inputValue * 2.5) / 100;

        //Ubah Jadi Format Rupiah
        formatedHarta = NumberFormat.currency(locale: 'id_ID', symbol: '').format(totalHarta);
        formatedZakatDikeluarkan = NumberFormat.currency(locale: 'id_ID', symbol: '').format(zakatDikeluarkan);
      });
    } else {
      //jika harta kurang dari 85jt maka muncul kan Dialog
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Kere Amat bng 😏", style: TextStyle(fontFamily: "PoppinsBold"),),
        content: Text("segitu doang? yee gausah sok Zakat2, belii makann duluu sono, heh zakat tuh sekarang minimall 85jt yee gaa nerima uangg2 segituu doang tuh, PAHAMM!!", style: TextStyle(fontFamily: "Poppinsregular"),),
        actions: [
          IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.close))
        ],
      ),);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget CardHarta(){
      return Container(
        margin: EdgeInsets.all(24),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorApp.grey
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total Harta", style: TextStyle(fontFamily: "PoppinsMedium", color: ColorApp.primary),),
            SizedBox(height: 16,),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: moneyController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: ColorApp.primary)
                ),
                label: Text("Masukan Total Harta"),
                labelStyle: TextStyle(color: ColorApp.primary),
                prefix: Text("Rp. "),
                fillColor: ColorApp.white,
                filled: true
              ),
            ),

            SizedBox(height: 16,),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                minimumSize: Size(double.infinity, 0),
                padding: EdgeInsets.all(16)
              ),
              onPressed: () {
                HitungZakat();
              },
              child: Text("Ok", style: TextStyle(color: ColorApp.white),)
            ),

            
          ],
        ),
      );
    }

    Widget CardResult(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(scrollDirection: Axis.horizontal,),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.red[300]!,
            ),

            child: Column(
              children: [
                Text("Total Uang", style: TextStyle(fontFamily: "PoppinsMedium", color: ColorApp.white),),

                SizedBox(height: 32,),

                Text("Rp. ${formatedHarta}", style: TextStyle(fontFamily: "PoppinsMedium", color: ColorApp.white),),

              ],
            ),
          ),

          SizedBox(width: 20,),
          
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.purple[300]!,
            ),

            child: Column(
              children: [
                Text("Zakat Dikeluarkan", style: TextStyle(fontFamily: "PoppinsMedium", color: ColorApp.white),),

                SizedBox(height: 32,),

                Text("Rp. ${formatedZakatDikeluarkan}", style: TextStyle(fontFamily: "PoppinsMedium", color: ColorApp.white),),

              ],
            ),
          ),
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text("Kalkulator Zakat", style: TextStyle(fontFamily: "PoppinsMedium", color: ColorApp.white),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_outlined), color: ColorApp.white,),
      ),

      body: ListView(
        children: [
          Image.asset("assets/images/bg_header_zakat.png"),
          CardHarta(),
          CardResult(),
        ],
      ),
    );
  }
}