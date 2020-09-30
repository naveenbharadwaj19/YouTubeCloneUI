import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int _index;
  final Function _ontapped;
  BottomBar(this._index, this._ontapped);
  @override
  Widget build(BuildContext context) {
    final double _size = 30;
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: _ontapped,
      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(
            Icons.home,
            size: _size,
          ),
          title: const Text("home"),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(
            Icons.explore,
            size: _size,
          ),
          title: const Text("Explore"),
        ),
        BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.add_circle_outline,
              size: _size,
            ),
            title: const Text("Add")),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(
            Icons.subscriptions,
            size: _size,
          ),
          title: const Text("Subscriptions"),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(
            Icons.library_add,
            size: _size,
          ),
          title: const Text("Library"),
        )
      ],
    );
  }
}
