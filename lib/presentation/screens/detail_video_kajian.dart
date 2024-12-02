// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bit_taqwa_app/data/data_video.dart';
import 'package:flutter/material.dart';

import 'package:bit_taqwa_app/utils/color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailVideoKajian extends StatefulWidget {
  final String title;
  final String ustadz;
  final String account;
  final String url;
  final String description;
  const DetailVideoKajian({
    Key? key,
    required this.title,
    required this.ustadz,
    required this.account,
    required this.url,
    required this.description,
  }) : super(key: key);

  @override
  State<DetailVideoKajian> createState() => _DetailVideoKajianState();
}

class _DetailVideoKajianState extends State<DetailVideoKajian> {
  //1. buat controller untuk mengatur Video
  late YoutubePlayerController _controller;

  //2. inisialisasi Controller di dalam initState
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
    flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
    ),
);

  //3. dispose atau menghancurkan Controller yang telah ada
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text(widget.title, style: TextStyle(fontFamily: "PoppinsMedium", color: ColorApp.white),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_outlined), color: ColorApp.white,),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [         
            YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
                onReady: () {
                  _controller.addListener(() {
                    setState(() {});
                  },);
                },
            ),
            Padding(padding: EdgeInsets.all(8),
              child: Text(widget.account, style: TextStyle(fontFamily: 'PoppinsRegular', color: Colors.grey),),
            ),

            Padding(padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(widget.ustadz, style: TextStyle(fontFamily: 'PoppinsRegular', color: Colors.grey, fontSize: 16),),
            ),

            Padding(padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(widget.title, style: TextStyle(fontFamily: 'PoppinsSemiBold', color: Colors.black, fontSize: 18),),
            ),

            Padding(padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(widget.description, style: TextStyle(fontFamily: 'PoppinsRegular', color: Colors.black, fontSize: 16), textAlign: TextAlign.justify,),
            ),
          ],
        ),
      ),
    );
  }
}