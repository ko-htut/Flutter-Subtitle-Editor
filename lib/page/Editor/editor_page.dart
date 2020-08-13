import 'package:flutter/material.dart';

class EditorPage extends StatefulWidget {
  EditorPage({Key key}) : super(key: key);

  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editor"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _videoview(),
            _subtitlelist(),
          ],
        ),
      ),
    );
  }

  Widget _videoview() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  Widget _subtitlelist() {
    return Text("data");
  }
}
