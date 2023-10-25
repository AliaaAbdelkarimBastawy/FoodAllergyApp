import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Knowledge/ShowKnowledge.dart';
import 'globalsOfKnowledge.dart' as globals;
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;



class EditKnowledge extends StatelessWidget {

  String EditKnowledgeName;
  String EditKnowledgeImage;
  String EditKnowledgeDescription;
  int itemsLength;


  EditKnowledge({Key? key, required this.EditKnowledgeName, required this.EditKnowledgeImage,
    required this.EditKnowledgeDescription, required this.itemsLength}) : super(key: key);
   var KnowledgeTitle = TextEditingController();
   var KnowledgeDescription = TextEditingController();
   var KnowledgeImage = TextEditingController();



  final fb = LanguageGlobalByAdmin.isEnglish?
  FirebaseDatabase.instance.reference().child("Knowledge")
      : FirebaseDatabase.instance.reference().child("KnowledgeArabic");

  Future<dynamic> getWhichKnowledgeToUpdate() async {

    final ref = FirebaseDatabase.instance.ref();
    var snapshotUpdate;
    for (int i =0; i< (4*itemsLength); i++)
    {
      snapshotUpdate =await ref.child('Knowledge/Knowledge$i/Name').get();
      print(snapshotUpdate.value.toString());
      if(EditKnowledgeName== snapshotUpdate.value.toString())
      {
        print("IN EL IF CONDITION");
        Map<String, String> UpdateKnowledge =
        {
          'Name' : KnowledgeTitle.text,
          'Image' : KnowledgeImage.text,
          'Description': KnowledgeDescription.text,

        };
        print("Abl el updating");
        fb.child("Knowledge$i").set(UpdateKnowledge);
        EditKnowledgeName = KnowledgeTitle.text;
        EditKnowledgeImage = KnowledgeImage.text;
        EditKnowledgeDescription = KnowledgeDescription.text;

      }
      else
      {
        print("Ana in Else?");

      }


    }

  }

  Future<dynamic> getWhichKnowledgeToUpdateArabic() async {

    final ref = FirebaseDatabase.instance.ref();
    var snapshotUpdate;
    for (int i =0; i< (4*itemsLength); i++)
    {
      snapshotUpdate =await ref.child('KnowledgeArabic/Knowledge$i/Name').get();
      print(snapshotUpdate.value.toString());
      if(EditKnowledgeName== snapshotUpdate.value.toString())
      {
        print("IN EL IF CONDITION");
        Map<String, String> UpdateKnowledge =
        {
          'Name' : KnowledgeTitle.text,
          'Image' : KnowledgeImage.text,
          'Description': KnowledgeDescription.text,

        };
        print("Abl el updating");
        fb.child("Knowledge$i").set(UpdateKnowledge);
        EditKnowledgeName = KnowledgeTitle.text;
        EditKnowledgeImage = KnowledgeImage.text;
        EditKnowledgeDescription = KnowledgeDescription.text;

      }
      else
      {
        print("Ana in Else?");

      }


    }

  }

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
           Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowKnowledge()));

         },
         ),
         title: const Text("Edit Knowledge"),
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
               controller: KnowledgeTitle ..text = EditKnowledgeName,
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
               controller: KnowledgeDescription ..text = EditKnowledgeDescription.replaceAll('\\n', '.'),
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
               controller: KnowledgeImage ..text= EditKnowledgeImage,
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
                   print("Pressed");
                   if(LanguageGlobalByAdmin.isEnglish == true)
                     {
                       getWhichKnowledgeToUpdate();

                     }
                   else {
                     getWhichKnowledgeToUpdateArabic();

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
     );
   }
}
