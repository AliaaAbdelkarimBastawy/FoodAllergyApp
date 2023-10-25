
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/CategoriesScreen/CategoriesScreen.dart';
import 'package:graduationproject26_1/presentation/mainScreen/MainScreen.dart';
import 'package:graduationproject26_1/presentation/mainScreen/MainScreen2.dart';
import 'presentation/CategoriesScreen/globals.dart' as globals;
import 'presentation/Admin/AdminHomePage/globals.dart' as AdminGlobals;

class Product_details extends StatelessWidget {
  final ModelCategory detailsModel;

  Product_details({Key? key, required this.detailsModel}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
          color: Colors.white,
          child: Column(children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  height: 160.0,
                  width: 175.0,
                  child: Card(
                      elevation: 13,
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(child: detailsModel.image))),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 20.0, top: 15),
                child: Text(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    detailsModel.Name),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 72.0,
                width: 360.0,
                margin: const EdgeInsets.only(left: 25.0, top: 5, bottom: 5),
                child: Text(
                    style: TextStyle(
                        color: Color.fromRGBO(131, 131, 131, 0.8),
                        fontSize: 15),
                    detailsModel.description),
              ),

            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 20.0),
                child:  Text(
                  'Ingredients',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(54, 175, 56, 0.8)),
                ),
              ),
            ),
            Container(
              height: 72.0,
              width: 360.0,
              margin: const EdgeInsets.only(left: 25.0, top: 5, bottom: 5),
              child: Text(
                  style: TextStyle(
                      color: Color.fromRGBO(131, 131, 131, 0.8),
                      fontSize: 15),
                  detailsModel.ingredients),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 5.0),
                height: 80.0,
                width: 375.0,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(202, 202, 202, 0.8),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Column(children: [
                  Row(children: [
                    Container(
                      margin: const EdgeInsets.only(left: 12.0, top: 15.0),
                      height: 45.0,
                      width: 45.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets_hadir/shield.png'),
                          //  fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10,10,0,0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                   Container(
                                child: Text('Contains',
                                    style: TextStyle(
                                        color: Color.fromRGBO(38, 189, 21, 0.8),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22)),
                              ),
                          Container(
                                margin: const EdgeInsets.only(left: 0.0),
                                child: Flexible(
                                  child: Text(
                                    overflow: TextOverflow.visible,
                                    detailsModel.containedOf,
                                    style: TextStyle(
                                        color: Color.fromRGBO(131, 131, 131, 0.8),
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                        ],
                      ),
                    )
                  ])
                ])),
          ]),
        ),
        appBar: AppBar(
          backgroundColor:  Color(0xFF16CD54),
          leading:  IconButton(
            icon: Icon(Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: (){
              if(globals.fromUser == 1) {
                if(AdminGlobals.WhichMainScreen2 ==1)
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MainScreen2(Current: 0)));
                }
                else
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MainScreen(Current: 0, drawer: true,)));
                }


              }

              else if(globals.fromUser ==2)
              {
                if(AdminGlobals.WhichMainScreen2 ==1)
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MainScreen2(Current: 3)));
                }
                else
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      MainScreen(Current: 3, drawer: true,)));
                }

              }


            },
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
