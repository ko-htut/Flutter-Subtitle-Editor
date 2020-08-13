import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_subtitle_editor/widget/widget_subtile_file_item.dart';
import 'package:permission_handler/permission_handler.dart';

class SubtitlePage extends StatefulWidget {
  SubtitlePage({Key key}) : super(key: key);

  @override
  _SubtitlePageState createState() => _SubtitlePageState();
}

class _SubtitlePageState extends State<SubtitlePage> {
  @override
  void initState() {
    super.initState();
    getPermission();
  }

  void getPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Widget _filddata() {
      return Column(
        children: [
          FutureBuilder(
              future: filelist(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text('Data is loading...'),
                    ),
                  );
                } else {
                  List<FileSystemEntity> file = snapshot.data;
                  var srt = new List<FileSystemEntity>();
                  var ass = new List<FileSystemEntity>();
                  for (FileSystemEntity entity in file) {
                    String path = entity.path;
                    if (path.endsWith('.srt')) srt.add(entity);
                    if (path.endsWith('.ass')) ass.add(entity);
                  }

                  return Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "ASS",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Column(
                          children: ass
                              .map((e) => SubFileItem(
                                    file: e,
                                  ))
                              .toList()),
                      Container(
                        width: double.infinity,
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "SRT",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Column(
                          children: srt
                              .map((e) => SubFileItem(
                                    file: e,
                                  ))
                              .toList()),
                    ],
                  );
                }
              }),
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: _filddata(),
      ),
    );
  }

  Future<List<FileSystemEntity>> filelist() async {
    Directory dir = Directory('/storage/emulated/0/');
    var filesList = new List<FileSystemEntity>();
    filesList = dir.listSync(recursive: true, followLinks: false);
    await new Future.delayed(new Duration(milliseconds: 1000));
    return filesList;
  }
}
