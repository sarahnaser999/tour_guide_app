// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:tour_guide_app/app_date.dart';

class TripDetailsScreen extends StatelessWidget {
  static const screenRoute = '/trip_datail';
  final Function manageFoverites;
 final Function isFoverite;
  const TripDetailsScreen(this.manageFoverites, this.isFoverite);

  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(titleText, style: Theme.of(context).textTheme.headlineMedium),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            '${selectTrip.title}',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectTrip.imageUrl, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            buildSectionTitle(context, 'الانشطه '),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(selectTrip.activities[index]),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
        
            buildSectionTitle(context, 'البرنامج اليومي '),
            buildListViewContainer(
              ListView.builder(
                itemCount:selectTrip.program.length,
                itemBuilder:(context, index) => Column(
                  children: [
                    ListTile(
                      leading:CircleAvatar(
                        child:Text('يوم ${index+1}'),
                      
                      ),
                      title:Text(selectTrip.program[index]),
                    ),

                    Divider(),
                  ],
                ),)),
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(onPressed:()=>manageFoverites(tripId),
      child:Icon(
        isFoverite(tripId) ?Icons.star : Icons.star_border
      ),),
    );
  }
}
