import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduationproject26_1/presentation/test/KnowledgeDetailsTest.dart';
import 'package:graduationproject26_1/presentation/test/KnowledgeDetailsTest_Admin.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/recipesDetails/recipes_Details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/test/recipeDetailsTest.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../mainScreen/MainScreen2.dart';
class MyKnowledge_Admin extends StatefulWidget {
  const MyKnowledge_Admin({Key? key}) : super(key: key);

  @override
  State<MyKnowledge_Admin> createState() => _MyKnowledgeState();
}

class Knowledge_Admin {
  String id;
  String Name;
  String Description;
  String Image;

  Knowledge_Admin({required this.id, required this.Name,
    required this.Description, required this.Image});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Name': Name,
      'Description': Description,
      'Image': Image,

    };
  }

  factory Knowledge_Admin.fromMap(Map<String, dynamic> map) {
    return Knowledge_Admin(
      Name: map['Name'],
      Description: map['Description'],
      Image: map['Image'],
      id: map['id'],
    );
  }
}
List<Knowledge_Admin> items = [];
List<Knowledge_Admin> itemsofSearch = [];

class _MyKnowledgeState extends State<MyKnowledge_Admin> {
  List<Knowledge_Admin> _knowledge = [];
  List<Knowledge_Admin> _knowledge2 = [];

  var SearchTextcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _syncData();
  }

  Future<void> _syncData() async {
    print("inFunction sync");
    // var snapshot = await _dbRef.get();
    DatabaseReference ref = FirebaseDatabase.instance.ref("Knowledge");
    // Get the data once
    DatabaseEvent event = await ref.once();
    // Print the data of the snapshot
    print(event.snapshot.value); // { "name": "John" }
    // snapshot  = await ref.child('Recipes/Recipe$i/Name').get();
    if (event.snapshot.value != null) {
      final data =event.snapshot.value as Map<dynamic, dynamic>;
      await _saveDataLocally(data);
      await _loadDataLocally();
    }
  }

  Future<void> _saveDataLocally(Map<dynamic, dynamic> data) async {
    print("inFunction _saveDataLocally");

    final _dbPath = await getDatabasesPath();
    final _db = await openDatabase(join(_dbPath, 'Knowledgedatabase3.db'), version:2,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE Knowledge (id TEXT PRIMARY KEY,Name TEXT, Description TEXT,Image TEXT)');
        });

    data.forEach((key, value) async {
      final user = Knowledge_Admin(
        id: key,
        Name: value['Name'],
        Description: value['Description'],
        Image: value['Image'],
      );

      await _db.insert('Knowledge', user.toMap());
    });
  }

  Future<void> _loadDataLocally() async {
    print("inFunction _loadDataLocally");

    final _dbPath = await getDatabasesPath();
    final _db = await openDatabase(join(_dbPath,'Knowledgedatabase3.db'), version: 2);

    final List<Map<String, dynamic>> data = await _db.query('Knowledge');

    setState(() {
      _knowledge = data.map((user) => Knowledge_Admin.fromMap(user)).toList();
      _knowledge2= data.map((user) => Knowledge_Admin.fromMap(user)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFF16CD54),
        title: Padding(
          padding: const EdgeInsets.only(left: 86.0),
          child: Text("Knowledge"),
        ),
        leading:  IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                MainScreen2(Current: 0,)));

          },
        ),
        elevation: 0,
      ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 50,
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    controller:SearchTextcontroller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.green),
                      hintText: 'Search Knowledge',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                    onChanged: (text) {
                      search(text);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 2, 8,2),
                  child: SizedBox(
                    height: 510,
                    child: Expanded(
                      child: Container(
                        child: GridView.builder(
                          itemBuilder: (context, index) {
                            final knowledge = _knowledge[index];
                            items.add(knowledge);
                            return  Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,4,8),
                              child: Material(
                                // elevation: 10,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context)=>
                                            MyKnowledgeDetails_Admin(detailsModel: items[index],)));
                                      },
                                      child: Container(
                                          margin: const EdgeInsets.only(top: 5.0),
                                          height: 160.0,
                                          width: 200.0,
                                          child: Card(
                                              elevation: 13,
                                              margin:EdgeInsets.fromLTRB(10, 0, 10, 0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
                                                    child: Center(
                                                      child: Image.network(
                                                        items[index].Image,
                                                        width: 100,
                                                        height: 100,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(4.0),
                                                    child: Text(
                                                      items[index].Name,
                                                      textAlign: TextAlign.center,
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w300,
                                                          fontFamily: "Outfit"),
                                                    ),
                                                  ),
                                                ],
                                              ))
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: _knowledge.length,
                          scrollDirection: Axis.vertical,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 2,
                              childAspectRatio: 1 / 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }


  Future<void> search(String text) async {
    _knowledge.clear();
    items.clear();
    for (int i = 0; i < _knowledge2.length; i++) {
      setState(() {
        if (_knowledge2[i].Name.contains(text)) {
          print("whichrecipe ?");
          print(_knowledge2[i].Name);
          _knowledge.add(_knowledge2[i]);
        }
      });
    }


  }
}
