import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategoryItem/ShowProducts.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategorySection/AddNewCategorySection.dart';
import 'globalsAdminCategory.dart' as globals;
import '../../AdminHomePage/AdminHomePage.dart';
import 'package:graduationproject26_1/presentation/Admin/DishesCounterGlobal.dart' as globalsProductsCounter;
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;


class ShowCategory extends StatefulWidget {
  const ShowCategory({Key? key}) : super(key: key);

  @override
  State<ShowCategory> createState() => _ShowCategoryState();
}

class AdminCategoryModel {
  late final String title;
  Image image;
  List<AdminProductModel> ProductList = [];
  AdminCategoryModel(
      {required this.title, required this.image, required this.ProductList,});
}

class AdminProductModel {
  String ProductName;
  String contains;
  String description;
  Image ProductImage;
  String ingredients;



  AdminProductModel(
      {required this.ProductName,
        required this.contains,
        required this.description,
        required this.ProductImage,
        required this.ingredients
      });

}


class _ShowCategoryState extends State<ShowCategory> {


  int forLoop = 5;
  int CategoryIndex =0;
  List<AdminCategoryModel> CategoryList = [];
  final fb = LanguageGlobalByAdmin.isEnglish ?
  FirebaseDatabase.instance.reference().child("Category"):
  FirebaseDatabase.instance.reference().child("CategoryArabic")
  ;

  List<AdminProductModel> list = [];
  List<String> Names = [];
  List<String> ProductsImages = [];
  List<String> Images = [];
  List<AdminCategoryModel> items = [];
  List<List<AdminProductModel>> ProductList2 = [];
  List<List<AdminProductModel>> ProductList3 = new List.generate(globals.loop, (i) => []);
  List<List<String>> ProductsImageList = new List.generate(globals.loop, (i) => []);


  Future<dynamic> getCurrentUserInfo() async {
    items.clear();
    final ref = FirebaseDatabase.instance.ref();

    var snapshot;
    var snapshot2;
    var snapshot3;
    var snapshot4;
    var snapshot5;
    var snapshot6;
    var snapshot7;
    Names.clear();
    Images.clear();
    ProductList2.clear();


    for (int i = 1; i < globals.loop; i++) {

      snapshot = await ref.child('Category/Category$i/Name').get();
      snapshot2 = await ref.child('Category/Category$i/Image').get();

      list.clear();
      ProductsImages.clear();
      for (int j = 1; j < 13; j++) {
        snapshot3 = await ref.child('Category/Category$i/Items/Item$j/Name').get();
        snapshot4 = await ref.child('Category/Category$i/Items/Item$j/contains').get();
        snapshot5 = await ref.child('Category/Category$i/Items/Item$j/description').get();
        snapshot6 = await ref.child('Category/Category$i/Items/Item$j/image').get();
        snapshot7 = await ref.child('Category/Category$i/Items/Item$j/ingredients').get();
        print("IF CONDITION?");


        if (snapshot3.value.toString() !="null")
        {
          ProductsImageList[i-1].add(snapshot6.value.toString());

          ProductList3[i-1].add(new AdminProductModel(
              ProductName: snapshot3.value.toString() ,
              contains: snapshot4.value.toString(),
              description: snapshot5.value.toString(),
              ProductImage: Image.network(snapshot6.value.toString()),
              ingredients: snapshot7.value.toString()));
        }


        // print(list.length);
      }





      print("MENU LIST 3333" );
      print(ProductList3.length);
      print(ProductList3[i].length);

      ProductList2.add(list);


      if(snapshot.value.toString() != "null")
      {
        Names.add(snapshot.value.toString());
        Images.add(snapshot2.value.toString());
      }

    }

    for (int i = 0; i < Names.length; i++) {
      setState(() {
        items.add(AdminCategoryModel(
            title:  Names[i],
            image: Image.network(
              Images[i],
              width: 150,
              height: 150,
            ),
            ProductList: ProductList3[i]
        ));
        print("items" + items[0].title);
      });
    }

    for(int i =0; i< items.length; i++)
    {
      if(!globalsProductsCounter.CategoryList.contains(items[i].title))
      {
        globalsProductsCounter.CategoryList.add(items[i].title);
        globalsProductsCounter.ProductsCounterList.add(items[i].ProductList.length);
      }
    }

  }
  Future<dynamic> getCurrentUserInfoArabic() async {
    items.clear();
    final ref = FirebaseDatabase.instance.ref();

    var snapshot;
    var snapshot2;
    var snapshot3;
    var snapshot4;
    var snapshot5;
    var snapshot6;
    var snapshot7;
    Names.clear();
    Images.clear();
    ProductList2.clear();


    for (int i = 1; i < globals.loop; i++) {

      snapshot = await ref.child('CategoryArabic/Category$i/Name').get();
      snapshot2 = await ref.child('CategoryArabic/Category$i/Image').get();

      list.clear();
      ProductsImages.clear();
      for (int j = 1; j < 13; j++) {
        snapshot3 = await ref.child('CategoryArabic/Category$i/Items/Item$j/Name').get();
        snapshot4 = await ref.child('CategoryArabic/Category$i/Items/Item$j/contains').get();
        snapshot5 = await ref.child('CategoryArabic/Category$i/Items/Item$j/description').get();
        snapshot6 = await ref.child('CategoryArabic/Category$i/Items/Item$j/image').get();
        snapshot7 = await ref.child('CategoryArabic/Category$i/Items/Item$j/ingredients').get();
        print("IF CONDITION?");


        if (snapshot3.value.toString() !="null")
        {
          ProductsImageList[i-1].add(snapshot6.value.toString());

          ProductList3[i-1].add(new AdminProductModel(
              ProductName: snapshot3.value.toString() ,
              contains: snapshot4.value.toString(),
              description: snapshot5.value.toString(),
              ProductImage: Image.network(snapshot6.value.toString()),
              ingredients: snapshot7.value.toString()));
        }


        // print(list.length);
      }





      print("MENU LIST 3333" );
      print(ProductList3.length);
      print(ProductList3[i].length);

      ProductList2.add(list);


      if(snapshot.value.toString() != "null")
      {
        Names.add(snapshot.value.toString());
        Images.add(snapshot2.value.toString());
      }

    }

    for (int i = 0; i < Names.length; i++) {
      setState(() {
        items.add(AdminCategoryModel(
            title:  Names[i],
            image: Image.network(
              Images[i],
              width: 150,
              height: 150,
            ),
            ProductList: ProductList3[i]
        ));
        print("items" + items[0].title);
      });
    }

    for(int i =0; i< items.length; i++)
    {
      if(!globalsProductsCounter.CategoryList.contains(items[i].title))
      {
        globalsProductsCounter.CategoryList.add(items[i].title);
        globalsProductsCounter.ProductsCounterList.add(items[i].ProductList.length);
      }
    }

  }


  final DatabaseReference _categoriesRef = LanguageGlobalByAdmin.isEnglish?
  FirebaseDatabase.instance.reference().child('Category'):
  FirebaseDatabase.instance.reference().child('CategoryArabic');
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
                      "Categories",
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
                  child:StreamBuilder(
                    stream: _categoriesRef.onValue,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData && snapshot.data?.snapshot.value != null) {
                        Map<dynamic, dynamic> values =
                        snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                        List<dynamic> categoryList = values.values.toList();
                        return ListView.builder(
                            itemCount: categoryList.length,
                            itemBuilder: (context, index) {
                              MapEntry<dynamic, dynamic> categoryEntry =
                              values.entries.elementAt(index);
                              Map<dynamic, dynamic> categoryMap =
                              categoryEntry.value as Map<dynamic, dynamic>;
                              if(categoryMap['Name'].toString() == "null")
                              {
                                return Text("");
                              }
                              else
                              {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) =>
                                            ShowProducts(detailsModel:  items[index], itemsLength: items.length,
                                              ImagesOfProducts:ProductsImageList[index], categoryName: categoryMap['Name'], noOfCategory: index,
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
                                              categoryMap['Name'],
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
                                            child: Image.network(
                                              categoryMap['Image'],
                                              width: 100,
                                              height: 100,
                                            ),
                                          ),

                                        )),
                                  ),
                                );
                              }


                            });

                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error retrieving recipe data'),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  @override
  void initState() {
    super.initState();
    if(LanguageGlobalByAdmin.isEnglish == true)
      {
        getCurrentUserInfo();

      }
    else
      {
        getCurrentUserInfoArabic();

      }
  }

}
