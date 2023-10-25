import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Admin/Restaurant/ShowRestaurant.dart';
import '../HomeScreen/RestaurantModel.dart';
import '../mainScreen/MainScreen.dart';
import '../mainScreen/MainScreen2.dart';
import 'RestaurantTest.dart';
import 'RestaurantTest_Admin.dart';

class AllergenMenuScreenTest_Admin extends StatefulWidget {

  RestaurantAdmin detailsModel;

  AllergenMenuScreenTest_Admin({Key? key,required this.detailsModel}) : super(key: key);



  static List<String> Names = [];
  static List<String> Images = [];

  @override
  State<AllergenMenuScreenTest_Admin> createState() => _AllergenMenuScreenTestState();
}

class _AllergenMenuScreenTestState extends State<AllergenMenuScreenTest_Admin> {
  final fb = FirebaseDatabase.instance.reference().child("Restaurants");
  @override
  Widget build(BuildContext context) {
    print("details model---");

    return
      Scaffold(
        body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    child: Center(child:Image.network(widget.detailsModel.image)),
                    margin: const EdgeInsets.only(left: 50.0),
                    height: 130,
                    width: 130,

                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30.0),
                    child: Text(widget.detailsModel.Name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 30.0),
                child: Text("Allergens Menu",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              ),
              Align(
                alignment: Alignment.center,

              ),

              SizedBox(height: 20,),
              Container(
                height: 400,
                child: buildList(),
              ),


            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor:  Color(0xFF16CD54),
          leading:  IconButton(
            icon: Icon(Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                 MainScreen2(Current: 1)));
            },
          ),
          elevation: 0,
        ),
      );
  }

  //
  Widget buildList() =>
      ListView.builder(
          itemCount: widget.detailsModel.Menu[0].dishes.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.fromLTRB(15, 0, 15, 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  widget.detailsModel.Menu[0].dishes[index].Name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Outfit"),
                ),
                subtitle: Text( widget.detailsModel.Menu[0].dishes[index].ListOfcontainedAllergies,
                    style: const TextStyle(fontFamily: "Outfit")),
                leading:  Image.network(widget.detailsModel.Menu[0].dishes[index].Image),
                iconColor: Colors.red,
              ),
            );
          });
}
