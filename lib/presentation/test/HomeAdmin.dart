import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduationproject26_1/presentation/test/CategoriesAdmin_Home.dart';
import 'package:graduationproject26_1/presentation/test/ProductDetailsTest_Home.dart';
import 'package:graduationproject26_1/presentation/test/RecipesAdmin_Home.dart';
import 'package:graduationproject26_1/presentation/test/recipeDetailsTest_Home.dart';
import 'package:graduationproject26_1/presentation/test/test.dart';
import 'package:graduationproject26_1/presentation/test/test.dart';
import 'package:sqflite/sqflite.dart';
import 'AllergenMenuTest_Home.dart';
import 'CategoriesTest.dart';
import 'RestaurantAdmin_Home.dart';
import 'RestaurantTest.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/recipesDetails/recipes_Details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/test/recipeDetailsTest.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'test.dart';

class MyHome_Admin extends StatefulWidget {
  const MyHome_Admin({Key? key}) : super(key: key);

  @override
  State<MyHome_Admin> createState() => _MyHome_AdminState();
}


List<Recipe> itemsOfRecipes = [];
List<Restaurant> itemsOfRestaurants = [];
List<Categoryy> itemsOfCategory = [];
DatabaseReference ref_recipe = FirebaseDatabase.instance.ref("Recipes");


class _MyHome_AdminState extends State<MyHome_Admin> {
  List<Recipe> _recipes = [];
  Future<void> _syncData() async {
    DatabaseEvent event = await ref_recipe.once();
    print(event.snapshot.value);
    if (event.snapshot.value != null) {
      final data =event.snapshot.value as Map<dynamic, dynamic>;
      await _saveDataLocally(data);
      await _loadDataLocally();
    }
  }
  Future<void> _saveDataLocally(Map<dynamic, dynamic> data) async {
    final _dbPath = await getDatabasesPath();
    final _db = await openDatabase(join(_dbPath, 'database7.db'), version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE Recipes (id TEXT PRIMARY KEY,Name TEXT, ContainedAllergyType TEXT,Directions TEXT, Duration TEXT,Ingredients TEXT,image TEXT)');
        });

    data.forEach((key, value) async {
      final user = Recipe(
        id: key,
        Name: value['Name'],
        ContainedAllergyType: value['ContainedAllergyType'],
        Directions: value['Directions'],
        Ingredients: value['Ingredients'],
        image: value['image'],
        Duration: value['Duration'],
      );

      await _db.insert('Recipes', user.toMap());
    });
  }
  Future<void> _loadDataLocally() async {
    print("inFunction _loadDataLocally");

    final _dbPath = await getDatabasesPath();
    final _db = await openDatabase(join(_dbPath, 'database7.db'), version: 2);

    final List<Map<String, dynamic>> data = await _db.query('Recipes');

    setState(() {
      _recipes = data.map((user) => Recipe.fromMap(user)).toList();
    });
  }
  List<Restaurant> _restaurants = [];
  Future<void> _initData() async {
    _restaurants = await getRestaurants();
  }
  Future<List<Restaurant>> getRestaurants() async {
    List<Restaurant> restaurants =[];
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
            restaurants.add(Restaurant(
              id: key,
              Menu: menus, Name: value['Name'] ?? '', image: value['image'] ?? '',
            ));

          });
        }

        print("forloop_bara_line222");



      }

    });

    for(int i=0; i<3;i++)
    {
      print("Aliaa");


    }
    return restaurants;
  }
  List<Categoryy> _category = [];
  Future<List<Categoryy>> getCategories() async {
    List<Categoryy> categories =[];
    List<Menus> menus = [];
    List<Item> items = [];
    DatabaseReference ref = FirebaseDatabase.instance.ref("Category");
    DatabaseEvent event = await ref.once();
    final categoryData =event.snapshot.value as Map<dynamic, dynamic>;
    categoryData.forEach((key, value) {


      value['Items'].forEach((itemKey, itemValue) {
        print("forloop");
        print(itemValue['Name']);
        if (itemValue['Name'] != null) {
          items.add(Item(
            id: itemKey,
            Name: itemValue['Name'] ?? '',
            image: itemValue['image'],
            ingredients: itemValue['ingredients'],
            contains: itemValue['contains'],
            description: itemValue['description'],
          ));
        }
      });

      print("forloop_bara_line198");
      print(items[0].Name);
      // print(items[1].Name);

      menus.add(Menus(items: items,));

      print("forloop_bara_line207");

      print(menus[0].items[0].Name);
      // print(menus[0].items[1].Name);

      if(value['Name'] != null)
      {
        setState(() {
          categories.add(Categoryy(
            id: key, Name: value['Name'] ?? '',
            Image: value['Image'] ?? '',
            menus:menus,));
        });
      }

      print("forloop_bara_line222");

    });
    print("Length");
    print(categories[0].menus[0].items[0].Name);
    print(categories[1].menus[0].items[0].Name);
    print(categories[2].menus[0].items[0].Name);
    print(categories[3].menus[0].items[0].Name);


    return categories;
  }
  Future<void> _initData_Category() async {
    _category = await getCategories();
  }

  @override
  void initState() {
    super.initState();
    _initData();
    _initData_Category();
    _syncData();
  }

  @override
  Widget build(BuildContext context) {

    if (_category.isEmpty)
    {
      return CircularProgressIndicator();
    }
    else
    {
      return  Scaffold(body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: 540,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text("Categories", style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    final category = _category[0];
                    itemsOfCategory.add(category);
                    if (_category.isEmpty)
                    {
                      return CircularProgressIndicator();
                    }
                    else
                    {
                      return  Padding(
                        padding: const EdgeInsets.fromLTRB(8,8,4,8),
                        child: Material(
                          // elevation: 10,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                      MyProductDetails_Home_Admin(detailsModel: _category[0].menus[0].items[index],)));
                                },
                                child: Container(
                                    margin: const EdgeInsets.only(top: 5.0),
                                    height: 120.0,
                                    width: 200.0,
                                    child: Card(
                                        elevation: 7,
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
                                                  _category[0].menus[0].items[index].image,
                                                  width: 80,
                                                  height: 80,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                _category[0].menus[0].items[index].Name,
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

                    }
                  },
                    itemCount: (_category[0].menus[0].items.isEmpty ? 0 : _category[0].menus[0].items.length) ,
                    scrollDirection: Axis.horizontal,),),

                SizedBox(height: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text("Menus", style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),)),
                  ],
                ),
                SizedBox(height: 4,),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    final restaurant = _restaurants[index];
                    itemsOfRestaurants.add(restaurant);
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
                                    AllergenMenuScreenTest_Home_Admin(detailsModel: itemsOfRestaurants[index],)));
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(top: 5.0),
                                  height: 120.0,
                                  width: 200.0,
                                  child: Card(
                                      elevation: 7,
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
                                                itemsOfRestaurants[index].image,
                                                width: 80,
                                                height: 80,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              itemsOfRestaurants[index].Name,
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
                    scrollDirection: Axis.horizontal,),),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text("Recipes", style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),)),
                  ],
                ),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    final recipe = _recipes[index];
                    itemsOfRecipes.add(recipe);
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
                                    RecipeDetailScreenTest_Home_Admin(detailsModel: itemsOfRecipes[index],)));
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(top: 2.0),
                                  height: 125.0,
                                  width: 200.0,
                                  child: Card(
                                      elevation: 7,
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
                                                itemsOfRecipes[index].image,
                                                width: 80,
                                                height: 80,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              itemsOfRecipes[index].Name,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 13,
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

                    itemCount: _recipes.length,
                    scrollDirection: Axis.horizontal,),),
                SizedBox(height: 3,),
              ],
            ),
          ),
        ),
      ),);
    }


  }

}
