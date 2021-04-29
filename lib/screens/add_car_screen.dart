import 'package:exam_1/data/models/car_model.dart';
import 'package:exam_1/data/repository/car_helper.dart';
import 'package:flutter/material.dart';

class AddCarScreen extends StatelessWidget {
  static const routeName = "/add-new-car";
  final _formKey = GlobalKey<FormState>();

  TextEditingController carImageUrl = TextEditingController();
  TextEditingController carId = TextEditingController();
  TextEditingController carBrand = TextEditingController();
  TextEditingController carModel = TextEditingController();
  TextEditingController carYear = TextEditingController();
  TextEditingController carDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
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
                  elevation: 8,
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
                  elevation: 8,
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
                  elevation: 8,
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
                  elevation: 8,
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
                  elevation: 8,
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
                  elevation: 8,
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
                  height: 20,
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
                            CarHelper().addCar(car);
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Add"))
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
