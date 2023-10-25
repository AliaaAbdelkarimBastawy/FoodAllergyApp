import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globalAdminCategory.dart' as globals;
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;

import '../CategorySection/ShowCategory.dart';
import 'ShowProducts.dart';

class EditCategoryItem extends StatelessWidget {

  int indexOfProduct;
  String EditProductName;
  String EditProductImage;
  String EditProductAllergyContained;
  String EditCategoryName;
  String EditDescription;
  String EditIngredients;
  String categoryName;
  int itemsLength;
  int ProductListLength;
  AdminCategoryModel detailsModel;
  List<String> ImagesOfProducts = [];

  EditCategoryItem({Key? key, required this.EditCategoryName, required this.indexOfProduct,
    required this.EditProductName,
    required this.ProductListLength,
    required this.itemsLength,
    required this.EditProductImage,
    required this.EditProductAllergyContained,
    required this.detailsModel,
    required this.ImagesOfProducts,
    required this.EditIngredients,
    required this.categoryName,
    required this.EditDescription}) : super(key: key);

   var ProductName = TextEditingController();

   var Description = TextEditingController();

   var Ingredients= TextEditingController();

   var ProductAllergiesContained = TextEditingController();

   var ProductImage = TextEditingController();

  var categoryNo = 0;

  DatabaseReference fb= LanguageGlobalByAdmin.isEnglish? FirebaseDatabase.instance.ref("Category") :
  FirebaseDatabase.instance.ref("CategoryArabic");
  int forLoop = 5;

  int CategoryIndex =0;

  List<AdminCategoryModel> CategoryList = [];

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
    }

  }
  Future<dynamic> getWhichProductToUpdate() async {

    getCurrentUserInfo();
    final ref = FirebaseDatabase.instance.ref();
    var snapshotUpdate;
    if(categoryName == "Bakery")
      {
        categoryNo= 1;

      }
    else if(categoryName == "Milk")
      {
        categoryNo= 2;

      }

    else if(categoryName == "Protein")
    {
      categoryNo= 3;

    }

    else if(categoryName == "Snacks")
    {
      categoryNo= 4;
    }

        for (int i =0; i<(4*itemsLength); i++)
        {
          snapshotUpdate =await ref.child('Category/Category$categoryNo/Items/Item$i/Name').get();
          print(snapshotUpdate.value.toString());
          if(EditProductName== snapshotUpdate.value.toString())
          {
            print("IN EL IF CONDITION");
            Map<String, String> UpdateProduct =
            {
              'Name' : ProductName.text,
              'image' : ProductImage.text,
              'contains': ProductAllergiesContained.text,
              'description': Description.text.replaceAll('.', '\\n'),
              'ingredients':Ingredients.text.replaceAll('.', '\\n'),

            };
            fb.child("Category$categoryNo/Items/Item$i").set(UpdateProduct);

            EditProductName = ProductName.text;
            EditProductImage = ProductImage.text;
            EditProductAllergyContained = ProductAllergiesContained.text;
            EditIngredients = Ingredients.text;
            EditDescription = Description.text;

            detailsModel.ProductList[indexOfProduct].ProductName = EditProductName;
            detailsModel.ProductList[indexOfProduct].ProductImage = Image.network(EditProductImage);
            detailsModel.ProductList[indexOfProduct].contains= EditProductAllergyContained;
            detailsModel.ProductList[indexOfProduct].ingredients = EditIngredients;
            detailsModel.ProductList[indexOfProduct].description = EditDescription;

          }
          else
          {
            print("Else Part");

          }

        }




  }
  Future<dynamic> getWhichProductToUpdateArabic() async {

    getCurrentUserInfoArabic();
    final ref = FirebaseDatabase.instance.ref();
    var snapshotUpdate;
    if(categoryName == "مخبز")
    {
      categoryNo= 1;

    }
    else if(categoryName == "حليب")
    {
      categoryNo= 2;

    }

    else if(categoryName == "بروتين")
    {
      categoryNo= 3;

    }

    else if(categoryName == "وجبات خفيفة")
    {
      categoryNo= 4;
    }

    for (int i =0; i<(4*itemsLength); i++)
    {
      snapshotUpdate =await ref.child('CategoryArabic/Category$categoryNo/Items/Item$i/Name').get();
      print(snapshotUpdate.value.toString());
      if(EditProductName== snapshotUpdate.value.toString())
      {
        print("IN EL IF CONDITION");
        Map<String, String> UpdateProduct =
        {
          'Name' : ProductName.text,
          'image' : ProductImage.text,
          'contains': ProductAllergiesContained.text,
          'description': Description.text.replaceAll('.', '\\n'),
          'ingredients':Ingredients.text.replaceAll('.', '\\n'),

        };
        fb.child("Category$categoryNo/Items/Item$i").set(UpdateProduct);

        EditProductName = ProductName.text;
        EditProductImage = ProductImage.text;
        EditProductAllergyContained = ProductAllergiesContained.text;
        EditIngredients = Ingredients.text;
        EditDescription = Description.text;

        detailsModel.ProductList[indexOfProduct].ProductName = EditProductName;
        detailsModel.ProductList[indexOfProduct].ProductImage = Image.network(EditProductImage);
        detailsModel.ProductList[indexOfProduct].contains= EditProductAllergyContained;
        detailsModel.ProductList[indexOfProduct].ingredients = EditIngredients;
        detailsModel.ProductList[indexOfProduct].description = EditDescription;

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
         elevation: 0,
         title: Text("Edit Product"),
         backgroundColor: Color(0xFF16CD54),
         leading: IconButton(
           icon: Icon(
             Icons.arrow_back_rounded,
             color: Colors.white,
           ), onPressed: () {

           Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowProducts(
               detailsModel: detailsModel,
               itemsLength: itemsLength,
               ImagesOfProducts: ImagesOfProducts,
               categoryName: categoryName, noOfCategory: 0, )));
         },
         ),      ),
       body: Padding(
         padding: const EdgeInsets.all(20.0),
         child: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [

               SizedBox(height: 15,),
               Text("Product Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
               SizedBox(height: 10,),
               TextFormField(
                 controller: ProductName ..text =EditProductName,
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
                 // maxLines: 5,
                 // minLines: 3,
               ),
               SizedBox(height: 15,),
               Text("Description", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
               SizedBox(height: 10,),
               TextFormField(
                 controller:Description ..text= EditDescription.replaceAll('\\n','.' ),
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
               Text("Ingredients", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
               SizedBox(height: 10,),
               TextFormField(
                 controller:Ingredients ..text= EditIngredients.replaceAll('\\n','.' ),
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
               Text("Allergy Contained", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
               SizedBox(height: 10,),
               TextFormField(
                 controller:ProductAllergiesContained ..text= EditProductAllergyContained,
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
               Text("Product Image", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
               SizedBox(height: 10,),
               TextFormField(
                 controller: ProductImage ..text= EditProductImage,
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
                         getWhichProductToUpdate();
                       }
                     else
                       {
                         getWhichProductToUpdateArabic();

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
       ),
     );
   }
}
