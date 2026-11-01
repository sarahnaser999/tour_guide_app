import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tour_guide_app/app_date.dart';
import 'package:tour_guide_app/models/trip.dart';
import 'package:tour_guide_app/screens/categories_trips_screen.dart';
import 'package:tour_guide_app/screens/filters_screen.dart';
import 'package:tour_guide_app/screens/tabs_screen.dart';
import 'package:tour_guide_app/screens/trip_details_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  // ignore: unused_field
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  // ignore: unused_field, prefer_final_fields
  List<Trip> _availableTrip = Trips_data;
  List<Trip> _afvoriteTrips = [];
  void _changFilter(Map<String, bool> filterDate) {
    setState(() {
      _filters = filterDate;
      _availableTrip = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  // ignore: unused_element
  void _manageFavorite(String tripId) {
    // ignore: unused_local_variable
    final Extisingindex = _afvoriteTrips.indexWhere(
      (trip) => trip.id == tripId,
    );
    if (Extisingindex >= 0) {
      setState(() {
        _afvoriteTrips.removeAt(Extisingindex);
      });
    } else {
      setState(() {
        _afvoriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }
  bool _isFoverite(String  id){
        return _afvoriteTrips.any((trip)=>trip.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'travel_app',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', 'AE'), // English, no country code
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
          headlineMedium: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_afvoriteTrips),
        CategoriesTripsScreen.screenRoute: (context) =>
            CategoriesTripsScreen(_availableTrip),
        TripDetailsScreen.screenRoute: (context) => TripDetailsScreen(_manageFavorite,_isFoverite),
        FiltersScreen.screenRoutes: (context) =>
            FiltersScreen(_changFilter, _filters),
      },
    );
  }
}
