
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Restaurant/ShowRestaurant.dart';
import 'package:graduationproject26_1/presentation/HomeScreen/globals.dart';
import 'globalsAdminRestaurant.dart' as globals;
import 'package:graduationproject26_1/presentation/Admin/DishesCounterGlobal.dart' as globalsDishesCounter;
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;


class AddNewRestaurant extends StatefulWidget {
   AddNewRestaurant({Key? key}) : super(key: key);

  @override
  State<AddNewRestaurant> createState() => _AddNewRestaurantState();
}

class _AddNewRestaurantState extends State<AddNewRestaurant> {
  final DatabaseReference fb =LanguageGlobalByAdmin.isEnglish?
  FirebaseDatabase.instance.reference().child('Restaurants'):
  FirebaseDatabase.instance.reference().child('RestaurantsArabic')
  ;
  var RestaurantName = TextEditingController();
  var RestaurantImage = TextEditingController();


  Future<dynamic> AddRestaurant() async {
    final ref = FirebaseDatabase.instance.ref();
    var snapshot;
    int ResCount;
    int RestaurantCount;
    snapshot = await ref.child('Restaurants/RestaurantCounter/Counter').get();
    globalsDishesCounter.RestaurantCounter = int.parse(snapshot.value.toString());
    ResCount =  globalsDishesCounter.RestaurantCounter;



    Map<String, String> restaurants =
    {
      'Name' : RestaurantName.text,
      'image' : RestaurantImage.text,
    };

    Map<String, String> DishesCounter =
    {
      'Counter' : "1",
    };


    fb.child("Restaurant$ResCount").set(restaurants);
    globals.NumberOfReload ++;
    globals.ID ++;
    setState(() {
      globals.loop++;
    });

    fb.child("Restaurant$ResCount/DishCounter").set(DishesCounter);

    if(!globalsDishesCounter.RestaurantsList.contains(RestaurantName.text))
    {
      globalsDishesCounter.RestaurantsList.add(RestaurantName.text);
      globalsDishesCounter.DishesCounterList.add(0);
    }
    // });

    ResCount++;
    Map<String, String> count =
    {
      'Counter' : ResCount.toString(),
    };

    fb.child("RestaurantCounter").set(count);
    globalsDishesCounter.RestaurantCounter ++;

  }

  Future<dynamic> AddRestaurantArabic() async {
    final ref = FirebaseDatabase.instance.ref();
    var snapshot;
    int ResCount;
    int RestaurantCount;
    snapshot = await ref.child('RestaurantsArabic/RestaurantCounter/Counter').get();
    globalsDishesCounter.RestaurantCounter = int.parse(snapshot.value.toString());
    ResCount =  globalsDishesCounter.RestaurantCounter;



    Map<String, String> restaurants =
    {
      'Name' : RestaurantName.text,
      'image' : RestaurantImage.text,
    };

    Map<String, String> DishesCounter =
    {
      'Counter' : "1",
    };


    fb.child("Restaurant$ResCount").set(restaurants);
    globals.NumberOfReload ++;
    globals.ID ++;
    setState(() {
      globals.loop++;
    });

    fb.child("Restaurant$ResCount/DishCounter").set(DishesCounter);

    if(!globalsDishesCounter.RestaurantsList.contains(RestaurantName.text))
    {
      globalsDishesCounter.RestaurantsList.add(RestaurantName.text);
      globalsDishesCounter.DishesCounterList.add(0);
    }
    // });

    ResCount++;
    Map<String, String> count =
    {
      'Counter' : ResCount.toString(),
    };

    fb.child("RestaurantCounter").set(count);
    globalsDishesCounter.RestaurantCounter ++;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: ()
        {Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowRestaurant()));
        },),
        title: Text("Add New Restaurant"),
        backgroundColor: Color(0xFF16CD54),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Text("Restaurant Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 10,),
            TextFormField(
              controller: RestaurantName,
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
              controller: RestaurantImage,
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
                  if (LanguageGlobalByAdmin.isEnglish == true)
                    {
                      AddRestaurant();

                    }
                  else
                    {
                      AddRestaurantArabic();

                    }
                  Navigator.pop(context);

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
