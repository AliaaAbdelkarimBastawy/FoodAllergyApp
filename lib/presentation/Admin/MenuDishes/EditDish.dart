import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/MenuDishes/ShowDishes.dart';

import '../Restaurant/RestaurantDetailsForAdminPanel.dart';
import '../Restaurant/ShowRestaurant.dart';
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;



class EditDish extends StatefulWidget {

  final String restaurantName;
  final String initialName;
  final String initialImage;
  final String initialContainedAllergies;
  final int LengthOfRestaurants;
  final int LengthOfDishes;

   EditDish({
  required this.restaurantName,
  required this.initialName,
  required this.initialImage,
  required this.initialContainedAllergies,
     required this.LengthOfDishes,
     required this.LengthOfRestaurants
  });

  @override
  State<EditDish> createState() => _EditDishState();
}

class _EditDishState extends State<EditDish> {
  var RestaurantName = TextEditingController();

  var DishName = TextEditingController();

  var DishImage = TextEditingController();

  var DishAllergyContained = TextEditingController();

  late DatabaseReference _dishesRef;


  @override
  void initState() {
    super.initState();
    DishName.text = widget.initialName;
    DishImage.text = widget.initialImage;
    DishAllergyContained.text = widget.initialContainedAllergies;
    _dishesRef = FirebaseDatabase.instance.reference().child('Restaurants');
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
          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
              // RestaurantDetailsForAdminPanel(detailsModel:
              // detailsModel,
              //   RestaurantName: EditRestaurantName,
              //   RestaurantImage: EditRestaurantImage, RestaurantLength: itemsLength,)));
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
              controller: DishName ..text = widget.initialName,
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
              controller: DishAllergyContained ..text = widget.initialContainedAllergies,
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
              controller: DishImage ..text =widget.initialImage,
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
                  _saveChanges;
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

  void _saveChanges() async {
    print("Here ana henaa");
    final ref = FirebaseDatabase.instance.ref();
    var snapshotUpdate;
    int dishCount;
    var SnapshotGetCounter;
    var snapshotDishUpdate;

    for (int i = 0; i < widget.LengthOfRestaurants; i++) {
      print("Gowa awel For loop");
      print("Before If Condition");
      snapshotUpdate = await ref.child('Restaurants/Restaurant$i/Name').get();
      if (widget.restaurantName == snapshotUpdate.value.toString()) {
        print("WESLT LEL RESTAURANT");
        SnapshotGetCounter =
        await ref.child('Restaurants/Restaurant$i/DishCounter/Counter').get();
        dishCount = int.parse(SnapshotGetCounter.value.toString());
        print("DISH COUNT =");
        print(dishCount);
        for (int j = 0; j < widget.LengthOfDishes; j++) {
          snapshotDishUpdate =
          await ref.child('Restaurants/Restaurant$i/Menu/dish$j/Name').get();
          if (widget.initialName == snapshotDishUpdate.value.toString()) {
            String name = DishName.text;
            String description = DishImage.text;
            String price = DishAllergyContained.text;
            _dishesRef
                .orderByChild('Name')
                .equalTo(widget.restaurantName)
                .once()
                .then((DatabaseEvent event) {
              Map<dynamic, dynamic> restaurantMap = event.snapshot.value as Map<
                  dynamic,
                  dynamic>;
              String restaurantKey = restaurantMap.keys.first;
              _dishesRef
                  .child(restaurantKey)
                  .child('Menu')
                  .child('dish$j')
                  .update({
                'Name': name,
                'Image': description,
                'ListOfcontainedAllergies': price,
              }).then((_) {
                Navigator.pop(context);
              });
            });

            break;
          }
        }
      }
    }
  }

}

