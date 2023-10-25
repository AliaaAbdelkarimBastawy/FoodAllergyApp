import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../recipesDetails/recipes_Details.dart';
import 'Recipe/EditRecipe.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final DatabaseReference _recipesRef =
  FirebaseDatabase.instance.reference().child('Recipes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe List'),
      ),
      body: StreamBuilder(
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
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            //     RecipeDetailScreen(detailsModel: items[index])));
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
    );
  }
}