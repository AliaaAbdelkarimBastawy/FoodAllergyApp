import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Restaurant/ShowRestaurant.dart';
import '../Admin/Restaurant/FromUserOrAdminFile.dart' as globals;
import '../Admin/AdminHomePage/globals.dart' as AdminGlobals;

import '../mainScreen/MainScreen.dart';
import '../mainScreen/MainScreen2.dart';
import 'MenuScreen.dart';



class AllergenMenuScreen extends StatelessWidget {
  Model detailsModel;

  AllergenMenuScreen({Key? key, required this.detailsModel}) : super(key: key);



  final fb = FirebaseDatabase.instance.reference().child("Restaurants");

  List<Model> list = [];
  static List<String> Names = [];
  static List<String> Images = [];


  // final List<bool> _isFavorite = List.filled(items.length, false);

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
                    child: Center(child: detailsModel.image),
                    margin: const EdgeInsets.only(left: 50.0),
                    height: 130,
                    width: 130,

                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30.0),
                    child: Text(detailsModel.title,
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
              if(globals.FromUser == 0) {
                print("globals.FromUser == 0");
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    ShowRestaurant()));
              }

              else if(globals.FromUser ==2)
              {
                print("globals.FromUser ==2");
                if(AdminGlobals.WhichMainScreen2 ==1)
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MainScreen2(Current: 1)));
                }
                else
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MainScreen(Current: 1, drawer: true,)));
                }

              }

            },
          ),
          elevation: 0,
        ),
      );
  }

  //
  Widget buildList() =>
      ListView.builder(
          itemCount: detailsModel.MenuList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.fromLTRB(15, 0, 15, 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  detailsModel.MenuList[index].dishName,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Outfit"),
                ),
                subtitle: Text(detailsModel.MenuList[index].dishDetails,
                    style: const TextStyle(fontFamily: "Outfit")),
                leading: detailsModel.MenuList[index].dishImage,
                // trailing: IconButton(
                //   onPressed: () =>
                //       setState(() => _isFavorite[index] = !_isFavorite[index]),
                //   icon: _isFavorite[index]
                //       ? const Icon(Icons.favorite)
                //       : const Icon(Icons.favorite_border),
                // ),
                iconColor: Colors.red,
              ),
            );
          });
}
