import 'dart:io';
import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_subtitle_editor/utils/file_extentions.dart';
import 'package:marquee_widget/marquee_widget.dart';

class SubFileItem extends StatelessWidget {
  final FileSystemEntity file;
  const SubFileItem({Key key, @required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File myfile = File(file.path);
    return Card(
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
    );
  }
}
