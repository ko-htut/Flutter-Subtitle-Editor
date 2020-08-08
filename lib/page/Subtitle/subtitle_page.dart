import 'package:flutter/material.dart';
import 'package:flutter_subtitle_editor/widget/widget_subtile_file_item.dart';

class SubtitlePage extends StatefulWidget {
  SubtitlePage({Key key}) : super(key: key);

  @override
  _SubtitlePageState createState() => _SubtitlePageState();
}

class _SubtitlePageState extends State<SubtitlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("ASS",style: TextStyle(color: Colors.white),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SubFileItem(),
                  SubFileItem(),
                  SubFileItem(),
                  SubFileItem(),
                  SubFileItem()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
