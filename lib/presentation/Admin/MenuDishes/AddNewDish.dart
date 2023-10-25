import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/MenuDishes/ShowDishes.dart';
import 'package:graduationproject26_1/presentation/Admin/DishesCounterGlobal.dart' as globalsDishesCounter;
import '../Restaurant/ShowRestaurant.dart';
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;

class AddNewDish extends StatefulWidget {
  var RestaurantName;
  var itemsLength;
  AddNewDish({Key? key, required this.RestaurantName, required this.itemsLength,}) : super(key: key);

  @override
  State<AddNewDish> createState() => _AddNewDishState();
}

class _AddNewDishState extends State<AddNewDish> {

  var DishName = TextEditingController();

  var DishImage = TextEditingController();

  var DishAllergyContained = TextEditingController();

  var DishCounter = 1;

  final DatabaseReference fb =LanguageGlobalByAdmin.isEnglish?
  FirebaseDatabase.instance.reference().child('Restaurants'):
  FirebaseDatabase.instance.reference().child('RestaurantsArabic');
  Future<dynamic> getWhichRestaurantToAddDishesTo() async {
    final ref = FirebaseDatabase.instance.ref();
    var snapshotAddDish;
    var snapshot;
    for (int i =0; i< 10; i++)
    {
      print("RestaurantNameForLoop");
      print(widget.RestaurantName);
      snapshotAddDish = await ref.child('Restaurants/Restaurant$i/Name').get();
      if(widget.RestaurantName == snapshotAddDish.value.toString())
      {
        print("RestaurantName");
        print(widget.RestaurantName);
        int dishCount;
        snapshot = await ref.child('Restaurants/Restaurant$i/DishCounter/Counter').get();
        print("DishCounter");
        print(int.parse(snapshot.value.toString()));
        globalsDishesCounter.DishCounter = int.parse(snapshot.value.toString());
        dishCount = globalsDishesCounter.DishCounter;
        Map<String, String> dishes =
        {
          'Name' : DishName.text,
          'Image' : DishImage.text,
          'ListOfcontainedAllergies' : DishAllergyContained.text
        };

        fb.child("Restaurant$i/Menu/dish$dishCount").set(dishes);
        print("ADD");
        print(dishCount);
        dishCount++;
        Map<String, String> count =
        {
          'Counter' : dishCount.toString(),
        };

        fb.child("Restaurant$i/DishCounter").set(count);
        globalsDishesCounter.DishCounter ++;


        for(int j =0; j< globalsDishesCounter.RestaurantsList.length; j++)
        {
          if (widget.RestaurantName == globalsDishesCounter.RestaurantsList[j])
          {
            globalsDishesCounter.DishesCounterList[j]++;
          }
        }

      }
    }

  }
  Future<dynamic> getWhichRestaurantToAddDishesToArabic() async {
    final ref = FirebaseDatabase.instance.ref();
    var snapshotAddDish;
    var snapshot;
    for (int i =0; i< 10; i++)
    {
      print("RestaurantNameForLoop");
      print(widget.RestaurantName);
      snapshotAddDish = await ref.child('RestaurantsArabic/Restaurant$i/Name').get();
      if(widget.RestaurantName == snapshotAddDish.value.toString())
      {
        print("RestaurantName");
        print(widget.RestaurantName);
        int dishCount;
        snapshot = await ref.child('RestaurantsArabic/Restaurant$i/DishCounter/Counter').get();
        print("DishCounter");
        print(int.parse(snapshot.value.toString()));
        globalsDishesCounter.DishCounter = int.parse(snapshot.value.toString());
        dishCount = globalsDishesCounter.DishCounter;
        Map<String, String> dishes =
        {
          'Name' : DishName.text,
          'Image' : DishImage.text,
          'ListOfcontainedAllergies' : DishAllergyContained.text
        };

        fb.child("Restaurant$i/Menu/dish$dishCount").set(dishes);
        print("ADD");
        print(dishCount);
        dishCount++;
        Map<String, String> count =
        {
          'Counter' : dishCount.toString(),
        };

        fb.child("Restaurant$i/DishCounter").set(count);
        globalsDishesCounter.DishCounter ++;


        for(int j =0; j< globalsDishesCounter.RestaurantsList.length; j++)
        {
          if (widget.RestaurantName == globalsDishesCounter.RestaurantsList[j])
          {
            globalsDishesCounter.DishesCounterList[j]++;
          }
        }

      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: ()
        {
          Navigator.pop(context);
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>
            // ShowDishes(detailsModel: widget.detailsModel, itemsLength: widget.itemsLength, ImagesOfDishes: widget.ImagesOfDishes,)));
        },),
        title: Text("Add New Dish"),
        backgroundColor: Color(0xFF16CD54),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Text("Dish Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 10,),
            TextFormField(
              controller: DishName,
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
              controller: DishAllergyContained,
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
              controller: DishImage,
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
                  if(LanguageGlobalByAdmin.isEnglish == true)
                    {
                      getWhichRestaurantToAddDishesTo();

                    }
                  else
                    {
                      getWhichRestaurantToAddDishesToArabic();

                    }
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  ShowRestaurant()));
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
    );
  }
}
