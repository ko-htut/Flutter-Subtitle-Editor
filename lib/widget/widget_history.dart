import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';

class HistroyWidget extends StatelessWidget {
  const HistroyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 45,
            width: double.infinity,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Romeo X Juliet"),
                      Container(
                        width: 10,
                      ),
                      Chip(
                        label: Text(
                          "ASS",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.blueGrey,
                      )
                    ],
                  ),
                  Icon(AntIcons.delete_outline)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "/storage/emulated/0/remo-juliet-to-english-129106",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Romeo x Juliet 01 [umai][ED5CA47B].ass"),
          )
        ],
      ),
    );
  }
}
