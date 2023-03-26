import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/AdminHomePage/AdminHomePage.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategorySection/ShowCategory.dart';

class ShowProducts extends StatefulWidget {
  const ShowProducts({Key? key}) : super(key: key);

  @override
  State<ShowProducts> createState() => _ShowProductsState();
}


class ModelCategory {
  late final String Name;
  final Image image;
  final String description;
  final String containedOf;

  ModelCategory({
    required this.Name,
    required this.image,
    required this.description,
    required this.containedOf
  });


}

class _ShowProductsState extends State<ShowProducts> {
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowCategory()));

        },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Container(
                    margin: EdgeInsets.fromLTRB(0,10,0,5),
                    child: Text(
                      "Milk",
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
                      height: 70,
                      //padding: const EdgeInsets.all(10),
                      child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ListTile(
                            title: Text(
                              "Lactel",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                              AssetImage('Assets/Images/milk.png'),
                            ),
                            //Image.network('https://seeklogo.com/images/B/Burger_King-logo-EB00FAD8D3-seeklogo.com.png'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [Icon(Icons.edit), Icon(Icons.delete)],
                            ),
                          )),
                    ),
                    Container(
                      height: 70,
                      child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ListTile(
                            title: Container(
                              width: 20,
                              child: Text(
                                "Juhayna",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('Assets/Images/milk.png')),
                            //NetworkImage('https://www.logodesignlove.com/images/monograms/subway-monogram-01.jpg')),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [Icon(Icons.edit), Icon(Icons.delete)],
                            ),
                          )),
                    ),
                    Container(
                      height: 70,
                      child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ListTile(
                            title: Text(
                              "Lamar",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('Assets/Images/milk.png')),
                            //NetworkImage(
                            //Image.network('https://logos-download.com/wp-content/uploads/2016/03/KFC_Logo_2006.png')),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [Icon(Icons.edit), Icon(Icons.delete)],
                            ),
                          )),
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
        tooltip: 'Increment',
        onPressed: () {},
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
