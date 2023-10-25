import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:graduationproject26_1/presentation/Admin/Restaurant/RestaurantDetailsForAdminPanel.dart';
import 'package:graduationproject26_1/presentation/Admin/Restaurant/ShowRestaurant.dart';
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;

class EditDishScreen extends StatefulWidget {
  final String restaurantName;
  final String initialName;
  final String initialDescription;
  final String initialPrice;
  final int LengthOfRestaurants;
  final int LengthOfDishes;
  final String restaurantImage;



  const EditDishScreen({
    required this.restaurantName,
    required this.restaurantImage,
    required this.initialName,
    required this.initialDescription,
    required this.initialPrice, required this.LengthOfDishes, required this.LengthOfRestaurants
  });

  @override
  _EditDishScreenState createState() => _EditDishScreenState();
}

class _EditDishScreenState extends State<EditDishScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  late DatabaseReference _dishesRef;
  final DatabaseReference _restaurantsRef =LanguageGlobalByAdmin.isEnglish?
  FirebaseDatabase.instance.reference().child('Restaurants'):
  FirebaseDatabase.instance.reference().child('RestaurantsArabic')
  ;
  late Map<dynamic, dynamic> restaurantMap;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.initialName;
    _descriptionController.text = widget.initialDescription;
    _priceController.text = widget.initialPrice.toString();


    _dishesRef = LanguageGlobalByAdmin.isEnglish ?
    FirebaseDatabase.instance.reference().child('Restaurants'):
    FirebaseDatabase.instance.reference().child('RestaurantsArabic')
    ;
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
          Navigator.pop(context);
        },
        ),      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15,),
            Text("Dish Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 10,),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5,
                      color: Colors.black),),),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16.0),
            Text("Allergy Contained", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 10,),
            TextFormField(
              controller: _priceController,
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
            SizedBox(height: 16.0),
            Text("Dish Image", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 10,),
            TextFormField(
              controller: _descriptionController,
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
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if(LanguageGlobalByAdmin.isEnglish == true)
                  {
                    print("ARABICCCC__LAAA");
                    _saveChanges();

                  }
                else
                  {
                    print("ARABICCCC__AAAAh");
                    _saveChangesArabic();

                  }

              },
                child:
               Text('Update', style: TextStyle(
                fontSize: 18,
                color: Colors.white,),),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF16CD54),
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveChanges() async {
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
            String name = _nameController.text;
            String description = _descriptionController.text;
            String price = _priceController.text;
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                   ShowRestaurant()));
              });
            });

            break;
          }
        }
      }
    }
  }
  void _saveChangesArabic() async {
    final ref = FirebaseDatabase.instance.ref();
    var snapshotUpdate;
    int dishCount;
    var SnapshotGetCounter;
    var snapshotDishUpdate;

    for (int i = 1; i < widget.LengthOfRestaurants+1; i++) {
      print("Gowa awel For loop");
      print("Before If Condition");
      snapshotUpdate = await ref.child('RestaurantsArabic/Restaurant$i/Name').get();
      print("NAMES OF RESTAURANTS TO COMPARE");
      print(widget.restaurantName);
      print(snapshotUpdate.value.toString());
      if (widget.restaurantName == snapshotUpdate.value.toString()) {
        print("WESLT LEL RESTAURANT");
        SnapshotGetCounter =
        await ref.child('RestaurantsArabic/Restaurant$i/DishCounter/Counter').get();
        dishCount = int.parse(SnapshotGetCounter.value.toString());
        print("DISH COUNT =");
        print(dishCount);
        for (int j = 1; j < dishCount; j++) {
          snapshotDishUpdate =
          await ref.child('RestaurantsArabic/Restaurant$i/Menu/dish$j/Name').get();
          if (widget.initialName == snapshotDishUpdate.value.toString()) {
            String name = _nameController.text;
            String description = _descriptionController.text;
            String price = _priceController.text;
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    ShowRestaurant()));
              });
            });

            break;
          }
        }
      }
    }
  }

}