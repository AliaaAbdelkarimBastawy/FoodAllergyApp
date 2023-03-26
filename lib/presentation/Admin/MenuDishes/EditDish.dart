import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/MenuDishes/ShowDishes.dart';

import '../Restaurant/ShowRestaurant.dart';



class EditDish extends StatelessWidget {
  String EditDishName;
  String EditDishImage;
  String EditDishAllergyContained;
  String EditRestaurantName;
  int itemsLength;
  int MenuListLength;
  AdminRestaurantModel detailsModel;
  List<String> ImagesOfDishes = [];

  EditDish({Key? key, required this.EditRestaurantName, required this.EditDishName,required this.MenuListLength
    ,required this.itemsLength,
    required this.EditDishImage, required this.EditDishAllergyContained, required this.detailsModel, required this.ImagesOfDishes}) : super(key: key);
  var RestaurantName = TextEditingController();
  var DishName = TextEditingController();
  var DishImage = TextEditingController();
  var DishAllergyContained = TextEditingController();

  final fb = FirebaseDatabase.instance.reference().child("Restaurants");

  Future<dynamic> getWhichDishToUpdate() async {
    final ref = FirebaseDatabase.instance.ref();
    var snapshotUpdate;
    int dishCount;
    var SnapshotGetCounter;
    var snapshotDishUpdate;

    for (int i =0; i< itemsLength; i++)
    {
      print("Gowa awel For loop");
      print("Before If Condition");
      snapshotUpdate = await ref.child('Restaurants/Restaurant$i/Name').get();
      if(EditRestaurantName== snapshotUpdate.value.toString())
      {
        print("WESLT LEL RESTAURANT");
        SnapshotGetCounter = await ref.child('Restaurants/Restaurant$i/DishCounter/Counter').get();
        dishCount = int.parse(SnapshotGetCounter.value.toString());
        print("DISH COUNT =");
        print(dishCount);
        for(int j =0; j<dishCount+1; j++ )
          {
            print("Gowa Tany For loop");
            snapshotDishUpdate = await ref.child('Restaurants/Restaurant$i/Menu/dish$j/Name').get();
            if(EditDishName == snapshotDishUpdate.value.toString())
              {
                for(int z=0; z< detailsModel.MenuList.length; z++)
                  {
                    if(detailsModel.MenuList[z].dishName == EditDishName)
                      {
                        detailsModel.MenuList[z].dishName = DishName.text;
                        detailsModel.MenuList[z].dishImage = Image.network(DishImage.text);
                        detailsModel.MenuList[z].dishDetails = DishAllergyContained.text;

                      }

                  }
                print("WESLT LEL Dish");
                print("Dish Rakam = ");
                print(j);

                Map<String, String> UpdateDish =
                {
                  'Name' : DishName.text,
                  'Image' : DishImage.text,
                  'ListOfcontainedAllergies' : DishAllergyContained.text
                };
                fb.child("Restaurant$i/Menu/dish$j").set(UpdateDish);
                EditDishName = DishName.text;
                EditDishImage =  DishImage.text;
                EditDishAllergyContained = DishAllergyContained.text;
                print("Firebase is updated");
                break;
              }

          }

        break;
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
        elevation: 0,
        title: Text("Edit Dish"),
        backgroundColor: Color(0xFF16CD54),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowDishes(
              detailsModel: detailsModel, itemsLength: itemsLength, ImagesOfDishes: ImagesOfDishes)));
        },
        ),      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Text("Dish Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 10,),
            TextFormField(
              controller: DishName ..text = EditDishName,
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
            Text("Allergy Contained", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 10,),
            TextFormField(
              controller: DishAllergyContained ..text = EditDishAllergyContained,
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
            Text("Dish Image", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 10,),
            TextFormField(
              controller: DishImage ..text =EditDishImage,
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
                   getWhichDishToUpdate();
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
    );
  }



}
