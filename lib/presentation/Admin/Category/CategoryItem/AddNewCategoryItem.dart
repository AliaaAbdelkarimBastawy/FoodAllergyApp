import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/ProductsCounterGlobal.dart' as globalsProductsCounter;
import '../CategorySection/ShowCategory.dart';
import 'ShowProducts.dart';
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;

class AddNewCategoryItem extends StatefulWidget {


   var categoryName;
   List<String> ImagesOfProducts = [];
   var itemsLength;
   AdminCategoryModel detailsModel;
   AddNewCategoryItem({Key? key, required this.categoryName,
     required this.itemsLength,
     required this.detailsModel,
     required this.ImagesOfProducts}) : super(key: key);


   @override
  State<AddNewCategoryItem> createState() => _AddNewCategoryItemState();
}

class _AddNewCategoryItemState extends State<AddNewCategoryItem> {
   var WhichCategorySection = TextEditingController();

   var ProductName = TextEditingController();

   var Description = TextEditingController();

   var Ingredients= TextEditingController();

   var ProductAllergiesContained = TextEditingController();

   var ProductImage = TextEditingController();

   var itemsCounter = 1;

   DatabaseReference fb= LanguageGlobalByAdmin.isEnglish? FirebaseDatabase.instance.ref("Category") :
   FirebaseDatabase.instance.ref("CategoryArabic");


   Future<dynamic> getWhichCategorytToAddProductTo() async {
     final ref = FirebaseDatabase.instance.ref();
     var snapshotAddProduct;
     var snapshot;

     for (int i =0; i< widget.itemsLength; i++)
     {
           snapshotAddProduct = await ref.child('Category/Category$i/Name').get();


       if(widget.categoryName == snapshotAddProduct.value.toString())
       {
         int itemCount;
           snapshot = await ref.child('Category/Category$i/Items/ItemCounter/Counter').get();



         print("DishCounter");
         print(int.parse(snapshot.value.toString()));
         globalsProductsCounter.itemCounter = int.parse(snapshot.value.toString());
         itemCount = globalsProductsCounter.itemCounter;
         Map<String, String> products =
         {
           'Name' : ProductName.text,
           'image' : ProductImage.text,
           'contains' : ProductAllergiesContained.text,
           'ingredients' : Ingredients.text,
           'description' : Description.text,
         };

         widget.ImagesOfProducts.add(ProductImage.text);

         fb.child("Category$i/Items/Item$itemCount").set(products);
         print("ADD");
         print(itemCount);
         itemCount++;
         Map<String, String> count =
         {
           'Counter' : itemCount.toString(),
         };

         fb.child("Category$i/Items/ItemCounter").set(count);
         globalsProductsCounter.itemCounter ++;


         for(int j =0; j< globalsProductsCounter.CategoryList.length; j++)
         {
           if (widget.categoryName == globalsProductsCounter.CategoryList[j])
           {
             globalsProductsCounter.ProductsCounterList[j]++;
           }
         }
         widget.detailsModel.ProductList.add(AdminProductModel(ProductName: ProductName.text,
             contains: ProductAllergiesContained.text,
             description: Description.text,
             ProductImage: Image.network(ProductImage.text),
             ingredients: Ingredients.text));
       }
     }

   }
   Future<dynamic> getWhichCategorytToAddProductToArabic() async {
     final ref = FirebaseDatabase.instance.ref();
     var snapshotAddProduct;
     var snapshot;

     for (int i =0; i< widget.itemsLength; i++)
     {
       snapshotAddProduct = await ref.child('CategoryArabic/Category$i/Name').get();


       if(widget.categoryName == snapshotAddProduct.value.toString())
       {
         int itemCount;
         snapshot = await ref.child('CategoryArabic/Category$i/Items/ItemCounter/Counter').get();



         print("DishCounter");
         print(int.parse(snapshot.value.toString()));
         globalsProductsCounter.itemCounter = int.parse(snapshot.value.toString());
         itemCount = globalsProductsCounter.itemCounter;
         Map<String, String> products =
         {
           'Name' : ProductName.text,
           'image' : ProductImage.text,
           'contains' : ProductAllergiesContained.text,
           'ingredients' : Ingredients.text,
           'description' : Description.text,
         };

         widget.ImagesOfProducts.add(ProductImage.text);

         fb.child("Category$i/Items/Item$itemCount").set(products);
         print("ADD");
         print(itemCount);
         itemCount++;
         Map<String, String> count =
         {
           'Counter' : itemCount.toString(),
         };

         fb.child("Category$i/Items/ItemCounter").set(count);
         globalsProductsCounter.itemCounter ++;


         for(int j =0; j< globalsProductsCounter.CategoryList.length; j++)
         {
           if (widget.categoryName == globalsProductsCounter.CategoryList[j])
           {
             globalsProductsCounter.ProductsCounterList[j]++;
           }
         }
         widget.detailsModel.ProductList.add(AdminProductModel(ProductName: ProductName.text,
             contains: ProductAllergiesContained.text,
             description: Description.text,
             ProductImage: Image.network(ProductImage.text),
             ingredients: Ingredients.text));
       }
     }

   }


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       resizeToAvoidBottomInset: false,
       appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back),
         onPressed: ()
         {Navigator.push(context, MaterialPageRoute(builder: (context)=>
             ShowProducts(detailsModel: widget.detailsModel, itemsLength: widget.itemsLength, ImagesOfProducts: widget.ImagesOfProducts, categoryName: widget.categoryName, noOfCategory: 0,)));
         },),
         title: Text("Add New Product"),
         backgroundColor: Color(0xFF16CD54),

       ),
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
                 controller: ProductName,
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
                 controller:Description,
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
                 controller:Ingredients,
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
                 controller:ProductAllergiesContained,
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
                 controller: ProductImage,
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
                         getWhichCategorytToAddProductTo();
                       }
                     else
                       {
                         getWhichCategorytToAddProductToArabic();

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
       ),
     );
   }
}
