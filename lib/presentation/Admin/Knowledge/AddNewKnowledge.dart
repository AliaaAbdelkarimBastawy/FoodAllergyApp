import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Knowledge/ShowKnowledge.dart';
import 'package:graduationproject26_1/presentation/Admin/DishesCounterGlobal.dart' as globalsDishesCounter;

class AddNewKnowledge extends StatelessWidget {
   AddNewKnowledge({Key? key}) : super(key: key);
   var KnowledgeTitle = TextEditingController();
   var KnowledgeDescription = TextEditingController();
   var KnowledgeImage = TextEditingController();

   final fb = FirebaseDatabase.instance.reference().child("Knowledge");

   Future<dynamic> AddKnowledge() async {
     final ref = FirebaseDatabase.instance.ref();
     var snapshot;
     int KnowledgeCount;
     snapshot = await ref.child('Knowledge/KnowledgeCounter/Counter').get();
     globalsDishesCounter.KnowledgeCounter= int.parse(snapshot.value.toString());
     KnowledgeCount =  globalsDishesCounter.KnowledgeCounter;

     Map<String, String> knowledge =
     {
       'Name' : KnowledgeTitle.text,
       'Image' : KnowledgeImage.text,
       'Description': KnowledgeDescription.text,

     };

     fb.child("Knowledge$KnowledgeCount").set(knowledge);

     KnowledgeCount++;

     print(KnowledgeCount);
     Map<String, String> count =
     {
       'Counter' : KnowledgeCount.toString(),
     };

     fb.child("KnowledgeCounter").set(count);
     globalsDishesCounter.KnowledgeCounter++;
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       resizeToAvoidBottomInset: false,
       appBar: AppBar(
         leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: ()

         {Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowKnowledge()));
         },),
         title: const Text("Add New Knowledge"),
         backgroundColor: const Color(0xFF16CD54),

       ),
       body: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 15,),
             Text("Knowledge Title", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
             SizedBox(height: 10,),
             TextFormField(
               controller: KnowledgeTitle,
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
             Text("Description", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
             SizedBox(height: 10,),
             TextFormField(
               controller: KnowledgeDescription,
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
             Text("Knowledge Image", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
             SizedBox(height: 10,),
             TextFormField(
               controller: KnowledgeImage,
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
                   AddKnowledge();
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
     );
   }
}
