import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/test/AllergenMenuTest.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/recipesDetails/recipes_Details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/test/recipeDetailsTest.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'AllergenMenuTest_Admin.dart';

class MyRestaurants_Admin extends StatefulWidget {
  const MyRestaurants_Admin({Key? key}) : super(key: key);

  @override
  State<MyRestaurants_Admin> createState() => _MyRestaurantsState();
}

class RestaurantAdmin {
  String id;
  String Name;
  String image;
  List<MenusOfRestaurants> Menu;


  RestaurantAdmin({required this.id, required this.Name,
    required this.image,required this.Menu,});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Name': Name,
      'image': image,
    };
  }
}
class MenusOfRestaurants {
  List<Dishes> dishes;
  String image;
  String Name;

  MenusOfRestaurants({ required this.Name,
    required this.image, required this.dishes,});

  Map<String, dynamic> toMap(String restaurantId) {
    return {

      'Name': Name,
      'image': image,
      'restaurant_id': restaurantId,

    };
  }
}
class Dishes {
  String id;
  String Name;
  String Image;
  String ListOfcontainedAllergies;

  Dishes({required this.id, required this.Name,
    required this.Image,required this.ListOfcontainedAllergies});


  Map<String, dynamic> toMap(String menuId) {
    return {
      'id': id,
      'Name': Name,
      'Image': Image,
      'ListOfcontainedAllergies':ListOfcontainedAllergies,
      'menu_id': menuId,
    };
  }

}
List<RestaurantAdmin> items = [];

class _MyRestaurantsState extends State<MyRestaurants_Admin> {
  List<RestaurantAdmin> _restaurants = [];
  List<RestaurantAdmin> _restaurants2 = [];

  Future<void> _initData() async {

    _restaurants = await getRestaurants();
    _restaurants2 = await getRestaurants();

  }
  Future<List<RestaurantAdmin>> getRestaurants() async {
    List<RestaurantAdmin> restaurants =[];
    print("star261");
    DatabaseReference ref = FirebaseDatabase.instance.ref("Restaurants");
    DatabaseEvent event = await ref.once();
    final restaurantData =event.snapshot.value as Map<dynamic, dynamic>;
    restaurantData.forEach((key, value) {
      List<MenusOfRestaurants> menus = [];
      List<Dishes> dishes = [];
      if (value['Menu'] != null) {
        value['Menu'].forEach((dishKey, dishValue) {
          print("forloop");
          print(dishValue['Name']);
          dishes.add(Dishes(
            id: dishKey,
            Name: dishValue['Name'] ?? '',
            Image: dishValue['Image'] ?? '',
            ListOfcontainedAllergies: dishValue['ListOfcontainedAllergies'] ?? '',
          ));
        });

        print("forloop_bara_line198");

        menus.add(MenusOfRestaurants(
          dishes: dishes, Name: value['Name'] ?? '', image:  value['image'] ?? '',
        ));

        print("forloop_bara_line207");

        if(value['Name'] != null)
        {
          setState(() {
            restaurants.add(RestaurantAdmin(
              id: key,
              Menu: menus, Name: value['Name'] ?? '', image: value['image'] ?? '',
            ));

          });
        }

        print("forloop_bara_line222");



      }

    });

    return restaurants;
  }


  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.all(15),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.green),
                  hintText: 'Search Restaurant',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(color: Colors.green)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(color: Colors.green)),
                ),
                onChanged: (text) {
                  search(text);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 2, 8,0),
              child: SizedBox(
                height: 455,
                child: Expanded(
                  child: Container(
                    child: GridView.builder(
                      itemBuilder: (context, index) {
                        final restaurant = _restaurants[index];
                        items.add(restaurant);
                        return  Padding(
                          padding: const EdgeInsets.fromLTRB(8,8,4,8),
                          child: Material(
                            // elevation: 10,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (context)=>
                                        AllergenMenuScreenTest_Admin(detailsModel: items[index],)));
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.only(top: 5.0),
                                      height: 160.0,
                                      width: 200.0,
                                      child: Card(
                                          elevation: 13,
                                          margin:EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
                                                child: Center(
                                                  child: Image.network(
                                                    items[index].image,
                                                    width: 100,
                                                    height: 100,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(
                                                  items[index].Name,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w300,
                                                      fontFamily: "Outfit"),
                                                ),
                                              ),
                                            ],
                                          ))
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: _restaurants.length,
                      scrollDirection: Axis.vertical,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          childAspectRatio: 1 / 1),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> search(String text) async {
    _restaurants.clear();
    items.clear();
    for (int i = 0; i < _restaurants2.length; i++) {
      setState(() {
        if (_restaurants2[i].Name.contains(text)) {
          _restaurants.add(_restaurants2[i]);
        }
      });
    }
  }
}

