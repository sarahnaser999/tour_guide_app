import 'package:flutter/material.dart';
import 'package:tour_guide_app/models/trip.dart';
import 'package:tour_guide_app/screens/categoeries_screen.dart';
import 'package:tour_guide_app/screens/favorites_screen.dart';
import 'package:tour_guide_app/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoritetrips;

  const TabsScreen(this.favoritetrips);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenindex = index;
    });
  }

  int _selectedScreenindex = 0;
  // ignore: unused_field
  late List<Map<String, Object>> _screen;
  @override
  void initState() {
    _screen = [
      {'Screen': CateogeriesScreen(), 'Title': 'التصنيفات'},
      {
        'Screen': FavoritesScreen(widget.favoritetrips),
        'Title': 'الرحلات المفضله',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            _screen[_selectedScreenindex]['Title'] as String,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: AppDrawer(),
      body: _screen[_selectedScreenindex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.yellow[700],
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'المفضله '),
        ],
      ),
    );
  }
}
