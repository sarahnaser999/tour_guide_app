// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tour_guide_app/screens/categories_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  const CategoryItem(this.title,  this.imageUrl,this.id, {super.key});
  void selectCategory(BuildContext ctx) {
    Navigator.of(
      ctx,
    ).pushNamed(
      CategoriesTripsScreen.screenRoute,
      arguments:{
        'id':id,
        'title':title
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),

            child: Image.network(imageUrl, height: 270, fit: BoxFit.cover),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            // ignore: sort_child_properties_last
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
