import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Knowledge/ShowKnowledge.dart';
import 'package:graduationproject26_1/presentation/test/KnowledgeTest.dart';
import 'package:graduationproject26_1/presentation/test/KnowledgeTest_Admin.dart';


class KnowledgeDetailsForAdminPanel extends StatelessWidget {

  String KnowledgeDescription;
  String KnowledgeImage;
  String KnowledgeTitle;


  KnowledgeDetailsForAdminPanel({Key? key, required this.KnowledgeDescription, required this.KnowledgeImage, required this.KnowledgeTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF16CD54),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                ShowKnowledge()));

          },
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding( padding: EdgeInsets.only(left:40, right:40, top: 20 ),
            child:
            Material(
              elevation: 10,
              child: Container(
                width: double.infinity,
                height: 60,
                child: Center(
                  child: Text(KnowledgeTitle,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Outfit"),
                  ),
                ),
              ),
            ),),
          Padding(padding: const EdgeInsets.only(top: 20.0),
            child:Image.network(KnowledgeImage,width: 150,
              height: 150,),
          ),
          Padding( padding: EdgeInsets.only(left:40, right:40, top: 20 ),
            child:
            Text(KnowledgeDescription,

              textAlign: TextAlign.left,
              style: const TextStyle(

                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Outfit"),
            ),
          )
        ],
      ),
    );
  }
}
