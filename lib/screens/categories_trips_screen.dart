import 'package:flutter/material.dart';
import 'package:tour_guide_app/models/trip.dart';
import 'package:tour_guide_app/widgets/trip_item.dart';

class CategoriesTripsScreen extends StatefulWidget {
  static const screenRoute = '/trips-category';
  final List<Trip> availableTrips;

  const CategoriesTripsScreen(this.availableTrips);

  @override
  State<CategoriesTripsScreen> createState() => _CategoriesTripsScreenState();
}

class _CategoriesTripsScreenState extends State<CategoriesTripsScreen> {
  late String categorytitle;
  late List<Trip> displaytrips;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    // ignore: unused_local_variable
    final categoryId = routeArgument['id'];
    categorytitle = routeArgument['title']!;
    displaytrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  // ignore: unused_element
  void _removeTrip(String tripId) {
    setState(() {
      displaytrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(categorytitle, style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: displaytrips.length,
        itemBuilder: (context, index) {
          return TripItem(
            title: displaytrips[index].title,
            imgUrl: displaytrips[index].imageUrl,
            duration: displaytrips[index].duration,
            tripType: displaytrips[index].tripType,
            season: displaytrips[index].season,
            id: displaytrips[index].id,
           // removeitem: _removeTrip,
          );
        },
      ),
    );
  }
}
