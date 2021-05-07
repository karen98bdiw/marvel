import 'package:flutter/material.dart';

class ButtomNavigationBar extends StatefulWidget {
  @override
  _ButtomNavigationBarState createState() => _ButtomNavigationBarState();
}

class _ButtomNavigationBarState extends State<ButtomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
        BottomNavigationBarItem(
            icon: Icon((Icons.headset_sharp)), label: "Favorites"),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.red,
      onTap: _onItemTapped,
    );
  }
}
