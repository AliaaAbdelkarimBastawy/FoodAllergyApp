
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/AdminHomePage/AdminHomePage.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategoryItem/AddNewCategoryItem.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategoryItem/EditCategoryItem.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategorySection/ShowCategory.dart';
import 'package:graduationproject26_1/presentation/Admin/DishesCounterGlobal.dart' as globalsProductsCounter;
import 'package:graduationproject26_1/presentation/Admin/Category/CategorySection/globalsAdminCategory.dart' as globals;

import '../../../HomeScreen/globals.dart';
class ShowProducts extends StatefulWidget {

  int itemsLength;
  AdminCategoryModel detailsModel;
  List<String> ImagesOfProducts = [];
  String categoryName;
  int noOfCategory;

  ShowProducts({Key? key, required this.noOfCategory, required this.detailsModel, required this.itemsLength, required this.ImagesOfProducts, required this.categoryName}) : super(key: key);

  static List<String> Names = [];
  static List<String> Images = [];

  @override
  State<ShowProducts> createState() => _ShowProductsState();
}



class _ShowProductsState extends State<ShowProducts> {

  late DatabaseReference _categoriesRef;
  int NoOfProducts =0;
  List<List<AdminProductModel>> ProductList3 = new List.generate(globals.loop, (i) => []);

  final fb = LanguageGlobalByAdmin.isEnglish?
  FirebaseDatabase.instance.reference().child("Category"):
  FirebaseDatabase.instance.reference().child("CategoryArabic")
  ;

  List<AdminCategoryModel> list = [];
  Future<dynamic> ProductsLength() async {
    for(int z=0; z< widget.detailsModel.ProductList.length; z++)
    {
      if (widget.detailsModel.ProductList[z].ProductName == "null")
      {
        widget.detailsModel.ProductList.removeAt(z);
      }
    }
    for(int j =0; j< globalsProductsCounter.CategoryList.length; j++)
    {
      if (widget.detailsModel.title == globalsProductsCounter.CategoryList[j])
      {
        NoOfProducts = globalsProductsCounter.ProductsCounterList[j];
      }
    }

  }


  @override
  Widget build(BuildContext context) {
    String i = widget.categoryName;
    if(LanguageGlobalByAdmin.isEnglish == true)
      {
        if(i== "Bakery")
        {
          _categoriesRef = FirebaseDatabase.instance.reference().child('Category/Category1/Items');

        }
        else  if(i== "Milk")
        {
          _categoriesRef = FirebaseDatabase.instance.reference().child('Category/Category2/Items');

        }
        else  if(i== "Protein")
        {
          _categoriesRef = FirebaseDatabase.instance.reference().child('Category/Category3/Items');

        }
        else  if(i== "Snacks")
        {
          _categoriesRef = FirebaseDatabase.instance.reference().child('Category/Category4/Items');

        }
      }
    else
      {
        if(i== "مخبز")
        {
          _categoriesRef = FirebaseDatabase.instance.reference().child('CategoryArabic/Category1/Items');

        }
        else  if(i== "حليب")
        {
          _categoriesRef = FirebaseDatabase.instance.reference().child('CategoryArabic/Category2/Items');

        }
        else  if(i== "بروتين")
        {
          _categoriesRef = FirebaseDatabase.instance.reference().child('CategoryArabic/Category3/Items');

        }
        else  if(i== "وجبات خفيفة")
        {
          _categoriesRef = FirebaseDatabase.instance.reference().child('CategoryArabic/Category4/Items');

        }
      }

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
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowCategory()));

        },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(widget.categoryName,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
            ),
            Center(
                child:Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: 520,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child:StreamBuilder(
                        stream: _categoriesRef.onValue,
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData && snapshot.data?.snapshot.value != null) {
                            Map<dynamic, dynamic> values =
                            snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                            List<dynamic> productList = values.values.toList();
                            print("Size of Product List");
                            print(productList.length);
                            print(widget.categoryName);
                            return ListView.builder(
                                itemCount: productList.length,
                                itemBuilder: (context, index) {
                                  MapEntry<dynamic, dynamic> productEntry =
                                  values.entries.elementAt(index);

                                  print("ERROR LEH? :/");
                                  print(productEntry.value);
                                  print(productEntry.key);

                                  Map<dynamic, dynamic> productMap =
                                  productEntry.value as Map<dynamic, dynamic>;
                                  if(productMap['Name'].toString() == "null")
                                  {
                                    return Text("");
                                  }
                                  else
                                  {
                                    return Container(
                                      height: 70,
                                      child: Card(
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                          child: ListTile(
                                            title: Container(
                                              child: Text(
                                                productMap['Name'],
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            leading: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                minWidth: 44,
                                                minHeight: 44,
                                                maxWidth: 64,
                                                maxHeight: 64,
                                              ),
                                              child: Image.network(
                                                productMap['image'],
                                                width: 100,
                                                height: 100,
                                              ),
                                            ),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [IconButton(icon: Icon(Icons.edit),
                                                onPressed: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditCategoryItem(
                                                    EditProductName: productMap['Name'],
                                                    EditProductImage: productMap['image'],
                                                    EditProductAllergyContained: productMap['contains'],
                                                    EditCategoryName: widget.detailsModel.title,
                                                    itemsLength: widget.itemsLength,
                                                    ProductListLength: widget.detailsModel.ProductList.length,
                                                    detailsModel: widget.detailsModel,
                                                    ImagesOfProducts: widget.ImagesOfProducts,
                                                    EditIngredients:  productMap['ingredients'],
                                                    categoryName: widget.categoryName ,
                                                    EditDescription: productMap['description'],
                                                    indexOfProduct: index,)));
                                                },),

                                                IconButton(icon: Icon(Icons.delete), onPressed: () {
                                                  _categoriesRef.child(productEntry.key!).remove();
                                                },)],
                                            ),
                                          )),
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
                )),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF16CD54),
        tooltip: 'Increment',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              AddNewCategoryItem(categoryName: widget.categoryName, itemsLength: widget.itemsLength, detailsModel: widget.detailsModel, ImagesOfProducts: widget.ImagesOfProducts,)));
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );




  }

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    ProductsLength();
  }
}
