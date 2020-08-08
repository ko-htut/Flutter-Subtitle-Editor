import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';

class SubFileItem extends StatelessWidget {
  const SubFileItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:  Text("Romeo x Juliet 01 [umai][ED5CA47B].ass"),
      trailing: Icon(AntIcons.file_text,size: 20,),
    );
  }
}
