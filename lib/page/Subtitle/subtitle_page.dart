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
    // TODO: implement initState
    super.initState();
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
    Directory dir = Directory('/storage/emulated/0/');
    String datapath = dir.toString();
    print(datapath);
    List<FileSystemEntity> _files;
    List<FileSystemEntity> _ass = [];
    List<FileSystemEntity> _srt = [];
    _files = dir.listSync(recursive: true, followLinks: false);
    for (FileSystemEntity entity in _files) {
      String path = entity.path;
      if (path.endsWith('.ass')) _ass.add(entity);
      if (path.endsWith('.srt')) _srt.add(entity);
    }
    print(_ass);
    print(_ass.length);

    Widget _assdata() {
      return Column(
        children: [
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: _ass
                    .map((e) => SubFileItem(
                          file: e,
                        ))
                    .toList()),
          )
        ],
      );
    }

    Widget _srtdata() {
      return Column(
        children: [
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: _srt
                    .map((e) => SubFileItem(
                          file: e,
                        ))
                    .toList()),
          )
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          _assdata(),
          _srtdata(),
        ],
      )),
    );
  }
}
