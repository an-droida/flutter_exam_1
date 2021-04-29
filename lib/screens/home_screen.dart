import 'package:exam_1/data/models/car_model.dart';
import 'package:exam_1/data/models/dummy_data.dart';
import 'package:exam_1/data/repository/car_helper.dart';
import 'package:exam_1/screens/details_car_screen.dart';
import 'package:exam_1/screens/edit_car_screen.dart';
import 'package:exam_1/widgets/main_list_item.dart';
import 'package:flutter/material.dart';

import 'add_car_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<Car> carList = DUMMY_DATA;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car App"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, AddCarScreen.routeName)
                      .then((_) {
                    setState(() {});
                  }))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var car = carList[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
                    context, DetailsCarScreen.routeName,
                    arguments: car)
                .then((_) {
              setState(() {});
            }),
            onLongPress: () {
              Navigator.pushNamed(context, EditCarScreen.routeName,
                  arguments: {"car": car, "index": index}).then((_) {
                setState(() {});
              });
            },
            child: MainListItem(
              id: car.id.toString(),
              brand: car.brand,
              model: car.model,
              imageUrl: car.imageUrl,
              year: car.year.toString(),
              description: car.description,
            ),
          );
        },
        itemCount: carList.length,
      ),
    );
  }
}
