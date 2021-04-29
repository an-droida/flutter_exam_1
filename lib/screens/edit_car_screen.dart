import 'package:exam_1/data/models/car_model.dart';
import 'package:exam_1/data/repository/car_helper.dart';
import 'package:flutter/material.dart';

class EditCarScreen extends StatefulWidget {
  static const routeName = "/edit-car-screen";

  @override
  _EditCarScreenState createState() => _EditCarScreenState();
}

class _EditCarScreenState extends State<EditCarScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController carImageUrl;
  TextEditingController carId;
  TextEditingController carBrand;
  TextEditingController carModel;
  TextEditingController carYear;
  TextEditingController carDescription ;

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context).settings.arguments;
    final Car car = parsedData["car"];
    final int index = parsedData["index"];
    carId = TextEditingController(text: car.id.toString());
    carImageUrl = TextEditingController(text: car.imageUrl.toString());
    carBrand = TextEditingController(text: car.brand.toString());
    carModel = TextEditingController(text: car.model.toString());
    carYear = TextEditingController(text: car.year.toString());
    carDescription = TextEditingController(text: car.description.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: TextFormField(
                    controller: carImageUrl,
                    decoration:
                    InputDecoration(hintText: "Please Enter Image Url",
                        contentPadding: EdgeInsets.all(10)),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid image";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: TextFormField(
                    controller: carId,
                    decoration: InputDecoration(hintText: "Please Enter ID",
                        contentPadding: EdgeInsets.all(10)),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid ID";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: TextFormField(
                    controller: carBrand,
                    decoration: InputDecoration(hintText: "Please Enter Brand",
                        contentPadding: EdgeInsets.all(10)),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid Brand";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: TextFormField(
                    controller: carModel,
                    decoration: InputDecoration(hintText: "Please Enter Model",
                        contentPadding: EdgeInsets.all(10)),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid model";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: TextFormField(
                    controller: carYear,
                    decoration: InputDecoration(hintText: "Please Enter Year",
                        contentPadding: EdgeInsets.all(10)),
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid year";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: TextFormField(
                    controller: carDescription,
                    decoration:
                    InputDecoration(hintText: "Please Enter description",
                        contentPadding: EdgeInsets.all(10)),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid description";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Back")),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Car car = Car(
                                id: int.tryParse(carId.text),
                                brand: carBrand.text,
                                model: carModel.text,
                                imageUrl: carImageUrl.text,
                                year: int.tryParse(carYear.text),
                                description: carDescription.text);
                            CarHelper().editCar(car, index);
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Edit"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
