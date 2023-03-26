import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'globalsAdminRecipes.dart' as globals;

import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Recipe/ShowRecipes.dart';

import '../AdminHomePage/AdminHomePage.dart';

class EditRecipe extends StatelessWidget {

  String EditRecipeName;
  String EditRecipeImage;
  String EditRecipeIngredients;
  String EditRecipeDirections;
  String EditRecipeAllergiesContained;
  String EditRecipeDuration;
  int itemsLength;

  EditRecipe({Key? key, required this.EditRecipeName, required this.EditRecipeImage,
     required this.EditRecipeIngredients, required this.EditRecipeDirections,
     required this.EditRecipeDuration, required this.EditRecipeAllergiesContained,
  required this.itemsLength}) : super(key: key);


   var RecipeName = TextEditingController();
   var Ingredients= TextEditingController();
   var Directions = TextEditingController();
   var RecipeAllergiesContained = TextEditingController();
   var TimeInMinutes = TextEditingController();
   var RecipeImage = TextEditingController();


  final fb = FirebaseDatabase.instance.reference().child("Recipes");

  Future<dynamic> getWhichRecipeToUpdate() async {
    final ref = FirebaseDatabase.instance.ref();
    var snapshotUpdate;
    for (int i =0; i< itemsLength+globals.NoOfDeletedItems+5; i++)
    {
      print("Before If Condition");
      print(EditRecipeName);
      snapshotUpdate =await ref.child('Recipes/Recipe$i/Name').get();
      print(snapshotUpdate.value.toString());
      if(EditRecipeName== snapshotUpdate.value.toString())
      {
        print("IN EL IF CONDITION");
        Map<String, String> UpdateRecipe =
        {
          'Name' : RecipeName.text,
          'image' : RecipeImage.text,
          'Ingredients': Ingredients.text,
          'Directions': Directions.text,
          'Duration': TimeInMinutes.text,
          'ContainedAllergyType': RecipeAllergiesContained.text,
        };
        fb.child("Recipe$i").set(UpdateRecipe);
        EditRecipeName = RecipeName.text;
        EditRecipeImage = RecipeImage.text;
        EditRecipeDuration = TimeInMinutes.text;
        EditRecipeDirections = Directions.text;
        EditRecipeIngredients = Ingredients.text;
        EditRecipeAllergiesContained = RecipeAllergiesContained.text;

        print("UPDATE Recipe");
      }
      else
      {
        print("Else Part");

      }


    }

  }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       resizeToAvoidBottomInset: false,
       appBar: AppBar(
         leading: IconButton(
           icon: Icon(
             Icons.arrow_back_rounded,
             color: Colors.white,
           ), onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowRecipes()));

         },
         ),         title: Text("Edit Recipe"),
         backgroundColor: Color(0xFF16CD54),

       ),
       body: Padding(
         padding: const EdgeInsets.all(20.0),
         child: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(height: 15,),
               Text("Recipe Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
               SizedBox(height: 10,),
               TextFormField(
                 controller: RecipeName ..text = EditRecipeName,
                 decoration: InputDecoration(
                   contentPadding:
                   EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                   border: OutlineInputBorder(),
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         width: 0.5,
                         color: Colors.black),),),
                 keyboardType: TextInputType.text,
                 // maxLines: 5,
                 // minLines: 3,
               ),
               SizedBox(height: 15,),
               Text("Ingredients", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
               SizedBox(height: 10,),
               TextFormField(
                 controller: Ingredients ..text=
                  EditRecipeIngredients,
                 decoration: InputDecoration(
                   contentPadding:
                   EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                   border: OutlineInputBorder(),
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         width: 0.5,
                         color: Colors.black),),),
                 keyboardType: TextInputType.multiline,
                 maxLines: null,
                 // maxLines: 5,
                 // minLines: 3,
               ),
               SizedBox(height: 15,),
               Text("Directions", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
               SizedBox(height: 10,),
               TextFormField(
                 controller:Directions ..text= EditRecipeDirections,
                 decoration: InputDecoration(
                   contentPadding:
                   EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                   border: OutlineInputBorder(),
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         width: 0.5,
                         color: Colors.black),),),
                 keyboardType: TextInputType.multiline,
               maxLines: null,),
               SizedBox(height: 15,),
               Text("Allergy Contained", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
               SizedBox(height: 10,),
               TextFormField(
                 controller:RecipeAllergiesContained ..text =EditRecipeAllergiesContained,
                 decoration: InputDecoration(
                   contentPadding:
                   EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                   border: OutlineInputBorder(),
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         width: 0.5,
                         color: Colors.black),),),
                 keyboardType: TextInputType.text,),
               SizedBox(height: 15,),
               Text("Duration", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
               SizedBox(height: 10,),
               TextFormField(
                 controller:TimeInMinutes ..text=EditRecipeDuration,
                 decoration: InputDecoration(
                   contentPadding:
                   EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                   border: OutlineInputBorder(),
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         width: 0.5,
                         color: Colors.black),),),
                 keyboardType: TextInputType.text,),
               SizedBox(height: 15,),
               Text("Recipe Image", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
               SizedBox(height: 10,),
               TextFormField(
                 controller: RecipeImage ..text =EditRecipeImage,
                 decoration: InputDecoration(
                   contentPadding:
                   EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                   border: OutlineInputBorder(),
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         width: 0.5,
                         color: Colors.black),),),
                 keyboardType: TextInputType.multiline,
                 maxLines: null,
               ),
               SizedBox(height: 30,),
               Container(
                 height: 44,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(100),),
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                 child: MaterialButton(
                   onPressed: () {
                     getWhichRecipeToUpdate();

                   },
                   child: Text("Update",
                     style: TextStyle(
                       fontSize: 18,
                       color: Colors.white,),),
                   color: Color(0xFF16CD54),),),
               SizedBox(height: 30,),
             ],
           ),
         ),
       ),
     );
   }
}
