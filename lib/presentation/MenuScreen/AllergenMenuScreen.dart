import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../mainScreen/MainScreen.dart';
import 'MenuScreen.dart';



class AllergenMenuScreen extends StatelessWidget {
  Model detailsModel;

  AllergenMenuScreen({Key? key, required this.detailsModel}) : super(key: key);



  final fb = FirebaseDatabase.instance.reference().child("Restaurants");

  List<Model> list = [];
  static List<String> Names = [];
  static List<String> Images = [];


  // final List<bool> _isFavorite = List.filled(items.length, false);

  @override
  Widget build(BuildContext context) {
    print("details model---");

    print(detailsModel.MenuList[0].dishName);
    print(detailsModel.MenuList[1].dishName);
    print(detailsModel.MenuList[2].dishName);

    return
      Scaffold(
        body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    child: Center(child: detailsModel.image),
                    margin: const EdgeInsets.only(left: 50.0),
                    height: 130,
                    width: 130,

                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30.0),
                    child: Text(detailsModel.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 30.0),
                child: Text("Allergens Menu",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              ),
              Align(
                alignment: Alignment.center,

              ),

          SizedBox(height: 20,),
              Container(
                height: 400,
                child: buildList(),
              ),


            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor:  Color(0xFF16CD54),
          leading:  IconButton(
            icon: Icon(Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  MainScreen(Current: 0, drawer: 1,)));
            },
          ),
          elevation: 0,
        ),
      );
  }

  //
  Widget buildList() =>
      ListView.builder(
          itemCount: detailsModel.MenuList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.fromLTRB(15, 0, 15, 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  detailsModel.MenuList[index].dishName,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Outfit"),
                ),
                subtitle: Text(detailsModel.MenuList[index].dishDetails,
                    style: const TextStyle(fontFamily: "Outfit")),
                leading: detailsModel.MenuList[index].dishImage,
                // trailing: IconButton(
                //   onPressed: () =>
                //       setState(() => _isFavorite[index] = !_isFavorite[index]),
                //   icon: _isFavorite[index]
                //       ? const Icon(Icons.favorite)
                //       : const Icon(Icons.favorite_border),
                // ),
                iconColor: Colors.red,
              ),
            );
          });
}
// Future<void> search(String text) async {
//
//   items.clear();
//   for (int i = 0; i < Names.length; i++) {
//     setState(() {
//       if (Names[i].contains(text)) {
//         items.add(new Model(
//             title: Names[i],
//             image: Image.network(
//               Images[i],
//               width: 150,
//               height: 150,
//             )));
//       }
//     });
//   }
// }

