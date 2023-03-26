import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globalsAdminRecipes.dart' as globals;
import 'package:graduationproject26_1/presentation/Admin/DishesCounterGlobal.dart' as globalsDishesCounter;
import 'package:graduationproject26_1/presentation/Admin/Recipe/ShowRecipes.dart';

class AddNewRecipe extends StatelessWidget {
   AddNewRecipe({Key? key}) : super(key: key);
   var RecipeName = TextEditingController();
   var Ingredients= TextEditingController();
   var Directions = TextEditingController();
   var RecipeAllergiesContained = TextEditingController();
   var TimeInMinutes = TextEditingController();
   var RecipeImage = TextEditingController();

   final fb = FirebaseDatabase.instance.reference().child("Recipes");

   Future<dynamic> AddRecipe() async {
     final ref = FirebaseDatabase.instance.ref();
     var snapshot;
     int RecipeCount;
     snapshot = await ref.child('Recipes/RecipeCounter/Counter').get();
     globalsDishesCounter.RecipeCounter= int.parse(snapshot.value.toString());
     RecipeCount =  globalsDishesCounter.RecipeCounter;

     Map<String, String> recipes =
     {
       'Name' : RecipeName.text,
       'image' : RecipeImage.text,
       'Ingredients': Ingredients.text,
       'Directions': Directions.text,
       'Duration': TimeInMinutes.text,
       'ContainedAllergyType': RecipeAllergiesContained.text,
     };

     fb.child("Recipe$RecipeCount").set(recipes);

     RecipeCount++;

     print(RecipeCount);
     Map<String, String> count =
     {
       'Counter' : RecipeCount.toString(),
     };

     fb.child("RecipeCounter").set(count);
     globalsDishesCounter.RecipeCounter++;
   }





   Future<dynamic> getRecipeID() async {
     final ref = FirebaseDatabase.instance.ref();
       var snapshot;
       snapshot  = await ref.child('Recipes/RecipeID/ID').get();
       print("Valueee");
       print(snapshot.value.toString());
       globals.RecipeID = int.parse(snapshot.value.toString());
       print(globals.RecipeID);
       print(int.parse(snapshot.value.toString()));
     }


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       resizeToAvoidBottomInset: false,
       appBar: AppBar(
         leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: ()

         {Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowRecipes()));
     },),
         title: Text("Add New Recipe"),
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
                 controller: RecipeName,
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
                 controller: Ingredients,
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
                 controller:Directions,
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
                 controller:RecipeAllergiesContained,
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
               Text("Duration", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
               SizedBox(height: 10,),
               TextFormField(
                 controller:TimeInMinutes,
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

                 controller: RecipeImage,
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
               SizedBox(height: 30,),
               Container(
                 height: 44,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(100),),
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                 child: MaterialButton(
                   onPressed: () {
                     AddRecipe();
                     // });
                   },
                   child: Text("Add",
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
