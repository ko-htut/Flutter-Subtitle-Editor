import 'package:flutter/material.dart';
import 'package:flutter_subtitle_editor/page/History/history_page.dart';
import 'package:flutter_subtitle_editor/page/Subtitle/subtitle_page.dart';
import 'package:flutter_subtitle_editor/page/menu/menu_page.dart';
import 'package:permission_handler/permission_handler.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  ScrollController _scrollViewController;

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    getPermission();
    _scrollViewController = new ScrollController();
    _tabController = new TabController(initialIndex: 0, vsync: this, length: 3);
  }

  @override
  void dispose() {
    _scrollViewController = new ScrollController();
    _tabController.dispose();
    super.dispose();
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Subtitle Editor"),
        bottom: new TabBar(
          // isScrollable: true,
          // indicatorSize: TabBarIndicatorSize.tab,
          tabs: <Tab>[
            Tab(
              text: "History",
            ),
            Tab(
              text: 'Subtitle',
            ),
            Tab(
              text: 'Menu',
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HistoryPage(),
          SubtitlePage(),
          MenuPage(),
        ],
      ),

      // child: Stack(
      //   children: <Widget>[
      //     NestedScrollView(
      //       controller: _scrollViewController,
      //       headerSliverBuilder:
      //           (BuildContext context, bool innerBoxIsScrolled) {
      //         return <Widget>[
      //           new SliverAppBar(
      //             elevation: 0,
      //             title: Text("Subtitle Editor"),
      //             pinned: true,
      //             // floating: true,
      //             // forceElevated: innerBoxIsScrolled,
      //             bottom: new TabBar(
      //               // isScrollable: true,
      //               // indicatorSize: TabBarIndicatorSize.tab,
      //               tabs: <Tab>[
      //                 Tab(
      //                   text: "History",
      //                 ),
      //                 Tab(
      //                   text: 'Subtitle',
      //                 ),
      //                 Tab(
      //                   text: 'Menu',
      //                 ),
      //               ],
      //               controller: _tabController,
      //             ),
      //           ),
      //         ];
      //       },
      //       body: TabBarView(
      //         controller: _tabController,
      //         children: [
      //           HistoryPage(),
      //           SubtitlePage(),
      //           MenuPage(),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
