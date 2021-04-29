import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {
  final String id;
  final String brand;
  final String model;
  final String imageUrl;
  final String year;
  final String description;

  MainListItem(
      {this.id,
      this.brand,
      this.model,
      this.imageUrl,
      this.year,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: FadeInImage(
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/images/car_placeholder.png"),
                image: NetworkImage(imageUrl),
              ),
            ),
            SizedBox(height: 10,),
            Text(brand),
            SizedBox(height: 10,),
            Text(year)
          ],
        ),
      ),
    );
  }
}
