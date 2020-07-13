import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_subtitle_editor/models/style/subtitle_style.dart';
import 'package:flutter_subtitle_editor/models/subtitle.dart';
import 'package:flutter_subtitle_editor/models/subtitles.dart';
import 'package:flutter_subtitle_editor/utils/subtitle_controller.dart';
import 'package:flutter_subtitle_editor/utils/subtitle_list_controller.dart';
import 'package:flutter_subtitle_editor/utils/subtitle_wrapper_package.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  // List<Subtitle> sub;
  final String link =
      "https://eboxmovie.sgp1.digitaloceanspaces.com/How%20Not%20to%20Summon%20a%20Demon%20Lord%20Ending%20Full%20_%20Saiaku%20na%20Hi%20demo%20Anata%20ga%20Suki.%20-%20%20Yu%20Serizawa%20Lyrics_BWiuBMyFQLw_360p.mp4";
  final String subtitleUrl =
      "https://eboxmovie.sgp1.digitaloceanspaces.com/mmmmtest.srt";

  VideoPlayerController getVideoPlayerController() {
    if (videoPlayerController == null) {
      videoPlayerController = new VideoPlayerController.network(link);
    }
    return videoPlayerController;
  }

  ChewieController getChewieController() {
    if (chewieController == null) {
      chewieController = ChewieController(
        videoPlayerController: getVideoPlayerController(),
        aspectRatio: 4 / 3,
        autoPlay: true,
        autoInitialize: true,
      );
    }
    return chewieController;
  }

  @override
  Widget build(BuildContext context) {
    ChewieController chewieController = getChewieController();

    getsublist() {
      return FutureBuilder<Subtitles>(
        future: SubtitleListController(
          subtitleUrl: subtitleUrl,
          showSubtitles: true,
        ).getSubtitles(),
        builder: (context, projectSnap) {
          return Column(
              children: projectSnap.data.subtitles
                  .map(
                    (v) => GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            color: Colors.grey[300],
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                              children: <Widget>[
                              Text(v.text),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.skip_previous,size: 15,),
                                      Text(v.startTime.toString()),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.play_arrow,size: 15,),
                                      Text("Default"),
                                      Icon(Icons.edit,size: 15,)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(v.endTime.toString()),
                                      Icon(Icons.skip_next,size: 15,)
                                    ],
                                  )
                                ],
                              )
                              ],
                        ),
                            ),
                          ),
                        )),
                  )
                  .toList());
        },
      );
    }

    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
                height: 200,
                //padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                child: SubTitleWrapper(
                    videoPlayerController:
                        chewieController.videoPlayerController,
                    subtitleController: SubtitleController(
                      subtitleUrl: subtitleUrl,
                      showSubtitles: true,
                    ),
                    subtitleStyle:
                        SubtitleStyle(textColor: Colors.black, hasBorder: true),
                    videoChild: Chewie(
                      controller: chewieController,
                    ))),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white70,
                  size: 32,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height - 200,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              // _title(),
              getsublist(),

              // _des(),
              // _find(),
              Divider(),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _title() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      alignment: Alignment.centerLeft,
      child: Text(
        "Subtitle List",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        maxLines: 1,
        overflow: TextOverflow.clip,
      ),
    );
  }

  Widget _videopage() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
          elevation: 2.0,
          child: SubTitleWrapper(
              videoPlayerController: chewieController.videoPlayerController,
              subtitleController: SubtitleController(
                subtitleUrl: subtitleUrl,
                showSubtitles: true,
              ),
              subtitleStyle:
                  SubtitleStyle(textColor: Colors.black, hasBorder: true),
              videoChild: Chewie(
                controller: chewieController,
              ))),
    );
  }

  @override
  void dispose() {
    super.dispose();
//    if (videoPlayerController != null && chewieController != null) {
//      videoPlayerController?.dispose();
//      chewieController?.dispose();
//    }
    debugPrint('videoPlayerController - dispose()');
  }
}
