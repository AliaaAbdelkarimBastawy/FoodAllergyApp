import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Restaurant/ShowRestaurant.dart';
import 'package:graduationproject26_1/presentation/Admin/DishesCounterGlobal.dart' as globalsDishesCounter;
import 'package:graduationproject26_1/presentation/Admin/Restaurant/globalsAdminRestaurant.dart' as globals;

import '../MenuDishes/AddNewDish.dart';
import '../MenuDishes/EditDish.dart';
import 'EditDishScreen.dart';
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;


class RestaurantDetailsForAdminPanel extends StatefulWidget {

  int RestaurantLength;
  String RestaurantName;
  String RestaurantImage;
  Map<dynamic, dynamic>? detailsModel;

  RestaurantDetailsForAdminPanel({Key? key,required this.detailsModel, required this.RestaurantName, required this.RestaurantImage, required this.RestaurantLength}) : super(key: key);

  static List<String> Names = [];
  static List<String> Images = [];
  final DatabaseReference _restaurantsRef =LanguageGlobalByAdmin.isEnglish?
  FirebaseDatabase.instance.reference().child('Restaurants'):
  FirebaseDatabase.instance.reference().child('RestaurantsArabic')
  ;

  @override
  State<RestaurantDetailsForAdminPanel> createState() => _AllergenMenuScreenTestState();
}

class _AllergenMenuScreenTestState extends State<RestaurantDetailsForAdminPanel> {
  final DatabaseReference fb =LanguageGlobalByAdmin.isEnglish?
  FirebaseDatabase.instance.reference().child('Restaurants'):
  FirebaseDatabase.instance.reference().child('RestaurantsArabic')
  ;
  late List<dynamic> dishList;

  final DatabaseReference _restaurantsRef =LanguageGlobalByAdmin.isEnglish?
  FirebaseDatabase.instance.reference().child('Restaurants'):
  FirebaseDatabase.instance.reference().child('RestaurantsArabic');

  late Map<dynamic, dynamic> restaurantMap;



  @override
  Widget build(BuildContext context) {
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
                    child: Center(child:Image.network(widget.RestaurantImage)),
                    margin: const EdgeInsets.only(left: 50.0),
                    height: 130,
                    width: 130,

                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30.0),
                    child: Text(widget.RestaurantName,
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
                child: _buildDishList(widget.detailsModel),
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
                  ShowRestaurant()));
            },
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF16CD54),
          tooltip: 'Add',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                AddNewDish(RestaurantName: widget.RestaurantName,
                  itemsLength: widget.RestaurantLength,)));
          },
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.

      );
  }
  Widget _buildDishList(Map<dynamic, dynamic>? values) {
    if (values != null) {
      List<dynamic> dishList = values.values.toList();
      print("DISHLIST LENGTH?");
      print(dishList.length);
      return  ListView.builder(
          shrinkWrap: true,
          itemCount: dishList.length,
          itemBuilder: (context, index) {
            Map<dynamic, dynamic> dishMap = dishList[index] as Map<dynamic, dynamic>;
            return Card(
              elevation: 4,
              margin: EdgeInsets.fromLTRB(15, 0, 15, 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child:  ListTile(
                title: Container(
                  child: Text(
                      dishMap['Name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                // leading: items[index].image,
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 64,
                    maxHeight: 64,
                  ),
                  child: Image.network(dishMap['Image'], width: 150,
                    height: 150,),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditDishScreen(
                                restaurantName: widget.RestaurantName,
                                initialName: dishMap['Name'],
                                initialDescription: dishMap['Image'],
                              LengthOfDishes: dishList.length,
                              LengthOfRestaurants: widget.RestaurantLength,
                              initialPrice: dishMap['ListOfcontainedAllergies'],
                              restaurantImage: widget.RestaurantImage,)));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        if(LanguageGlobalByAdmin.isEnglish == true)
                          {
                            getWhichDishToDelete(index, dishList);

                          }
                        else
                          {
                            getWhichDishToDeleteArabic(index, dishList);

                          }

                      },
                    ),
                  ],
                ),
              ),


            );
          });
    } else {
      return SizedBox.shrink();
    }
  }

  Future<dynamic> getWhichDishToDelete(int index,List<dynamic> dishList) async {
    Map<dynamic, dynamic> dishMap = dishList[index] as Map<dynamic, dynamic>;
    int indexOfRes =1;
    final ref = FirebaseDatabase.instance.ref();
    var snapshotDelete1;
    for (int i =0; i< widget.RestaurantLength; i++)
    {
      snapshotDelete1 = await ref.child('Restaurants/Restaurant$i/Name').get();
      if(widget.RestaurantName == snapshotDelete1.value.toString())
      {
         globalsDishesCounter.indexOfRes = i;
        break;
      }
    }

    indexOfRes = globalsDishesCounter.indexOfRes;
    var snapshotDelete;
    for (int i =0; i< dishList.length +5; i++)
    {

      snapshotDelete  = await ref.child('Restaurants/Restaurant$indexOfRes/Menu/dish$i/Name').get();
      if(dishMap['Name']== snapshotDelete.value.toString())
      {
        fb.child('Restaurant$indexOfRes/Menu/dish$i').remove();
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              ShowRestaurant()));
          // widget.detailsModel?.values.toList()[index].remove();
          // dishList.removeAt(index);
        });
        break;
      }

    }
  }
  Future<dynamic> getWhichDishToDeleteArabic(int index,List<dynamic> dishList) async {
    Map<dynamic, dynamic> dishMap = dishList[index] as Map<dynamic, dynamic>;
    int indexOfRes =1;
    final ref = FirebaseDatabase.instance.ref();
    var snapshotDelete1;
    for (int i =0; i< widget.RestaurantLength; i++)
    {
      snapshotDelete1 = await ref.child('RestaurantsArabic/Restaurant$i/Name').get();
      if(widget.RestaurantName == snapshotDelete1.value.toString())
      {
        globalsDishesCounter.indexOfRes = i;
        break;
      }
    }

    indexOfRes = globalsDishesCounter.indexOfRes;
    var snapshotDelete;
    for (int i =0; i< dishList.length +5; i++)
    {

      snapshotDelete  = await ref.child('RestaurantsArabic/Restaurant$indexOfRes/Menu/dish$i/Name').get();
      if(dishMap['Name']== snapshotDelete.value.toString())
      {
        fb.child('Restaurant$indexOfRes/Menu/dish$i').remove();
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              ShowRestaurant()));
          // widget.detailsModel?.values.toList()[index].remove();
          // dishList.removeAt(index);
        });
        break;
      }

    }
  }


}
