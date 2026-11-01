// ignore_for_file: unused_local_variable, public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tour_guide_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoutes = '/filters';
  final Function savefilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.savefilters, this.currentFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _Summer = false;
  var _Winter = false;
  var _Famaily = false;
  @override
  void initState() {
    _Summer = widget.currentFilters['summer']!;
    _Winter = widget.currentFilters['winter']!;
    _Famaily = widget.currentFilters['family']!;

    super.initState();
  }

  Widget BuildSwitchListTile(
    String title,
    String subtitle,
    bool currentvalue,
    ValueChanged<bool> updatevalue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentvalue,
      onChanged: updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('الفلتره ', style: TextStyle(color: Colors.white)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilter = {
                'summer': _Summer,
                'winder': _Winter,
                'family': _Famaily,
              };
              widget.savefilters();
            },
            icon: Icon(Icons.save),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: [
                BuildSwitchListTile(
                  'الرحلات الصيفيه فقط ',
                  'اظهار الرحلات في فصل الصيف فقط ',
                  _Summer,
                  (newvalue) {
                    setState(() {
                      _Summer = newvalue;
                    });
                  },
                ),
                BuildSwitchListTile(
                  'الرحلات الشتويه فقط ',
                  'اظهار الرحلات في فصل الشتاء فقط ',
                  _Winter,
                  (newvalue) {
                    setState(() {
                      _Winter = newvalue;
                    });
                  },
                ),
                BuildSwitchListTile(
                  'الرحلات للعائلات فقط ',
                  'اظهار الرحلات التي للعائلات فقط ',
                  _Famaily,
                  (newvalue) {
                    setState(() {
                      _Famaily = newvalue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
