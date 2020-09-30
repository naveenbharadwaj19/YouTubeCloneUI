import 'package:YouTubeCloneUI/models/store_data.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeWidgets extends StatefulWidget {
  @override
  _HomeWidgetsState createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
  Widget _circles(int index) {
    String imagePath = storeData[index].userImage;
    return Container(
      margin: EdgeInsets.only(top: 7, left: 5),
      child: CircleAvatar(
        backgroundImage: NetworkImage(imagePath),
        radius: 27,
      ),
    );
  }

  Widget _titleName(int index) {
    String titleName = storeData[index].title;
    return Container(
      margin: EdgeInsets.all(7),
      child: Text(
        titleName,
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _username(int index) {
    String userName = storeData[index].name;
    return Container(
      margin: EdgeInsets.only(top: 5, left: 80),
      child: Text(
        userName,
        style: TextStyle(
            fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  Widget _views(int index) {
    int views = storeData[index].views;
    String viewsStr;
    String value = "";
    if (views < 1000) {
      value = "";
      viewsStr = views.toString();
    } else if (views < 100000) {
      value = "k";
      viewsStr = views.toString();
      viewsStr = viewsStr[0];
    } else if (views < 1000000) {
      value = "M";
      viewsStr = views.toString();
      viewsStr = viewsStr[0];
    } else if (views < 10000000000) {
      value = "B";
      viewsStr = views.toString();
      viewsStr = viewsStr[0];
    }
    return Container(
      margin: EdgeInsets.only(top: 5, left: 10),
      child: Text(
        "$viewsStr $value views",
        style: TextStyle(
            fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  Widget _postedTime(int index) {
    double postedTimeSec = storeData[index].postedTime;
    int postedTimeRound = 0;
    String value = "";
    if (postedTimeSec < 60) {
      value = "Sec";
      postedTimeRound = postedTimeSec.round();
    } else if (postedTimeSec < 3600) {
      value = "Min";
      postedTimeSec = postedTimeSec / 60;
      postedTimeRound = postedTimeSec.round();
    } else if (postedTimeSec < 86400) {
      value = "Hrs";
      postedTimeSec = postedTimeSec / 3600;
      postedTimeRound = postedTimeSec.round();
    } else {
      value = "Days";
      postedTimeSec = postedTimeSec / 86400;
      postedTimeRound = postedTimeSec.round();
    }
    return Container(
      margin: EdgeInsets.only(top: 5, left: 10),
      child: Text(
        "$postedTimeRound $value ago",
        style: TextStyle(
            fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 350,
            child: Card(
              color: Theme.of(context).primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    // color: Colors.teal,
                    child: Image.network(
                      storeData[index].videoImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _circles(index),
                      _titleName(index),
                      // Fix placement correctly
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _username(index),
                      _views(index),
                      _postedTime(index)
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }, childCount: storeData.length),
    );
  }
}
