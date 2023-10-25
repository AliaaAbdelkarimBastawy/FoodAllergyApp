import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject26_1/presentation/test/AllergenMenuTest.dart';
import 'package:graduationproject26_1/presentation/test/ProductDetailsTest.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/recipesDetails/recipes_Details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/test/recipeDetailsTest.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:graduationproject26_1/languageGlobal.dart' as LanguageGlobal;


class MyCategory extends StatefulWidget {
  const MyCategory({Key? key}) : super(key: key);

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class Categoryy {
  String id;
  String Name;
  String Image;
  List<Menus> menus;

  Categoryy({required this.id, required this.Name,
    required this.Image,required this.menus,});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Name': Name,
      'Image': Image,
    };
  }
}
class Menus {
  List<Item> items;


  Menus({ required this.items,});

  Map<String, dynamic> toMap(String categoryId) {
    return {
      'category_id': categoryId,

    };
  }
}
class Item {
  String id;
  String Name;
  String image;
  String description;
  String contains;
  String ingredients;

  Item({required this.id, required this.Name,
    required this.image,required this.description,
    required this.contains, required this.ingredients});


  Map<String, dynamic> toMap(String menuId) {
    return {
      'id': id,
      'Name': Name,
      'image': image,
      'description':description,
      'contains':contains,
      'ingredients':ingredients,
      'menu_id': menuId,
    };
  }

}

DatabaseReference ref_category= LanguageGlobal.isEnglish? FirebaseDatabase.instance.ref("Category") :FirebaseDatabase.instance.ref("CategoryArabic");

List<Categoryy> itemsOfCategory = [];

class _MyCategoryState extends State<MyCategory> {
  List<Categoryy> _category = [];
  List<Categoryy> _category2 = [];

  Future<void> _initData() async {

    _category = await getCategories();
    _category2 = await getCategories();

  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  Future<List<Categoryy>> getCategories() async {
    List<Categoryy> categories =[];
    DatabaseEvent event = await ref_category.once();
    final categoryData =event.snapshot.value as Map<dynamic, dynamic>;
    categoryData.forEach((key, value) {
      List<Menus> menus = [];
      List<Item> items = [];

        value['Items'].forEach((itemKey, itemValue) {
          print("forloop");
          print(itemValue['Name']);
          if (itemValue['Name'] != null) {
            items.add(Item(
              id: itemKey,
              Name: itemValue['Name'] ?? '',
              image: itemValue['image'],
              ingredients: itemValue['ingredients'],
              contains: itemValue['contains'],
              description: itemValue['description'],
            ));
          }
        });

        print("forloop_bara_line198");
        print(items[0].Name);
        // print(items[1].Name);

        menus.add(Menus(items: items,));

        print("forloop_bara_line207");

        print(menus[0].items[0].Name);
        // print(menus[0].items[1].Name);

        if(value['Name'] != null)
        {
          setState(() {
            categories.add(Categoryy(
              id: key, Name: value['Name'] ?? '',
              Image: value['Image'] ?? '',
              menus:menus,));
          });
        }

        print("forloop_bara_line222");

    });
    print("Length");
    print(categories[0].menus[0].items[0].Name);
    print(categories[1].menus[0].items[0].Name);
    print(categories[2].menus[0].items[0].Name);
    print(categories[3].menus[0].items[0].Name);


    return categories;
  }
  /// List of Tab Bar Item

  List<String> titles = [
    "Snacks",
    "Protein",
    "Milk",
    "Bakery",
  ];
  int current = 0;


  @override
  Widget build(BuildContext context) {
    if (_category.isEmpty)
      {
        return CircularProgressIndicator();
      }

    else
      {
        return Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                height: 50,
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  decoration:  InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.green),
                    hintText: 'Search product'.tr,
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
                    search(text, current);
                  },
                ),
              ),
              /// CUSTOM TABBAR
              Container(
                margin: EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: 370,
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: titles.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 100),
                                  margin: const EdgeInsets.all(5),
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: current == index
                                        ? Color(0xFF16CD54)
                                        : Colors.white70,
                                    borderRadius: current == index
                                        ? BorderRadius.circular(15)
                                        : BorderRadius.circular(10),
                                    border: current == index
                                        ? Border.all(
                                        color: Color(0xFF16CD54), width: 2)
                                        : Border.all(
                                        color: Colors.white30, width: 2),
                                  ),
                                  child: Center(
                                    child: Text(
                                      titles[index].tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: current == index
                                              ? Colors.white
                                              : Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: current == index,
                                  child: Container(
                                    width: 5,
                                    height: 5,
                                  ))
                            ],
                          );
                        }),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  height: 365,
                  child: GridView.builder(
                    itemBuilder: (context, index) {
                      final category = _category[current];
                      itemsOfCategory.add(category);
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8,8,4,8),
                        child: Material(
                          // elevation: 10,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                      MyProductDetails(detailsModel: _category[current].menus[0].items[index],)));
                                },
                                child: Container(
                                    margin: const EdgeInsets.only(top: 5.0),
                                    height: 160.0,
                                    width: 200.0,
                                    child: Card(
                                        elevation: 13,
                                        margin:EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
                                              child: Center(child:
                                              Image.network(_category[current].menus[0].items[index].image,
                                                width: 100, height: 100,
                                              )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                _category[current].menus[0].items[index].Name,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w300,
                                                    fontFamily: "Outfit"),
                                              ),
                                            ),
                                          ],
                                        ))
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: (_category[current].menus[0].items.isEmpty ? 0 : _category[current].menus[0].items.length) ,
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 220,
                        childAspectRatio: 1 / 1,
                        mainAxisSpacing: 2),

                  ),

                ),
              ),
            ],
          ),
        );

      }

  }

  Future<void> search(String text, int current) async {
    _category[current].menus[0].items.clear();
    // items.clear();
    for (int i = 0; i < _category2[current].menus[0].items.length; i++) {
      setState(() {
        if (_category2[current].menus[0].items[i].Name.contains(text)) {
          _category[current].menus[0].items.add(_category2[current].menus[0].items[i]);
        }
      });
    }
  }

}
