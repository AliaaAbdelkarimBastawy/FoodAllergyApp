import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/MenuDishes/ShowDishes.dart';
import 'package:graduationproject26_1/presentation/Admin/Restaurant/AddNewRestaurant.dart';
import 'package:graduationproject26_1/presentation/Admin/Restaurant/EditRestaurant.dart';
import 'RestaurantDetailsForAdminPanel.dart';
import 'globalsAdminRestaurant.dart' as globals;
import '../AdminHomePage/AdminHomePage.dart';
import 'package:graduationproject26_1/presentation/Admin/DishesCounterGlobal.dart' as globalsDishesCounter;
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;

import 'FromUserOrAdminFile.dart' as globalsFromUser;

class ShowRestaurant extends StatefulWidget {
  const ShowRestaurant({Key? key}) : super(key: key);

  @override
  State<ShowRestaurant> createState() => _ShowRestaurantState();
}


class AdminRestaurantModel {
  late final String title;
   Image image;
  List<AdminMenuModel> MenuList = [];
  AdminRestaurantModel(
      {required this.title, required this.image, required this.MenuList,});
}
class AdminMenuModel {
    String dishName;
   Image dishImage;
   String dishDetails;

  AdminMenuModel(
      {required this.dishName,
        required this.dishImage,
        required this.dishDetails});
}

class _ShowRestaurantState extends State<ShowRestaurant> {
  bool value = true;

  final DatabaseReference _restaurantsRef =LanguageGlobalByAdmin.isEnglish?
  FirebaseDatabase.instance.reference().child('Restaurants'):
  FirebaseDatabase.instance.reference().child('RestaurantsArabic')
  ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF16CD54),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminHomePage()));
        },
        ),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
          Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0,10,0,5),
          child: Text(
            "Restaurant",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ))),
    Container(
    margin: EdgeInsets.only(bottom: 20),
    child: SizedBox(
    height: 510,
    child:StreamBuilder(
        stream: _restaurantsRef.onValue,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data?.snapshot.value != null) {
            Map<dynamic, dynamic> values =
            snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
            List<dynamic> restaurantList = values.values.toList();
            return ListView.builder(
              itemCount: restaurantList.length,
              itemBuilder: (BuildContext context, int index) {

                MapEntry<dynamic, dynamic> restaurantEntry =
                values.entries.elementAt(index);
                Map<dynamic, dynamic> restaurantMap =
                restaurantEntry.value as Map<dynamic, dynamic>;
                if(restaurantMap['Name'].toString() == "null")
                {
                  print("namenull?");
                  print(restaurantMap['Name'] );
                  return Text("");
                }
                else
                {
                  print("name?");
                  print(restaurantMap['Name'] );
                  return
                    Container(
                      height: 70,
                      child: GestureDetector(
                        onTap: ()
                        {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                  RestaurantDetailsForAdminPanel(detailsModel:
                                  restaurantMap['Menu'],
                                    RestaurantName: restaurantMap['Name'],
                                    RestaurantImage: restaurantMap['image'], RestaurantLength: restaurantList.length,)));
                        },
                        child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              title: Container(
                                child: Text(
                                  restaurantMap['Name'],
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
                                child: Image.network(
                                  restaurantMap['image'],
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [IconButton(icon: Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                        EditRestaurant(
                                          itemsLength: restaurantList.length,
                                          EditRestaurantName: restaurantMap['Name'],
                                          EditRestaurantImage: restaurantMap['image'],
                                        )));
                                  },),
                                  IconButton(icon: Icon(Icons.delete),
                                    onPressed: () {
                                      _restaurantsRef.child(restaurantEntry.key!).remove();
                                    },)],
                              ),
                            )),
                      ),
                    );

                }

              },
            );


          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error retrieving recipe data'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
    ),
    ),
    )
              ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF16CD54),
        tooltip: 'Add',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              AddNewRestaurant()));
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Widget buildAndroidSwitch() => Transform.scale(
    scale: 2,
    child: Switch(
      value: value,
      onChanged: (value) => setState(() => this.value = value),
    ),
  );

  @override
  void initState() {
    globalsFromUser.FromUser=0;
    super.initState();
  }


}
