import 'dart:io';
import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_subtitle_editor/utils/file_extentions.dart';
import 'package:marquee_widget/marquee_widget.dart';

class SubFileItem extends StatefulWidget {
  final FileSystemEntity file;
  const SubFileItem({Key key, @required this.file}) : super(key: key);

  @override
  _SubFileItemState createState() => _SubFileItemState();
}

class _SubFileItemState extends State<SubFileItem> {
  @override
  Widget build(BuildContext context) {
    File myfile = File(widget.file.path);
    return InkWell(
      onDoubleTap: () {
        dialog(context, fileSystemEntity: widget.file);
      },
      child: Card(
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Marquee(
                    child: Text(
                      myfile.name,
                      maxLines: 1,
                    ),
                  ),
                  Text(myfile.lastModifiedSync().toString()),
                ],
              ),
              Icon(AntIcons.file_text),
            ],
          ),
        ),
      ),
    );
  }

  void dialog(BuildContext context, {FileSystemEntity fileSystemEntity}) {
    List<String> dilist = [
      "rename",
      "delete",
      "coppy",
    ];
    File myfile = File(widget.file.path);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 16),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'Action',
                      //   textAlign: TextAlign.left,
                      //   style: TextStyle(fontWeight: FontWeight.normal),
                      // ),
                      Text(
                        myfile.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ]
                  .followedBy([
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Divider(height: 0),
                    ),
                  ])
                  .followedBy(
                    dilist
                        .map<Widget>(
                          (e) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              MaterialButton(
                                height: 48,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[Text(e), Text('Data')],
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  )
                  .toList(),
            ),
          );
        });
  }
}
