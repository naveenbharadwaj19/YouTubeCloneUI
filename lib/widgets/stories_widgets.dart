import 'package:YouTubeCloneUI/models/store_data.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 250,
        child: ListView.builder(
            itemCount: storeData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                margin: EdgeInsets.only(top: 5, left: 5),
                child: Stack(
                  children: [
                    Container(
                      height: 240,
                      child: Image.network(
                        storeData[index].videoImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(bottom: 15),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 25,
                        child: CircleAvatar(
                          radius: 23,
                          backgroundImage:
                              NetworkImage(storeData[index].userImage),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
