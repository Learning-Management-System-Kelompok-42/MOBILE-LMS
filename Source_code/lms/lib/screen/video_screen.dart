import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  var videotitle = 'videotitle';

  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'detail_course_screen');
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
            const SizedBox(height: 10),
            Container(
              width: 300,
              height: 30,
              child: Text(
                'Video - $videotitle',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Center(
              child: _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller!.value.isPlaying
                ? _controller!.pause()
                : _controller!.play();
          });
        },
        child: Icon(
          _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
