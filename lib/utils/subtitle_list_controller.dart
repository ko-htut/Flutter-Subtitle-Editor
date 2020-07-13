import 'dart:convert';
import 'package:flutter_subtitle_editor/models/subtitle.dart';
import 'package:flutter_subtitle_editor/models/subtitles.dart';
// import 'package:flutter_subtitle_editor/models/subtitles.dart';
import 'package:http/http.dart' as http;

class SubtitleListController {
  String subtitlesContent;
  String subtitleUrl;
  final bool showSubtitles;

  SubtitleListController({
    this.subtitleUrl,
    this.subtitlesContent,
    this.showSubtitles = true,
  });

  Future <Subtitles> getSubtitles() async {
    RegExp regExp = new RegExp(
      r"^((\d{2}):(\d{2}):(\d{2}),(\d{3})) +--> +((\d{2}):(\d{2}):(\d{2}),(\d{2})).*[\r\n]+\s*((?:(?!\r?\n\r?).)*)",
      caseSensitive: false,
      multiLine: true,
    );
    if (subtitlesContent == null && subtitleUrl != null) {
      http.Response response = await http.get(subtitleUrl);
      if (response.statusCode == 200) {
        subtitlesContent = utf8.decode(response.bodyBytes);
      }
    }
    print(subtitlesContent);

    List<RegExpMatch> matches = regExp.allMatches(subtitlesContent).toList();
    List<Subtitle> subtitleList = List();
print("print ${subtitleList.length}");
    matches.forEach((RegExpMatch regExpMatch) {
      print("print startTimeHours : ${regExpMatch.group(2)}");
      int startTimeHours = int.parse(regExpMatch.group(2));
      int startTimeMinutes = int.parse(regExpMatch.group(3));
      int startTimeSeconds = int.parse(regExpMatch.group(4));
      int startTimeMilliseconds = int.parse(regExpMatch.group(5));

      int endTimeHours = int.parse(regExpMatch.group(7));
      int endTimeMinutes = int.parse(regExpMatch.group(8));
      int endTimeSeconds = int.parse(regExpMatch.group(9));
      int endTimeMilliseconds = int.parse(regExpMatch.group(10));
      String text = (regExpMatch.group(11)).toString();

      print(text);

      Duration startTime = Duration(
          hours: startTimeHours,
          minutes: startTimeMinutes,
          seconds: startTimeSeconds,
          milliseconds: startTimeMilliseconds);
      Duration endTime = Duration(
          hours: endTimeHours,
          minutes: endTimeMinutes,
          seconds: endTimeSeconds,
          milliseconds: endTimeMilliseconds);

      subtitleList.add(
          Subtitle(startTime: startTime, endTime: endTime, text: text.trim()));
    });


    print(subtitleList);

    Subtitles subtitles = Subtitles(subtitles: subtitleList);
    print("subtitles");
    return subtitles;
    // Subtitles subtitles = Subtitles(subtitles: subtitleList);
 
  }

}
