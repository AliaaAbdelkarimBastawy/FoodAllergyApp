import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategorySection/ShowCategory.dart';
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;

import '../../AdminHomePage/AdminHomePage.dart';

class EditCategorySection extends StatelessWidget {
   EditCategorySection({Key? key}) : super(key: key);
   var CategorySectionName = TextEditingController();
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       resizeToAvoidBottomInset: false,
       appBar: AppBar(
         leading: IconButton(
           icon: Icon(
             Icons.arrow_back_rounded,
             color: Colors.white,
           ), onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowCategory()));

         },
         ),         title: Text("Edit Category Section"),
         backgroundColor: Color(0xFF16CD54),
       ),
       body: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 15,),
             Text("Category Section Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
             SizedBox(height: 10,),
             TextFormField(
               controller: CategorySectionName ..text='Bakery',
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
                 child: Text("Update",
                   style: TextStyle(
                     fontSize: 18,
                     color: Colors.white,),),
                 color: Color(0xFF16CD54),),),
             SizedBox(height: 30,),
           ],
         ),
       ),
     );
   }
}
