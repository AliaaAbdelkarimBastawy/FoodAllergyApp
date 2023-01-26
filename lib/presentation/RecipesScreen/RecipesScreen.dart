import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../data/CategoriesScreen/CategoriesScreenViewModel.dart';
import '../recipesDetails/recipes_Details.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class recipeModel {
  late final String Name;
  final Image image;
  String duration;
  String direction;
  String ingredients;
  String containedAllery;

  recipeModel(
      {required this.Name,
        required this.image,
        required this.duration,
        required this.direction,
        required this.containedAllery,
        required this.ingredients});
}

class _RecipesScreenState extends State<RecipesScreen> {
  final fb = FirebaseDatabase.instance.reference().child("Recipes");

  List<recipeModel> list = [];
  static List<String> Names = [];
  static List<String> Images = [];
  static List<String> durations = [];
  static List<String> directionss = [];
  static List<String> containedAllergies = [];
  static List<String> ingredientss = [];

  final List<recipeModel> items = [];

  Future<dynamic> getCurrentUserInfo() async {
    items.clear();
    final ref = FirebaseDatabase.instance.ref();

    var snapshot;
    var snapshot2;
    var snapshot3;
    var snapshot4;
    var snapshot5;
    var snapshot6;

    Names.clear();
    Images.clear();
    for (int i = 1; i < 8; i++) {
      snapshot  = await ref.child('Recipes/Recipe$i/Name').get();
      snapshot2 = await ref.child('Recipes/Recipe$i/image').get();
      snapshot3 = await ref.child('Recipes/Recipe$i/ContainedAllergyType').get();
      snapshot4 = await ref.child('Recipes/Recipe$i/Ingredients').get();
      snapshot5 = await ref.child('Recipes/Recipe$i/Duration').get();
      snapshot6 = await ref.child('Recipes/Recipe$i/Directions').get();

      Names.add(snapshot.value.toString());
      Images.add(snapshot2.value.toString());
      containedAllergies.add(snapshot3.value.toString());
      ingredientss.add(snapshot4.value.toString());
      durations.add(snapshot5.value.toString());
      directionss.add(snapshot6.value.toString());
    }
    for (int i = 0; i < Names.length; i++) {
      setState(() {
        items.add(new recipeModel(
          Name: Names[i],
          image: Image.network(
            Images[i],
            width: 100,
            height: 100,
          ), containedAllery: containedAllergies[i], direction: directionss[i]
          ,duration: durations[i] ,ingredients: ingredientss[i],));
        print("items" + items[0].Name);
      });
    }
    print(Names);
    print(Images);
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
                  hintText: 'Search recipe',
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
                      itemBuilder: (context, index) =>
                          buildStartScreensItem(items[index]),
                      itemCount: items.length,
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

  // Widget buildStartScreensItem(recipeModel model) => Padding(
  //     padding: const EdgeInsets.all(8),
  //     child: Material(
  //       child: GestureDetector(
  //         onTap: (){
  //           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RecipeDetailScreen(detailsModel: model,)));
  //         },
  //         child: Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(20),
  //             // color: Color(0xFFFBF6F0),
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.grey.withOpacity(0.5),
  //                 spreadRadius: 5,
  //                 blurRadius: 7,
  //                 offset: Offset(0, 3), // changes position of shadow
  //               ),
  //             ],
  //           ),
  //
  //           // clipBehavior: Clip.antiAliasWithSaveLayer,
  //           width: 80,
  //           height: 100,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Center(child: model.image),
  //               // SizedBox(height: 8,),
  //               Center(
  //                   child: Text(
  //                     '${model.Name}',
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                     ),
  //                   )),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ));

  Widget buildStartScreensItem(recipeModel model) => Padding(
    padding: const EdgeInsets.fromLTRB(8,8,4,8),
    child: Material(
      // elevation: 10,
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RecipeDetailScreen(detailsModel: model,)));
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
                          child: Center(child: model.image),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            model.Name,
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

  @override
  void initState() {
    super.initState();
    getCurrentUserInfo();
  }

  Future<void> search(String text) async {
    items.clear();
    for (int i = 0; i < Names.length; i++) {
      setState(() {
        if (Names[i].contains(text)) {
          items.add(new recipeModel(
            Name: Names[i],
            image: Image.network(
              Images[i],
              width: 100,
              height: 100,
            ), containedAllery: containedAllergies[i], direction: directionss[i]
            ,duration: durations[i] ,ingredients: ingredientss[i],));
        }
      });
    }
  }
}