import 'package:flutter_filereader/flutter_filereader.dart';
import 'package:flutter/material.dart';

class SlideScreen extends StatefulWidget {
  const SlideScreen({Key? key}) : super(key: key);

  @override
  State<SlideScreen> createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FileReaderView(filePath: 'assets/images/ppt.pptx'),
    );
  }
}
