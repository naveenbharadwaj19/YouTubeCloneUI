import 'package:YouTubeCloneUI/models/categories.dart';
import 'package:YouTubeCloneUI/widgets/home_widgets.dart';
import 'package:YouTubeCloneUI/widgets/stories_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget _lstCategories() {
    return Container(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3),
              child: FloatingActionButton.extended(
                  backgroundColor: Colors.grey[600],
                  onPressed: () {},
                  label: Text(categories[index])),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _lstCategories(),
        ),
        HomeWidgets(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "Stories",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        Stories(),
        HomeWidgets()
      ],
    );
  }
}
