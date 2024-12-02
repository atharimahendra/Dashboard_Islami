
import 'package:bit_taqwa_app/utils/color.dart';
import 'package:flutter/material.dart';

class DoaItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  const DoaItem({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorApp.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              blurRadius: 3,
              spreadRadius: 1,
            )
          ]
        ),
                  
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(image),
              ),
              SizedBox(height: 6,),
              Text(title, style: TextStyle(fontFamily: "Poppinsregular", fontSize: 14),),
            ],
          ),
        ),
      ),
    );
  }
}