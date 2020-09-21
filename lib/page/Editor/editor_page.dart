import 'package:ant_icons/ant_icons.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class EditorPage extends StatefulWidget {
  EditorPage({Key key}) : super(key: key);

  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        'https://sfux-ext.sfux.info/hls/chapter/105/1588724110/1588724110.m3u8');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController1.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editor"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(AntIcons.bars),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          _videoview(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                  _subtitlelist(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _videoview() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          Container(
            color: Colors.grey,
            child: Chewie(
              controller: _chewieController,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  (_chewieController.showControls == true) ? "subtitle" : "",
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          )
        ],
      ),
    );
  }

  Widget _subtitlelist() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text("0:0:00:00"),
              Text("0:0:01:00"),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "ABCD abcd",
                  maxLines: 2,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "Deaflut",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(8.0),
          height: 25,
          width: 25,
          color: Colors.green,
          child: Icon(
            AntIcons.info_outline,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
