// ignore_for_file: duplicate_ignore, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tour_guide_app/models/trip.dart';
import 'package:tour_guide_app/screens/trip_details_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  //final Function removeitem;

  const TripItem({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.duration,
    required this.tripType,
    required this.season, required this.id,
    // required this.removeitem,
  });

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء';
        // ignore: dead_code
        break;
      case Season.Spring:
        return 'ربيع';
        // ignore: dead_code
        break;
      case Season.Summer:
        return 'صيف';
        // ignore: dead_code
        break;
      case Season.Autumn:
        return 'خريف';
        // ignore: dead_code
        break;
      // ignore: unreachable_switch_default
      default:
        return 'غير معروف';
    }
  }
   String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشاف';
        // ignore: dead_code
        break;
     case TripType.Recovery:
        return 'نقاه';
        // ignore: dead_code
        break;
       case TripType.Activities:
        return 'انشطه';
        // ignore: dead_code
        break;
      case TripType.Therapy:
        return 'معالجه';
        // ignore: dead_code
        break;
      // ignore: unreachable_switch_default
      default:
        return 'غير معروف';
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context).pushNamed(TripDetailsScreen.screenRoute,arguments:id).then((result){
                  if(result!=null){
                   // removeitem(result);
                  }
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),

                  child: Image.network(
                    imgUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        // ignore: deprecated_member_use
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding:EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon( Icons.today, color:Colors.amber,),
                      SizedBox(width:6,),
                      Text('$duration أيام')
                    ],
                  ),
                   Row(
                    children: [
                      Icon( Icons.sunny, color:Colors.amber,),
                      SizedBox(width:6,),
                      Text(seasonText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon( Icons.family_restroom, color:Colors.amber,),
                      SizedBox(width:6,),
                      Text(tripTypeText)
                    ],
                  )
                ],
              ))
          ],
        ),
      ),
    );
  }
}
