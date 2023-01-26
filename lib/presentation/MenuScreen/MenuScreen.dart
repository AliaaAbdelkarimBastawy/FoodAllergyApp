
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'AllergenMenuScreen.dart';

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
    final ref = FirebaseDatabase.instance.ref();

    var snapshot;
    var snapshot2;
    var snapshot3;
    var snapshot4;
    var snapshot5;
    Names.clear();
    Images.clear();
    MenuList2.clear();
    for (int i = 1; i < 5; i++) {

      snapshot = await ref.child('Restaurants/Restaurant$i/Name').get();
      snapshot2 = await ref.child('Restaurants/Restaurant$i/image').get();
      //snapshot3 = await ref.child('Restaurants/Restaurant$i/Menu').get();
      // list.clear();
      list.clear();
      for (int j = 1; j < 4; j++) {
        snapshot3 = await ref.child('Restaurants/Restaurant$i/Menu/dish$j/ListOfcontainedAllergies').get();
        snapshot4 = await ref.child('Restaurants/Restaurant$i/Menu/dish$j/Name').get();
        snapshot5 = await ref.child('Restaurants/Restaurant$i/Menu/dish$j/Image').get();
        list.add(new MenuModel(
            dishName: snapshot4.value.toString(),
            dishImage: Image.network(snapshot5.value.toString()),
            dishDetails: snapshot3.value.toString()));
        // print(list.length);
      }


      print(MenuList2.length);
      print("Menu add ");
      print(list.length);
      print(list[0].dishName);
      print(list[1].dishName);
      print(list[2].dishName);
      for(int k =0; k<2; k++){

        // MenuList2[i].add(list[k]); //<--changed to add
        print(list[k].dishName);
      }

      MenuList3[i-1].add(list[0]);
      MenuList3[i-1].add(list[1]);
      MenuList3[i-1].add(list[2]);
      globals.MenuList3[i-1].add(list[0]);
      globals.MenuList3[i-1].add(list[1]);
      globals.MenuList3[i-1].add(list[2]);



      print("MENU LIST 3333" );
      print(MenuList3.length);
      print(MenuList3[i].length);

      MenuList2.add(list);

      print(list);
      Names.add(snapshot.value.toString());
      Images.add(snapshot2.value.toString());
    }

    for (int i = 0; i < Names.length; i++) {
      setState(() {
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
      });
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
    for (int i = 0; i < Names.length; i++) {
      globals.items.add(items[i]);
      globals.items1.add(items[i]);
      globals.Names.add(Names[i]);
      globals.Images.add(Images[i]);
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
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
          itemCount: globals.items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print(globals.items[index]);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AllergenMenuScreen(
                      detailsModel: globals.items[index],
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
                      globals.items[index].image,
                      Text(
                        globals.items[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 25,
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
    if (globals.NumberOfReload == 0)
    {
      getCurrentUserInfo();
      globals.NumberOfReload =  globals.NumberOfReload +1;
    }
    else
    {
      globals.NumberOfReload =  globals.NumberOfReload +1;
    }
  }

  Future<void> search(String text) async {
    globals.items.clear();
    if (text !="")
    {
      globals.items.clear();
      for (int i = 0; i < globals.Names.length; i++) {
        setState(() {
          if (globals.Names[i].contains(text)) {
            globals.items.add(new Model(
                title: globals.Names[i],
                image: Image.network(
                  globals.Images[i],
                  width: 150,
                  height: 150,
                ),
                MenuList: globals.MenuList3[i]));}
        });
      }
    }
    else if(text == "")
    {
      for (int j =0; j<globals.items1.length;j++)
      {
        setState(() {
          globals.items.add(globals.items1[j]);
        });
      }
    }

  }
}

