import 'package:flutter/material.dart';
import 'package:tour_guide_app/models/trip.dart';
import 'package:tour_guide_app/widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
final List<Trip>favoriteTrips;

  const FavoritesScreen( this.favoriteTrips);
  @override
  Widget build(BuildContext context) {
    if(favoriteTrips.isEmpty){
          return Center(child:Text("ليس  لديك اي رحله مفضله "),);}
          else{
            return ListView.builder(
        itemCount: favoriteTrips.length,
        itemBuilder: (context, index) {
          return TripItem(
            title: favoriteTrips[index].title,
            imgUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            tripType: favoriteTrips[index].tripType,
            season: favoriteTrips[index].season,
            id: favoriteTrips[index].id,
           // removeitem: _removeTrip,
          );
        },
      );
          }
  }
}