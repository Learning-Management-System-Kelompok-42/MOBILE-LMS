import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    var videotitle = 'videotitle';

    VideoPlayerController videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

    ChewieController chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: false,
        looping: false);

    final playerWidget = Chewie(controller: chewieController);

    @override
    void dispose() {
      videoPlayerController.dispose();
      chewieController.dispose();
      super.dispose();
    }

    bool _selesai = false;
    Color color = Color.fromRGBO(40, 111, 108, 0.699999988079071);
    return Scaffold(
      body: ListView(
        children: [
          playerWidget,
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    _selesai = true;
                    if (_selesai == true) {
                      color = Color.fromRGBO(87, 168, 158, 1);
                    }
                  },
                );
              },
              child: Text('Selesai'),
              style: ElevatedButton.styleFrom(
                primary: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget button() {
  //   return ElevatedButton(
  //     onPressed: () {
  //       setState(() {
  //         _selesai = true;
  //         if (_selesai == true) {
  //           color = Color.fromRGBO(87, 168, 158, 1);
  //         }
  //       });
  //     },
  //     child: Text('Selesai'),
  //     style: ElevatedButton.styleFrom(
  //       primary: Color.fromRGBO(40, 111, 108, 0.699999988079071),
  //     ),
  //   );
  // }
}
