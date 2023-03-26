import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewCategoryItem extends StatelessWidget {
   AddNewCategoryItem({Key? key}) : super(key: key);
   var WhichCategorySection = TextEditingController();
   var ProductName = TextEditingController();
   var Description = TextEditingController();
   var Ingredients= TextEditingController();
   var ProductAllergiesContained = TextEditingController();
   var ProductImage = TextEditingController();

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       resizeToAvoidBottomInset: false,
       appBar: AppBar(leading: Icon(Icons.arrow_back),
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
               Text("Category Section", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
               SizedBox(height: 10,),
               TextFormField(
                 controller: WhichCategorySection,
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
