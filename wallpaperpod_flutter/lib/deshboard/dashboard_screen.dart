import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wallpaperpod_client/wallpaperpod_client.dart';
import 'package:wallpaperpod_flutter/add_wallpaper/add_wallpaper_screen.dart';
import 'package:wallpaperpod_flutter/home/home_screen.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AddWallpaperScreen(),
    Text(
      'Index 2: School',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('---client : ${GetIt.I<Client>()}');
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.local_convenience_store_outlined), label: 'Local'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
