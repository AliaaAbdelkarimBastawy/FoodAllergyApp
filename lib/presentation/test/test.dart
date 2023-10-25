import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject26_1/presentation/recipesDetails/recipes_Details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/test/recipeDetailsTest.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:graduationproject26_1/languageGlobal.dart' as LanguageGlobal;
import 'dart:ui' as ui;


class MyRecipes extends StatefulWidget {
  @override
  State<MyRecipes> createState() => _MyWidgetState();


}
class Recipe {
  String id;
  String Name;
  String ContainedAllergyType;
  String Directions;
  String Duration;
  String Ingredients;
  String image;


  Recipe({required this.id, required this.Name,
    required this.ContainedAllergyType, required this.Directions,
    required this.Ingredients, required this.image, required this.Duration});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Name': Name,
      'ContainedAllergyType': ContainedAllergyType,
      'Directions':Directions,
      'Duration':Duration,
      'Ingredients':Ingredients,
      'image': image,

    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      Name: map['Name'],
      ContainedAllergyType: map['ContainedAllergyType'],
      Directions: map['Directions'],
      Ingredients: map['Ingredients'],
      image: map['image'], Duration: map['Duration'], id: map['id'],
    );
  }
}

List<Recipe> items = [];
List<Recipe> itemsofSearch = [];
DatabaseReference ref = LanguageGlobal.isEnglish? FirebaseDatabase.instance.ref("Recipes") : FirebaseDatabase.instance.ref("RecipesArabic");

class _MyWidgetState extends State<MyRecipes> {
  List<Recipe> _recipes = [];
  List<Recipe> _recipes2 = [];

  Future<void> _syncData() async {
    print("inFunction sync");
    // Get the data once
    DatabaseEvent event = await ref.once();
    // Print the data of the snapshot
    print(event.snapshot.value); // { "name": "John" }
    // snapshot  = await ref.child('Recipes/Recipe$i/Name').get();
    if (event.snapshot.value != null) {
      final data =event.snapshot.value as Map<dynamic, dynamic>;
      await _saveDataLocally(data);
      await _loadDataLocally();
    }
  }
  Future<void> _syncDataArabic() async {
    print("inFunction sync");
    // Get the data once
    DatabaseEvent event = await ref.once();
    // Print the data of the snapshot
    print(event.snapshot.value); // { "name": "John" }
    // snapshot  = await ref.child('Recipes/Recipe$i/Name').get();
    if (event.snapshot.value != null) {
      final data =event.snapshot.value as Map<dynamic, dynamic>;
      await _saveDataLocallyArabic(data);
      await _loadDataLocallyArabic();
    }
  }
  Future<void> _saveDataLocally(Map<dynamic, dynamic> data) async {
    print("inFunction _saveDataLocally");

    final _dbPath = await getDatabasesPath();
    final _db = await openDatabase(join(_dbPath, 'database.db'), version: 2,
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

      print("insert??");
      await _db.insert('Recipes', user.toMap());
    });
  }
  Future<void> _saveDataLocallyArabic(Map<dynamic, dynamic> data) async {
    print("inFunction _saveDataLocally");

    final _dbPath = await getDatabasesPath();
    final _db = await openDatabase(join(_dbPath, 'databaseArabic.db'), version: 2,
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

      print("insert??");
      await _db.insert('Recipes', user.toMap());
    });
  }
  Future<void> _loadDataLocally() async {
    print("inFunction _loadDataLocally");

    final _dbPath = await getDatabasesPath();
    final _db = await openDatabase(join(_dbPath, 'database.db'), version: 2);

    final List<Map<String, dynamic>> data = await _db.query('Recipes');

    setState(() {
      _recipes = data.map((user) => Recipe.fromMap(user)).toList();
      _recipes2 = data.map((user) => Recipe.fromMap(user)).toList();
    });
  }
  Future<void> _loadDataLocallyArabic() async {
    print("inFunction _loadDataLocally");

    final _dbPath = await getDatabasesPath();
    final _db = await openDatabase(join(_dbPath, 'databaseArabic.db'), version: 2);

    final List<Map<String, dynamic>> data = await _db.query('Recipes');

    setState(() {
      _recipes = data.map((user) => Recipe.fromMap(user)).toList();
      _recipes2 = data.map((user) => Recipe.fromMap(user)).toList();
    });
  }

  Locale myLocale = ui.window.locale;

  List<String> ListOfNewRecipes = [];
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  @override
  void initState() {
    items.clear();
    DatabaseReference ref = LanguageGlobal.isEnglish? FirebaseDatabase.instance.ref("Recipes") : FirebaseDatabase.instance.ref("RecipesArabic");
    super.initState();
    if(LanguageGlobal.isEnglish == true)
      {
        _syncData();

      }
    else
      {
        _syncDataArabic();
      }
  }
  @override
  Widget build(BuildContext context) {
    items.clear();
    DatabaseReference ref = LanguageGlobal.isEnglish? FirebaseDatabase.instance.ref("Recipes") : FirebaseDatabase.instance.ref("RecipesArabic");
    Locale myLocale = Localizations.localeOf(context);
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
                keyboardType: TextInputType.text,
                decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.green),
                  hintText: 'Search recipe'.tr,
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
                height: 449,
                child: Expanded(
                  child: Container(
                    child: GridView.builder(
                      itemBuilder: (context, index) {
                        var recipe = _recipes[index];
                        items.add(recipe);
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
                                        RecipeDetailScreenTest(detailsModel: items[index],)));
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
                      itemCount: _recipes.length,
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
    _recipes.clear();
    items.clear();
    for (int i = 0; i < _recipes2.length; i++) {
      setState(() {
        if (_recipes2[i].Name.contains(text)) {
          print("whichrecipe ?");
          print(_recipes2[i].Name);
          _recipes.add(_recipes2[i]);
        }
      });
    }


  }

}

