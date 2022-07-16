import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SlideScreen extends StatefulWidget {
  var url;

  SlideScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<SlideScreen> createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
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
            ElevatedButton(
                onPressed: () {
                  _pdfViewerKey.currentState?.openBookmarkView();
                },
                child: Text('mulai')),
            Container(
                width: double.infinity,
                height: 300,
                child: SfPdfViewer.asset('assets/images/pdf2.pdf')),
          ],
        ),
      ),
    );
  }
}
