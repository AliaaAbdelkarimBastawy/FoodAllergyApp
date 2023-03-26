
import 'dart:ui';
import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Knowledge/AddNewKnowledge.dart';
import 'package:graduationproject26_1/presentation/Admin/Knowledge/EditKnowledge.dart';

import '../AdminHomePage/AdminHomePage.dart';

import 'globalsOfKnowledge.dart' as globals;

class ShowKnowledge extends StatefulWidget {

  const ShowKnowledge({Key? key}) : super(key: key);

  @override
  State<ShowKnowledge> createState() => _ShowKnowledgeState();
}

class KnowledgeModel {
  late final String Name;
  final Image image;
  String Description;

  KnowledgeModel(
      {required this.Name,
        required this.image,
      required this.Description});
}

class _ShowKnowledgeState extends State<ShowKnowledge> {


  final fb = FirebaseDatabase.instance.reference().child("Knowledge");

  static List<String> Names = [];
  static List<String> Images = [];
  static List<String> Descriptions = [];

  final List<KnowledgeModel> items = [];

  Future<dynamic> getCurrentUserInfo() async {
    items.clear();
    final ref = FirebaseDatabase.instance.ref();
    var snapshot;
    var snapshot2;
    var snapshot3;

    Names.clear();
    Images.clear();
    Descriptions.clear();

    for (int i = 1; i < 12; i++) {
      snapshot  = await ref.child('Knowledge/Knowledge$i/Name').get();
      snapshot2 = await ref.child('Knowledge/Knowledge$i/Image').get();
      snapshot3 = await ref.child('Knowledge/Knowledge$i/Description').get();

      if(snapshot.value.toString() != "null")
      {
        Names.add(snapshot.value.toString());
        Images.add(snapshot2.value.toString());
        Descriptions.add(snapshot3.value.toString());
      }


    }
    for (int i = 0; i < Names.length; i++) {
      setState(() {
        items.add(new KnowledgeModel(
          Name: Names[i],
          image: Image.network(
            Images[i],
            width: 100,
            height: 100,
          ), Description: Descriptions[i],));
        print("items" + items[0].Name);
      });
    }
    print(Names);
    print(Images);
  }

  Future<dynamic> getWhichKnowledgeToDelete(int index) async {
    final ref = FirebaseDatabase.instance.ref();
    var snapshotDelete;
    for (int i =0; i< items.length+globals.NoOfDeletedItems; i++)
    {

      snapshotDelete  = await ref.child('Knowledge/Knowledge$i/Name').get();
      if(items[index].Name == snapshotDelete.value.toString())
      {
        fb.child('Knowledge$i').remove();
        setState(() {
          items.removeAt(index);
        });
        break;
      }
    }
  }


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
                      "Knowledge",
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
                child: buildList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF16CD54),
        tooltip: 'Add',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              AddNewKnowledge()));
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Widget buildList() =>
      ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return  Container(
              height: 70,
              child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    title: Container(
                      child: Text(
                        items[index].Name,
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
                      child: items[index].image,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [IconButton(icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              EditKnowledge(
                                EditKnowledgeName: items[index].Name, EditKnowledgeImage:Images[index],
                                EditKnowledgeDescription: items[index].Description, itemsLength: items.length,  )));
                        },),
                        IconButton(icon: Icon(Icons.delete),
                          onPressed: () {
                            globals.NoOfDeletedItems++;
                            getWhichKnowledgeToDelete(index);

                          },)],
                    ),
                  )),
            );
          });

  @override
  void initState() {
    super.initState();
    getCurrentUserInfo();
  }
}
