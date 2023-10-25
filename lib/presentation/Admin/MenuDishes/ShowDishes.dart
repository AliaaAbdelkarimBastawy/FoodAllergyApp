// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:graduationproject26_1/presentation/Admin/MenuDishes/AddNewDish.dart';
// import 'package:graduationproject26_1/presentation/Admin/MenuDishes/EditDish.dart';
// import 'package:graduationproject26_1/presentation/Admin/Restaurant/ShowRestaurant.dart';
// import 'package:graduationproject26_1/presentation/Admin/DishesCounterGlobal.dart' as globalsDishesCounter;
// import 'package:graduationproject26_1/presentation/Admin/Restaurant/globalsAdminRestaurant.dart' as globals;
// import 'package:graduationproject26_1/presentation/HomeScreen/globals.dart';
//
// class ShowDishes extends StatefulWidget {
//
//   int itemsLength;
//   AdminRestaurantModel detailsModel;
//   List<String> ImagesOfDishes = [];
//
//   ShowDishes({Key? key, required this.detailsModel, required this.itemsLength, required this.ImagesOfDishes}) : super(key: key);
//
//   static List<String> Names = [];
//   static List<String> Images = [];
//
//   @override
//   State<ShowDishes> createState() => _ShowDishesState();
// }
//
//
// class _ShowDishesState extends State<ShowDishes> {
//   int NoOfDishes =0;
//   List<List<AdminMenuModel>> MenuList3 = new List.generate(globals.loop, (i) => []);
//
//   final fb = FirebaseDatabase.instance.reference().child("Restaurants");
//
//   List<AdminRestaurantModel> list = [];
//
//   // final List<bool> _isFavorite = List.filled(items.length, false);
//   Future<dynamic> DishesLength() async {
//     for(int z=0; z< widget.detailsModel.MenuList.length; z++)
//     {
//       if (widget.detailsModel.MenuList[z].dishName == "null")
//       {
//         widget.detailsModel.MenuList.removeAt(z);
//       }
//     }
//     for(int j =0; j< globalsDishesCounter.RestaurantsList.length; j++)
//     {
//       if (widget.detailsModel.title == globalsDishesCounter.RestaurantsList[j])
//       {
//         NoOfDishes = globalsDishesCounter.DishesCounterList[j];
//       }
//     }
//
//   }
//
//
//
//   Future<dynamic> getWhichDishToDelete(int index) async {
//     int indexOfRes =1;
//     final ref = FirebaseDatabase.instance.ref();
//     var snapshotDelete1;
//     for (int i =0; i< items.length+globals.NoOfDeletedItems+20; i++)
//     {
//       snapshotDelete1 = await ref.child('Restaurants/Restaurant$i/Name').get();
//       if(widget.detailsModel.title == snapshotDelete1.value.toString())
//       {
//          globalsDishesCounter.indexOfRes = i;
//         break;
//       }
//     }
//
//     indexOfRes = globalsDishesCounter.indexOfRes;
//     var snapshotDelete;
//     for (int i =0; i< widget.detailsModel.MenuList.length+globalsDishesCounter.NoOfDeletedDishes+20; i++)
//     {
//
//       snapshotDelete  = await ref.child('Restaurants/Restaurant$indexOfRes/Menu/dish$i/Name').get();
//       if(widget.detailsModel.MenuList[index].dishName == snapshotDelete.value.toString())
//       {
//         fb.child('Restaurant$indexOfRes/Menu/dish$i').remove();
//         setState(() {
//           widget.detailsModel.MenuList.removeAt(index);
//           widget.ImagesOfDishes.removeAt(index);
//
//         });
//         break;
//       }
//
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Color(0xFF16CD54),
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_rounded,
//             color: Colors.white,
//           ), onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowRestaurant()));
//
//         },
//         ),      ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(10.0,10,10,0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Row(
//                 children: [
//                   Container(
//                     child: Center(
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(20),
//                           child: widget.detailsModel.image
//                       ),
//                     ),
//                     margin: const EdgeInsets.only(left: 20),
//                     height: 120,
//                     width: 120,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 1.0),
//                     child: Text(
//                         widget.detailsModel.title, //detailsModel.title,
//                         style:TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
//                   ),
//                 ],
//               ),
//               Center(
//                   child: Container(
//                       margin: EdgeInsets.only(right: 200,bottom: 4),
//                       child: Text(
//                         "Allergens Menu",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ))),
//               Container(
//                 margin: EdgeInsets.only(bottom: 20),
//                 child: SizedBox(
//                   height: 415,
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     child:buildList(),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Color(0xFF16CD54),
//         tooltip: 'Add',
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>
//               AddNewDish(RestaurantName: widget.detailsModel.title, itemsLength: widget.itemsLength,
//                 detailsModel: widget.detailsModel, ImagesOfDishes: widget.ImagesOfDishes,)));
//         },
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
//
//   Widget buildList() =>
//       ListView.builder(
//           itemCount: widget.detailsModel.MenuList.length,
//           itemBuilder: (context, index) {
//             return Container(
//               height: 70,
//               child: Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   child: ListTile(
//                     title: Container(
//                       child: Text(
//                         widget.detailsModel.MenuList[index].dishName,
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//
//                     // leading: items[index].image,
//                     leading: ConstrainedBox(
//                       constraints: BoxConstraints(
//                         minWidth: 44,
//                         minHeight: 44,
//                         maxWidth: 64,
//                         maxHeight: 64,
//                       ),
//                       child: widget.detailsModel.MenuList[index].dishImage,
//                     ),
//                     // leading: CircleAvatar(
//                     //     radius: 30,
//                     //     backgroundImage: items[index].image as ImageProvider),
//                     // NetworkImage(
//                     // Image.network('https://logos-download.com/wp-content/uploads/2016/03/KFC_Logo_2006.png')),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [IconButton(icon: Icon(Icons.edit),
//                         onPressed: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=> EditDish(
//                             EditDishName: widget.detailsModel.MenuList[index].dishName,
//                             EditDishImage: widget.ImagesOfDishes[index],
//                             EditDishAllergyContained: widget.detailsModel.MenuList[index].dishDetails,
//                             EditRestaurantName: widget.detailsModel.title, itemsLength: widget.itemsLength,
//                             MenuListLength: widget.detailsModel.MenuList.length, detailsModel: widget.detailsModel,
//                             ImagesOfDishes: widget.ImagesOfDishes,)));
//                         },),
//
//                         IconButton(icon: Icon(Icons.delete), onPressed: () {
//                           globalsDishesCounter.NoOfDeletedDishes++;
//                           getWhichDishToDelete(index);},)],
//                     ),
//                   )),
//             );
//           });
//
//   @override
//   void initState() {
//     print("LENNNNNN");
//     print(widget.detailsModel.MenuList.length);
//     // TODO: implement initState
//     super.initState();
//     DishesLength();
//   }
// }
