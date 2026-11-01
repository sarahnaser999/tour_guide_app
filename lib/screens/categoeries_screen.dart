import 'package:flutter/material.dart';
import 'package:tour_guide_app/app_date.dart';
import 'package:tour_guide_app/widgets/category_item.dart';

class CateogeriesScreen extends StatelessWidget {
  const CateogeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding:EdgeInsets.all(10),
         gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        childAspectRatio:7/8,
        mainAxisSpacing:10,
        crossAxisSpacing:10),
        children: Cateogeries_date.map(
          (categoryDate)=>CategoryItem(categoryDate.title, categoryDate.imageUrl,categoryDate.id
)
        ).toList(),

        );
    
  }
}
