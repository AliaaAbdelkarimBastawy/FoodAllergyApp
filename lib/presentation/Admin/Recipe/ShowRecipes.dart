import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Recipe/AddNewRecipe.dart';
import 'package:graduationproject26_1/presentation/Admin/Recipe/EditRecipe.dart';
import 'globalsAdminRecipes.dart' as globals;

import '../../RecipesScreen/RecipesScreen.dart';
import '../AdminHomePage/AdminHomePage.dart';

class ShowRecipes extends StatefulWidget {
  const ShowRecipes({Key? key}) : super(key: key);

  @override
  State<ShowRecipes> createState() => _ShowRecipesState();
}

class _ShowRecipesState extends State<ShowRecipes> {

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
    for (int i = 1; i < 12; i++) {
      snapshot  = await ref.child('Recipes/Recipe$i/Name').get();
      snapshot2 = await ref.child('Recipes/Recipe$i/image').get();
      snapshot3 = await ref.child('Recipes/Recipe$i/ContainedAllergyType').get();
      snapshot4 = await ref.child('Recipes/Recipe$i/Ingredients').get();
      snapshot5 = await ref.child('Recipes/Recipe$i/Duration').get();
      snapshot6 = await ref.child('Recipes/Recipe$i/Directions').get();

      if(snapshot.value.toString() != "null")
      {
        Names.add(snapshot.value.toString());
        Images.add(snapshot2.value.toString());
        containedAllergies.add(snapshot3.value.toString());
        ingredientss.add(snapshot4.value.toString());
        durations.add(snapshot5.value.toString());
        directionss.add(snapshot6.value.toString());
      }


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

  Future<dynamic> getWhichRecipeToDelete(int index) async {
    final ref = FirebaseDatabase.instance.ref();
    var snapshotDelete;
    for (int i =0; i< items.length+globals.NoOfDeletedItems; i++)
    {

      snapshotDelete  = await ref.child('Recipes/Recipe$i/Name').get();
      if(items[index].Name == snapshotDelete.value.toString())
      {
        fb.child('Recipe$i').remove();
        setState(() {
          items.removeAt(index);
        });
        break;
      }
    }
  }

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
                      "Recipes",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ))),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  height: 530,
                  child: buildList(),
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
              AddNewRecipe()));
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildList() =>
      ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return  Container(
                height: 70,
                child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      title: Container(
                        child: Text(
                          items[index].Name,
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
                        child: items[index].image,
                      ),
                      // leading: CircleAvatar(
                      //     radius: 30,
                      //     backgroundImage: items[index].image as ImageProvider),
                      // NetworkImage(
                      // Image.network('https://logos-download.com/wp-content/uploads/2016/03/KFC_Logo_2006.png')),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [IconButton(icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                EditRecipe(EditRecipeName: items[index].Name,
                                  EditRecipeImage: Images[index],
                                  EditRecipeIngredients: items[index].ingredients,
                                  EditRecipeDirections: items[index].direction,
                                  EditRecipeDuration: items[index].duration,
                                  EditRecipeAllergiesContained: items[index].containedAllery, itemsLength: items.length,  )));
                          },),
                          IconButton(icon: Icon(Icons.delete),
                            onPressed: () {
                              globals.NoOfDeletedItems++;
                              getWhichRecipeToDelete(index);

                            },)],
                      ),
                    )),
            );
          });


  @override
  void initState() {
    super.initState();
    getCurrentUserInfo();
  }

}
