
import 'dart:ui';
import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Knowledge/AddNewKnowledge.dart';
import 'package:graduationproject26_1/presentation/Admin/Knowledge/EditKnowledge.dart';
import '../../test/KnowledgeDetailsTest_Admin.dart';
import '../AdminHomePage/AdminHomePage.dart';

import 'KnowledgeDetailsForAdminPanel.dart';
import 'globalsOfKnowledge.dart' as globals;
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;

class ShowKnowledge extends StatefulWidget {

  const ShowKnowledge({Key? key}) : super(key: key);

  @override
  State<ShowKnowledge> createState() => _ShowKnowledgeState();
}


class _ShowKnowledgeState extends State<ShowKnowledge> {



  final DatabaseReference _knowledgeRef = LanguageGlobalByAdmin.isEnglish?
  FirebaseDatabase.instance.reference().child('Knowledge'):
  FirebaseDatabase.instance.reference().child('KnowledgeArabic')
  ;

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
                child: StreamBuilder(
                  stream: _knowledgeRef.onValue,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData && snapshot.data?.snapshot.value != null) {
                      Map<dynamic, dynamic> values =
                      snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                      List<dynamic> knowledgeList = values.values.toList();
                      return ListView.builder(
                        itemCount: knowledgeList.length,
                        itemBuilder: (BuildContext context, int index) {

                          MapEntry<dynamic, dynamic> recipeEntry =
                          values.entries.elementAt(index);
                          Map<dynamic, dynamic> knowledgeMap =
                          recipeEntry.value as Map<dynamic, dynamic>;

                          if(knowledgeMap['Name'].toString() == "null")
                          {
                            print("namenull?");
                            print(knowledgeMap['Name'] );
                            return Text("");
                          }
                          else
                          {
                            print("name?");
                            print(knowledgeMap['Name'] );
                            return
                              Container(
                                height: 70,
                                child: GestureDetector(
                                  onTap: ()
                                  {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                        KnowledgeDetailsForAdminPanel(KnowledgeDescription: knowledgeMap['Description'],
                                          KnowledgeTitle: knowledgeMap['Name'],
                                          KnowledgeImage: knowledgeMap['Image'],)));
                                  },
                                  child: Card(
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child: ListTile(
                                        title: Container(
                                          child: Text(
                                            knowledgeMap['Name'],
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
                                            knowledgeMap['Image'],
                                            width: 100,
                                            height: 100,
                                          ),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [IconButton(icon: Icon(Icons.edit),
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                                  EditKnowledge(
                                                    itemsLength: knowledgeList.length,
                                                    EditKnowledgeName: knowledgeMap['Name'],
                                                    EditKnowledgeImage: knowledgeMap['Image'],
                                                    EditKnowledgeDescription: knowledgeMap['Description'],

                                                  )));
                                            },),
                                            IconButton(icon: Icon(Icons.delete),
                                              onPressed: () {
                                                _knowledgeRef.child(recipeEntry.key!).remove();
                                              },)],
                                        ),
                                      )),
                                ),
                              );

                          }

                        },
                      );


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

  @override
  void initState() {
    super.initState();
  }
}
