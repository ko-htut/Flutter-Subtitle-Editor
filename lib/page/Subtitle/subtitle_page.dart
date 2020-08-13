import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_subtitle_editor/page/Editor/editor_page.dart';
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
    // Directory dir = Directory('/storage/emulated/0/');
    // String datapath = dir.toString();
    // print(datapath);
    // List<FileSystemEntity> _files;
    // List<FileSystemEntity> _ass = [];
    // List<FileSystemEntity> _srt = [];
    // _files = dir.listSync(recursive: true, followLinks: false);
    // for (FileSystemEntity entity in _files) {
    //   String path = entity.path;
    //   if (path.endsWith('.ass')) _ass.add(entity);
    //   if (path.endsWith('.srt')) _srt.add(entity);
    // }
    // print(_ass);
    // print(_ass.length);

    // Widget _assdata() {
    //   return Column(
    //     children: [
    //       Container(
    //         width: double.infinity,
    //         color: Colors.grey,
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Text(
    //             "ASS",
    //             style: TextStyle(color: Colors.white),
    //           ),
    //         ),
    //       ),
    //       FutureBuilder(
    //           future: assfilelist(),
    //           builder: (BuildContext context, AsyncSnapshot snapshot) {
    //             if (snapshot.connectionState == ConnectionState.waiting) {
    //               return new Text('Data is loading...');
    //             } else {
    //               List<FileSystemEntity> srt = snapshot.data;
    //               // print("ass : ${srt.length}");
    //               // return Text("data");
    //               return Column(
    //                   children: srt
    //                       .map((e) => SubFileItem(
    //                             file: e,
    //                           ))
    //                       .toList());
    //             }
    //           }),
    //     ],
    //   );
    // }

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

  // Future<List<FileSystemEntity>> srtfilelist() async {
  //   Directory dir = Directory('/storage/emulated/0/');
  //   var filesList = new List<FileSystemEntity>();
  //   var srt = new List<FileSystemEntity>();
  //   // filesList = await FilesInDirectory().getFilesFromDir();
  //   filesList = dir.listSync(recursive: true, followLinks: false);
  //   for (FileSystemEntity entity in filesList) {
  //     String path = entity.path;
  //     if (path.endsWith('.srt')) srt.add(entity);
  //   }
  //   await new Future.delayed(new Duration(milliseconds: 500));
  //   print(srt.length);
  //   return srt;
  // }

  // Future<List<FileSystemEntity>> assfilelist() async {
  //   Directory dir = Directory('/storage/emulated/0/');
  //   var filesList = new List<FileSystemEntity>();
  //   var ass = new List<FileSystemEntity>();
  //   // filesList = await FilesInDirectory().getFilesFromDir();
  //   filesList = dir.listSync(recursive: true, followLinks: false);
  //   for (FileSystemEntity entity in filesList) {
  //     String path = entity.path;
  //     if (path.endsWith('.ass')) ass.add(entity);
  //   }
  //   await new Future.delayed(new Duration(milliseconds: 500));
  //   print(ass.length);
  //   return ass;
  // }

  Future<List<FileSystemEntity>> filelist() async {
    Directory dir = Directory('/storage/emulated/0/');
    var filesList = new List<FileSystemEntity>();
    filesList = dir.listSync(recursive: true, followLinks: false);
    await new Future.delayed(new Duration(milliseconds: 500));
    return filesList;
  }
}
