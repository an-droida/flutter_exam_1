import 'package:exam_1/data/models/car_model.dart';
import 'package:exam_1/data/repository/car_helper.dart';
import 'package:exam_1/widgets/main_list_item.dart';
import 'package:flutter/material.dart';

class DetailsCarScreen extends StatefulWidget {
  static const routeName = "/details-car";

  @override
  _DetailsCarScreenState createState() => _DetailsCarScreenState();
}

class _DetailsCarScreenState extends State<DetailsCarScreen> {
  @override
  Widget build(BuildContext context) {
    final Car car = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("Are you sure?"),
                    content: Text("Do you really want to delete this car?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("NO"),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              CarHelper().removeCar(car.id);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            });
                          },
                          child: Text("YES"))
                    ],
                  ),
                );
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 350,
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                child: FadeInImage(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: AssetImage("assets/images/car_placeholder.png"),
                  image: NetworkImage(car.imageUrl),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Brand:",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(car.brand, style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Model:", style: TextStyle(fontSize: 18)),
                  Text(car.model, style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Year:", style: TextStyle(fontSize: 18)),
                  Text(car.year.toString(), style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(car.description, style: TextStyle(fontSize: 17))),
            ],
          ),
        ),
      ),
    );
  }
}
