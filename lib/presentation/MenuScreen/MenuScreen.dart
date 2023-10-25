
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'AllergenMenuScreen.dart';
import '../Admin/Restaurant/FromUserOrAdminFile.dart' as globalsFromUser;
import '../Admin/AdminHomePage/globals.dart' as AdminGlobals;

import '../Admin/Recipe/FromUserOrAdminPage.dart' as globals;


class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreen createState() => _MenuScreen();
}

class MenuModel {
  late final String dishName;
  final Image dishImage;
  final String dishDetails;

  MenuModel(
      {required this.dishName,
        required this.dishImage,
        required this.dishDetails});
}

class Model {
  late final String title;
  final Image image;
  List<MenuModel> MenuList = [];

  Model({required this.title, required this.image, required this.MenuList});
}

class _MenuScreen extends State<MenuScreen> {
  final fb = FirebaseDatabase.instance.reference().child("Restaurants");

  List<MenuModel> list = [];
  List<String> Names = [];
  List<String> Images = [];
  List<Model> items = [];
  List<List<MenuModel>> MenuList2 = [];
  List<List<MenuModel>> MenuList3 = new List.generate(6, (i) => []);

  Future<dynamic> getCurrentUserInfo() async {
    items.clear();
    items.clear();
    final ref = FirebaseDatabase.instance.ref();

    var snapshot;
    var snapshot2;
    var snapshot3;
    var snapshot4;
    var snapshot5;
    Names.clear();
    Images.clear();
    MenuList2.clear();
    for (int i = 1; i < 6; i++) {

      snapshot = await ref.child('Restaurants/Restaurant$i/Name').get();
      snapshot2 = await ref.child('Restaurants/Restaurant$i/image').get();

      if(snapshot.value.toString() != "null")
        {
          list.clear();
          for (int j = 1; j < 4; j++) {
            snapshot3 = await ref.child('Restaurants/Restaurant$i/Menu/dish$j/ListOfcontainedAllergies').get();
            snapshot4 = await ref.child('Restaurants/Restaurant$i/Menu/dish$j/Name').get();
            snapshot5 = await ref.child('Restaurants/Restaurant$i/Menu/dish$j/Image').get();
            if(snapshot4.value.toString() != "null")
            {
              list.add(new MenuModel(
                  dishName: snapshot4.value.toString(),
                  dishImage: Image.network(snapshot5.value.toString()),
                  dishDetails: snapshot3.value.toString()));


              MenuList3[Names.length].add(new MenuModel(
                  dishName: snapshot4.value.toString(),
                  dishImage: Image.network(snapshot5.value.toString()),
                  dishDetails: snapshot3.value.toString()));
            }

            // print(list.length);
          }


          print("MENU LIST 3333" );
          print(MenuList3.length);
          print(MenuList3[i].length);

          MenuList2.add(list);

          print(list);
          Names.add(snapshot.value.toString());
          Images.add(snapshot2.value.toString());
        }

    }

    for (int i = 0; i < Names.length; i++) {


        items.add(Model(
          title: Names[i],
          image: Image.network(
            Images[i],
            width: 150,
            height: 150,
          ),
          MenuList:MenuList3[i],
        ));
        print("items" + items[0].title);
    }

    print(Names);
    print(Images);
    print(MenuList3.length);
    print(MenuList3[0].length);
    print(MenuList3[1].length);
    print(MenuList3[2].length);
  }

  var SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Container(
          height: 50,
          margin: const EdgeInsets.fromLTRB(15, 15, 15, 25),
          child: TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.green),
              hintText: 'Search restaurant',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  borderSide: BorderSide(color: Colors.green)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  borderSide: BorderSide(color: Colors.green)),
            ),
            onChanged: (text) {
              search(text);
            },
          ),
        ),

          buildList()
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget buildList() => Expanded(
    child: Container(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              childAspectRatio: 1 / 1),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print(items[index]);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AllergenMenuScreen(
                      detailsModel: items[index],
                    )));
              },
              child: Card(
                elevation: 10,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: GridTile(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      items[index].image,
                      Text(
                        items[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Outfit"),
                      ),
                    ],
                  ),
                ),
              ),
            );
            ;
          }),
    ),
  );

  @override
  void initState() {
    super.initState();
    globalsFromUser.FromUser=2;
    getCurrentUserInfo();
  }

  Future<void> search(String text) async {
    items.clear();
    for (int i = 0; i < Names.length; i++) {
      setState(() {
        if (Names[i].contains(text)) {
          items.add(new Model(
              title: Names[i],
              image: Image.network(
                Images[i],
                width: 150,
                height: 150,
              ),
              MenuList: MenuList3[i]));
        }
      });
    }
  }
}
