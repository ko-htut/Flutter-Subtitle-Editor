import 'package:flutter/material.dart';
import 'package:flutter_subtitle_editor/widget/widget_history.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HistroyWidget(),
              HistroyWidget(),
              HistroyWidget(),
              HistroyWidget(),
              HistroyWidget()
            ],
          ),
        ),
      ),
    );
  }
}
