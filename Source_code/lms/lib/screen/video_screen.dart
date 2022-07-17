import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({Key? key, required this.url}) : super(key: key);
  var url;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    VideoPlayerController videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    var videotitle = 'videotitle';

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
    Color color = Color.fromRGBO(87, 168, 158, 1);
    Color _curcolor = Color.fromRGBO(40, 111, 108, 0.699999988079071);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              title: Text(
                'Detail Course',
                style: TextStyle(fontSize: 20),
              ),
              trailing: CircleAvatar(
                backgroundImage: AssetImage('assets/images/landing.png'),
              ),
            ),
            Container(width: double.infinity, height: 400, child: playerWidget),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    _selesai = true;
                    if (_selesai == true) {
                      _curcolor = color;
                    }
                  },
                );
              },
              child: Text('Selesai'),
              style: ElevatedButton.styleFrom(
                primary: _curcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
