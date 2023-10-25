// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:graduationproject26_1/presentation/Admin/Restaurant/EditRestaurant.dart';
// import 'package:graduationproject26_1/presentation/Admin/Restaurant/RestaurantDetailsForAdminPanel.dart';
//
// class RestaurantListScreen extends StatefulWidget {
//   @override
//   _RestaurantListScreenState createState() => _RestaurantListScreenState();
// }
//
// class _RestaurantListScreenState extends State<RestaurantListScreen> {
//   final DatabaseReference _restaurantsRef =
//   FirebaseDatabase.instance.reference().child('Restaurants');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Restaurant List2'),
//       ),
//       body: StreamBuilder(
//         stream: _restaurantsRef.onValue,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData && snapshot.data?.snapshot.value != null) {
//             Map<dynamic, dynamic> values =
//             snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
//             List<dynamic> restaurantList = values.values.toList();
//             return ListView.builder(
//               itemCount: restaurantList.length,
//               itemBuilder: (BuildContext context, int index) {
//
//                 MapEntry<dynamic, dynamic> restaurantEntry =
//                 values.entries.elementAt(index);
//                 Map<dynamic, dynamic> restaurantMap =
//                 restaurantEntry.value as Map<dynamic, dynamic>;
//                 // Map<dynamic, dynamic> recipeMap =
//                 // recipeList[index] as Map<dynamic, dynamic>;
//                 if(restaurantMap['Name'].toString() == "null")
//                 {
//                   print("namenull?");
//                   print(restaurantMap['Name'] );
//                   return Text("");
//                 }
//                 else
//                 {
//                   print("name?");
//                   print(restaurantMap['Name'] );
//                   return
//                     Container(
//                       height: 70,
//                       child: GestureDetector(
//                         onTap: ()
//                         {
//                           print("In dishes");
//                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
//                               RestaurantDetailsForAdminPanel(index: index,)));
//                         },
//                         child: Card(
//                             elevation: 4,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                             ),
//                             child: ListTile(
//                               title: Container(
//                                 child: Text(
//                                   restaurantMap['Name'],
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//
//                               // leading: items[index].image,
//                               leading: ConstrainedBox(
//                                 constraints: BoxConstraints(
//                                   minWidth: 44,
//                                   minHeight: 44,
//                                   maxWidth: 64,
//                                   maxHeight: 64,
//                                 ),
//                                 child: Image.network(
//                                   restaurantMap['image'],
//                                   width: 100,
//                                   height: 100,
//                                 ),
//                               ),
//                               trailing: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [IconButton(icon: Icon(Icons.edit),
//                                   onPressed: () {
//                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>
//                                         EditRestaurant(
//                                           itemsLength: restaurantList.length,
//                                           EditRestaurantName: restaurantMap['Name'],
//                                           EditRestaurantImage: restaurantMap['image'],
//                                         )));
//                                   },),
//                                   IconButton(icon: Icon(Icons.delete),
//                                     onPressed: () {
//                                       _restaurantsRef.child(restaurantEntry.key!).remove();
//                                     },)],
//                               ),
//                             )),
//                       ),
//                     );
//
//                 }
//
//               },
//             );
//
//
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error retrieving recipe data'),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//
//     );
//   }
//
// }