import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'globalsAdminRecipes.dart' as globals;

import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Recipe/ShowRecipes.dart';
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;

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


  final fb = LanguageGlobalByAdmin.isEnglish ? FirebaseDatabase.instance.reference().child("Recipes"):FirebaseDatabase.instance.reference().child("RecipesArabic") ;
  Future<dynamic> getWhichRecipeToUpdate() async {
    final ref = FirebaseDatabase.instance.ref();
    var snapshotUpdate;
    for (int i =0; i< (4*itemsLength); i++)
    {
      snapshotUpdate =await ref.child('Recipes/Recipe$i/Name').get();
      print(snapshotUpdate.value.toString());
      if(EditRecipeName== snapshotUpdate.value.toString())
      {
        print("IN EL IF CONDITION");
        Map<String, String> UpdateKnowledge =
        {
          'Name' : RecipeName.text,
          'image' : RecipeImage.text,
          'ContainedAllergyType': RecipeAllergiesContained.text,
          'Directions': Directions.text.replaceAll('.', '\\n'),
          'Duration':TimeInMinutes.text,
          'Ingredients':Ingredients.text.replaceAll('.', '\\n'),

        };
        fb.child("Recipe$i").set(UpdateKnowledge);
        EditRecipeName = RecipeName.text;
        EditRecipeImage = RecipeImage.text;
        EditRecipeAllergiesContained = RecipeAllergiesContained.text;
        EditRecipeIngredients = Ingredients.text;
        EditRecipeDirections = Directions.text;
        EditRecipeDuration = TimeInMinutes.text;
      }
      else
      {
        print("Else Part");

      }


    }

  }
  Future<dynamic> getWhichRecipeToUpdateArabic() async {
    final ref = FirebaseDatabase.instance.ref();
    var snapshotUpdate;
    for (int i =0; i< (4*itemsLength); i++)
    {
      snapshotUpdate =await ref.child('RecipesArabic/Recipe$i/Name').get();
      print(snapshotUpdate.value.toString());
      if(EditRecipeName== snapshotUpdate.value.toString())
      {
        print("IN EL IF CONDITION");
        Map<String, String> UpdateKnowledge =
        {
          'Name' : RecipeName.text,
          'image' : RecipeImage.text,
          'ContainedAllergyType': RecipeAllergiesContained.text,
          'Directions': Directions.text.replaceAll('.', '\\n'),
          'Duration':TimeInMinutes.text,
          'Ingredients':Ingredients.text.replaceAll('.', '\\n'),

        };
        fb.child("Recipe$i").set(UpdateKnowledge);
        EditRecipeName = RecipeName.text;
        EditRecipeImage = RecipeImage.text;
        EditRecipeAllergiesContained = RecipeAllergiesContained.text;
        EditRecipeIngredients = Ingredients.text;
        EditRecipeDirections = Directions.text;
        EditRecipeDuration = TimeInMinutes.text;
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
        ),
        title: const Text("Edit Recipe"),
        backgroundColor: const Color(0xFF16CD54),

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
                    EditRecipeIngredients.replaceAll('\\n', '.'),
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
                controller:Directions ..text= EditRecipeDirections.replaceAll('\\n', '.'),
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
                    if(LanguageGlobalByAdmin.isEnglish == true)
                      {
                        getWhichRecipeToUpdate();

                      }
                    else
                      {
                        getWhichRecipeToUpdateArabic();

                      }
                    Navigator.pop(context);

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
