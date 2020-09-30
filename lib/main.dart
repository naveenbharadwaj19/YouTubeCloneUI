import 'package:YouTubeCloneUI/bottom_bar.dart';
import 'package:YouTubeCloneUI/icons/you_tube_icon_icons.dart';
import 'package:YouTubeCloneUI/screens/add_screen.dart';
import 'package:YouTubeCloneUI/screens/exp_screen.dart';
import 'package:YouTubeCloneUI/screens/home_screen.dart';
import 'package:YouTubeCloneUI/screens/lib_screen.dart';
import 'package:YouTubeCloneUI/screens/sub_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YouTubeClone",
      theme: ThemeData(
        primaryColor: Color(0xff282828),
      ),
      routes: {},
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _widgetsScreenTapped = [
    HomeScreen(),
    ExploreScreen(),
    AddScreen(),
    SubScreen(),
    LibraryScreen()
  ];

  int index = 0;

  tapped(int idx) {
    setState(() {
      index = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: Icon(
          YouTubeIcon.youtube,
          color: Colors.red,
        ),
        title: Text("YouTube"),
        actions: [
          Icon(Icons.notifications),
          Padding(padding: EdgeInsets.all(10)),
          Icon(Icons.search),
          Padding(padding: EdgeInsets.all(10)),
          Icon(Icons.person),
        ],
      ),
      body: _widgetsScreenTapped[index],
      bottomNavigationBar: BottomBar(index, tapped),
    );
  }
}
