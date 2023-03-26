import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategorySection/AddNewCategorySection.dart';

import '../../AdminHomePage/AdminHomePage.dart';

class ShowCategory extends StatefulWidget {
  const ShowCategory({Key? key}) : super(key: key);

  @override
  State<ShowCategory> createState() => _ShowCategoryState();
}

class _ShowCategoryState extends State<ShowCategory> {
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
                      "Categories",
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
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      //height: 100,
                      //padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 75,
                        child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(5),
                              title: Text(
                                "Milk",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                AssetImage('Assets/Images/milk.png'),
                              ),
                              //Image.network('https://seeklogo.com/images/B/Burger_King-logo-EB00FAD8D3-seeklogo.com.png'),
                              trailing: Container(
                                margin: EdgeInsets.only(right: 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [Icon(Icons.edit), Icon(Icons.delete)],
                                ),
                              ),
                            )),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      //height: 100,
                      //padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 75,
                        child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(5),
                              title: Text(
                                "Bakery",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                AssetImage('Assets/Images/bakery.png'),
                              ),
                              //Image.network('https://seeklogo.com/images/B/Burger_King-logo-EB00FAD8D3-seeklogo.com.png'),
                              trailing: Container(
                                margin: EdgeInsets.only(right: 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [Icon(Icons.edit), Icon(Icons.delete)],
                                ),
                              ),
                            )),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      //height: 100,
                      //padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 75,
                        child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(5),
                              title: Text(
                                "Protein",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                AssetImage('Assets/Images/protein.png'),
                              ),
                              //Image.network('https://seeklogo.com/images/B/Burger_King-logo-EB00FAD8D3-seeklogo.com.png'),
                              trailing: Container(
                                margin: EdgeInsets.only(right: 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [Icon(Icons.edit), Icon(Icons.delete)],
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
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
              AddNewCategorySection()));
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
