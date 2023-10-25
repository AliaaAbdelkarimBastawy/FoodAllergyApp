import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Restaurant/ShowRestaurant.dart';
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;

import '../AdminHomePage/AdminHomePage.dart';
import 'globalsAdminRestaurant.dart' as globals;


class EditRestaurant extends StatelessWidget {
  String EditRestaurantName;
  String EditRestaurantImage;
  int itemsLength;

  EditRestaurant({Key? key, required this.EditRestaurantName,required this.EditRestaurantImage,
    required this.itemsLength, }) : super(key: key);
  var RestaurantName = TextEditingController();
  var RestaurantImage = TextEditingController();

  final DatabaseReference fb =LanguageGlobalByAdmin.isEnglish?
  FirebaseDatabase.instance.reference().child('Restaurants'):
  FirebaseDatabase.instance.reference().child('RestaurantsArabic')
  ;
  Future<dynamic> getWhichRestaurantToUpdate() async {
    final ref = FirebaseDatabase.instance.ref();
    var snapshotUpdate;
    for (int i =0; i< itemsLength+globals.NoOfDeletedItems+5; i++)
    {
      snapshotUpdate =await ref.child('Restaurants/Restaurant$i/Name').get();
      print(snapshotUpdate.value.toString());
      if(EditRestaurantName== snapshotUpdate.value.toString())
      {
        print("IN EL IF CONDITION");
        Map<String, String> UpdateRestaurant =
        {
          'Name' : RestaurantName.text,
          'image' : RestaurantImage.text,
        };
        fb.child("Restaurant$i").set(UpdateRestaurant);
        EditRestaurantName = RestaurantName.text;
        EditRestaurantImage = RestaurantImage.text;
      }
      else
      {
        print("Else Part");

      }


    }

  }
  Future<dynamic> getWhichRestaurantToUpdateArabic() async {
    final ref = FirebaseDatabase.instance.ref();
    var snapshotUpdate;
    for (int i =0; i< itemsLength+globals.NoOfDeletedItems+5; i++)
    {
      snapshotUpdate =await ref.child('RestaurantsArabic/Restaurant$i/Name').get();
      print(snapshotUpdate.value.toString());
      if(EditRestaurantName== snapshotUpdate.value.toString())
      {
        print("IN EL IF CONDITION");
        Map<String, String> UpdateRestaurant =
        {
          'Name' : RestaurantName.text,
          'image' : RestaurantImage.text,
        };
        fb.child("Restaurant$i").set(UpdateRestaurant);
        EditRestaurantName = RestaurantName.text;
        EditRestaurantImage = RestaurantImage.text;
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowRestaurant()));

        },
        ),
        title: Text("Edit Restaurant"),
        backgroundColor: Color(0xFF16CD54),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text("Restaurant Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 10,),
            TextFormField(
              controller: RestaurantName ..text = EditRestaurantName,
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
            Text("Restaurant Image", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 10,),
            TextFormField(
              controller: RestaurantImage ..text = EditRestaurantImage,
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
                      getWhichRestaurantToUpdate();

                    }
                  else
                    {
                      getWhichRestaurantToUpdateArabic();

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
    );
  }
}
