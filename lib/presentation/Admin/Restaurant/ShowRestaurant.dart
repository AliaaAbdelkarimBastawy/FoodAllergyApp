import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/MenuDishes/ShowDishes.dart';
import 'package:graduationproject26_1/presentation/Admin/Restaurant/AddNewRestaurant.dart';
import 'package:graduationproject26_1/presentation/Admin/Restaurant/EditRestaurant.dart';
import 'globalsAdminRestaurant.dart' as globals;
import '../AdminHomePage/AdminHomePage.dart';
import 'package:graduationproject26_1/presentation/Admin/DishesCounterGlobal.dart' as globalsDishesCounter;


class ShowRestaurant extends StatefulWidget {
  const ShowRestaurant({Key? key}) : super(key: key);

  @override
  State<ShowRestaurant> createState() => _ShowRestaurantState();
}

class AdminRestaurantModel {
  late final String title;
   Image image;
  List<AdminMenuModel> MenuList = [];
  AdminRestaurantModel(
      {required this.title, required this.image, required this.MenuList,});
}


class AdminMenuModel {
    String dishName;
   Image dishImage;
   String dishDetails;

  AdminMenuModel(
      {required this.dishName,
        required this.dishImage,
        required this.dishDetails});
}

class _ShowRestaurantState extends State<ShowRestaurant> {
  int forLoop = 6;
  int RestaurantIndex =0;
  List<AdminRestaurantModel> RestaurantList = [];
  final fb = FirebaseDatabase.instance.reference().child("Restaurants");

  List<AdminMenuModel> list = [];
  List<String> Names = [];
  List<String> DishesImages = [];
  List<String> NamesToDelete = [];
  List<String> Images = [];
  List<AdminRestaurantModel> items = [];
  List<List<AdminMenuModel>> MenuList2 = [];
  List<List<AdminMenuModel>> MenuList3 = new List.generate(globals.loop, (i) => []);
  List<List<String>> DishesImageList = new List.generate(globals.loop, (i) => []);


  Future<dynamic> getCurrentUserInfo() async {
    items.clear();
    final ref = FirebaseDatabase.instance.ref();
    var snapshotAllChildren;
    var snapshotDelete;
    var snapshot;
    var snapshot2;
    var snapshot3;
    var snapshot4;
    var snapshot5;
    Names.clear();
    Images.clear();
    MenuList2.clear();


    for (int i = 1; i < globals.loop; i++) {

      snapshot = await ref.child('Restaurants/Restaurant$i/Name').get();
      snapshot2 = await ref.child('Restaurants/Restaurant$i/image').get();
      //snapshot3 = await ref.child('Restaurants/Restaurant$i/Menu').get();
      // list.clear();
      list.clear();
      DishesImages.clear();
      for (int j = 1; j < 13; j++) {
        snapshot3 = await ref.child('Restaurants/Restaurant$i/Menu/dish$j/ListOfcontainedAllergies').get();
        snapshot4 = await ref.child('Restaurants/Restaurant$i/Menu/dish$j/Name').get();
        snapshot5 = await ref.child('Restaurants/Restaurant$i/Menu/dish$j/Image').get();
        print("IF CONDITION?");


        if (snapshot4.value.toString() !="null")
          {
            DishesImageList[i-1].add(snapshot5.value.toString());

            MenuList3[i-1].add(new AdminMenuModel(
                dishName: snapshot4.value.toString(),
                dishImage: Image.network(snapshot5.value.toString()),
                dishDetails: snapshot3.value.toString()));
          }


        // print(list.length);
      }


      print("ListOfDishes-----------");
      print(DishesImageList[i-1]);
      print(MenuList2.length);
      print("Menu add ");


      // MenuList3[i-1].add(list[0]);
      // MenuList3[i-1].add(list[1]);
      // MenuList3[i-1].add(list[2]);
      //
      //
      // MenuList3[i-1].add(list[3]);
      // MenuList3[i-1].add(list[4]);
      // MenuList3[i-1].add(list[5]);


      print("MENU LIST 3333" );
      print(MenuList3.length);
      print(MenuList3[i].length);

      MenuList2.add(list);


      if(snapshot.value.toString() != "null")
      {
        Names.add(snapshot.value.toString());
        Images.add(snapshot2.value.toString());
      }

    }

    for (int i = 0; i < Names.length; i++) {
      setState(() {
        items.add(AdminRestaurantModel(
          title: Names[i],
          image: Image.network(
            Images[i],
            width: 150,
            height: 150,
          ),
          MenuList:MenuList3[i],
        ));
        print("items" + items[0].title);
      });
    }

    for(int i =0; i< items.length; i++)
    {
      if(!globalsDishesCounter.RestaurantsList.contains(items[i].title))
      {
        globalsDishesCounter.RestaurantsList.add(items[i].title);
        globalsDishesCounter.DishesCounterList.add(items[i].MenuList.length);
      }
    }

    print(Names);
    print(Images);
    print(MenuList3.length);
    print(MenuList3[0].length);
    print(MenuList3[1].length);
    print(MenuList3[2].length);
  }

  Future<dynamic> getWhichRestaurantToDelete(int index) async {
    final ref = FirebaseDatabase.instance.ref();
    var snapshotDelete;
    for (int i =0; i< items.length+globals.NoOfDeletedItems; i++)
    {
      print("Lessa");
      print ("ana fy $i");
      snapshotDelete = await ref.child('Restaurants/Restaurant$i/Name').get();
      if(items[index].title == snapshotDelete.value.toString())
      {
        print("Before FB");
        fb.child('Restaurant$i').remove();
        print("After FB");
        setState(() {
          items.removeAt(index);
        });
        print("Break FB");
        break;
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF16CD54),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminHomePage()));
        },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Container(
                    margin: EdgeInsets.fromLTRB(0,10,0,5),
                    child: Text(
                      "Menus",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ))),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: SizedBox(
                height: 530,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child:buildList(),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF16CD54),
        tooltip: 'Add',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              AddNewRestaurant()));
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget buildList() =>
      ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ShowDishes(
                      detailsModel: items[index], itemsLength: items.length, ImagesOfDishes: DishesImageList[index],
                    )));
              },
              child: Container(
                height: 70,
                child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      title: Container(
                        child: Text(
                          items[index].title,
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
                        child: items[index].image,
                      ),
                      // leading: CircleAvatar(
                      //     radius: 30,
                      //     backgroundImage: items[index].image as ImageProvider),
                      // NetworkImage(
                      // Image.network('https://logos-download.com/wp-content/uploads/2016/03/KFC_Logo_2006.png')),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [IconButton(icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                EditRestaurant(EditRestaurantName: items[index].title, EditRestaurantImage: Images[index], itemsLength: items.length,)));
                          },),

                          IconButton(icon: Icon(Icons.delete),
                            onPressed: () {
                              globals.NoOfDeletedItems++;
                              getWhichRestaurantToDelete(index);

                            },)],
                      ),
                    )),
              ),
            );
          });


  @override
  void initState() {
    super.initState();
    getCurrentUserInfo();
  }


}
