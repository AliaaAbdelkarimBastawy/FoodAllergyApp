import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject26_1/presentation/Admin/Recipe/AddNewRecipe.dart';
import 'package:graduationproject26_1/presentation/Admin/Recipe/EditRecipe.dart';
import 'package:graduationproject26_1/presentation/recipesDetails/recipes_Details.dart';
import 'RecipeDetailsForAdminPanel.dart';
import 'globalsAdminRecipes.dart' as globals;
import 'FromUserOrAdminPage.dart' as globalsFromUser;

import '../../RecipesScreen/RecipesScreen.dart';
import '../AdminHomePage/AdminHomePage.dart';
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;
class ShowRecipes extends StatefulWidget {
  const ShowRecipes({Key? key}) : super(key: key);

  @override
  State<ShowRecipes> createState() => _ShowRecipesState();
}


class _ShowRecipesState extends State<ShowRecipes> {


  final DatabaseReference _recipesRef = LanguageGlobalByAdmin.isEnglish?
  FirebaseDatabase.instance.reference().child('Recipes') :  FirebaseDatabase.instance.reference().child('RecipesArabic');

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
                      "Recipes".tr,
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
                child: StreamBuilder(
                  stream: _recipesRef.onValue,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData && snapshot.data?.snapshot.value != null) {
                      Map<dynamic, dynamic> values =
                      snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                      List<dynamic> recipeList = values.values.toList();
                      return ListView.builder(
                        itemCount: recipeList.length,
                        itemBuilder: (BuildContext context, int index) {
                          MapEntry<dynamic, dynamic> recipeEntry =
                          values.entries.elementAt(index);
                          Map<dynamic, dynamic> recipeMap =
                          recipeEntry.value as Map<dynamic, dynamic>;
                          // Map<dynamic, dynamic> recipeMap =
                          // recipeList[index] as Map<dynamic, dynamic>;
                          if(recipeMap['Name'].toString() == "null")
                          {
                            print("namenull?");
                            print(recipeMap['Name'] );
                            return Text("");
                          }
                          else
                          {
                            print("name?");
                            print(recipeMap['Name'] );
                            return
                              Container(
                                height: 70,
                                child: GestureDetector(
                                  onTap: ()
                                  {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                        RecipeDetailsForAdminPanel(RecipeName:recipeMap['Name'] ,
                                          RecipeAllergiesContained: recipeMap['ContainedAllergyType'],
                                          RecipeImage: recipeMap['image'],
                                          RecipeDirections: recipeMap['Directions'],
                                          RecipeDuration: recipeMap['Duration'], RecipeIngredients: recipeMap['Ingredients'],
                                            )));
                                  },
                                  child: Card(
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child: ListTile(
                                        title: Container(
                                          child: Text(
                                            recipeMap['Name'],
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
                                            recipeMap['image'],
                                            width: 100,
                                            height: 100,
                                          ),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [IconButton(icon: Icon(Icons.edit),
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                                  EditRecipe(
                                                    itemsLength: recipeList.length,
                                                    EditRecipeName: recipeMap['Name'],
                                                    EditRecipeImage: recipeMap['image'],
                                                    EditRecipeIngredients: recipeMap['Ingredients'],
                                                    EditRecipeDirections: recipeMap['Directions'],
                                                    EditRecipeDuration: recipeMap['Duration'],
                                                    EditRecipeAllergiesContained: recipeMap['ContainedAllergyType'],
                                                  )));
                                            },),
                                            IconButton(icon: Icon(Icons.delete),
                                              onPressed: () {
                                                _recipesRef.child(recipeEntry.key!).remove();
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
              AddNewRecipe()));
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    globalsFromUser.FromUser=0;
    super.initState();
  }
}
