
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../data/homeScreen/homeScreenViewModel.dart';
import '../mainScreen/MainScreen.dart';
import 'KnowledgeDetails.dart';

class KnowledgeScreen extends StatefulWidget {
  const KnowledgeScreen({Key? key}) : super(key: key);

  @override
  State<KnowledgeScreen> createState() => _KnowledgeScreenState();
}
class Model {
  late final String title;
  final Image image;


  Model({
    required this.title,
    required this.image,
  });
}

class _KnowledgeScreenState extends State<KnowledgeScreen> {
  static final List<Model> items = [
    Model(
        title: "Milk Allergy ",

        image: Image.asset('Assets/Images/milkallergy.png', height: 221, width: 335)),
    Model(
        title: "Wheat Allergy",
        image:
        Image.asset('Assets/Images/wheatallergy.png', height: 221, width: 335)),
    Model(
        title: "Milk Allergy ",
        image: Image.asset('Assets/Images/milkallergy.png',
            height: 221, width: 335)),
    Model(
        title: "Wheat Allergy",
        image: Image.asset('Assets/Images/wheatallergy.png', height: 221, width: 335)),
    Model(
        title: "Milk Allergy ",
        image: Image.asset('Assets/Images/milkallergy.png', height: 221, width: 335)),
    Model(
        title: "Wheat Allergy",
        image: Image.asset('Assets/Images/wheatallergy.png', height: 221, width: 335)),
  ];

  int Current_Index = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void _onItemTapped(int index) {
    setState(() {
      Current_Index = index;
    });
  }
  /* appBar: AppBar(
  backgroundColor: Color(0xFF16CD54),
  title: Padding(
  padding: const EdgeInsets.only(left: 110.0),
  child: Text("Home"),
  ),*/


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xFF16CD54),
      leading: IconButton(
        icon: Icon(Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              MainScreen(Current: 0,)));
        },
      ),
      title: Padding(padding: EdgeInsets.only(left: 80),
      child: Text("Knowledge")),
      elevation: 0,
    ),
    body: Container(
      child: ListView(
        children: [
          Container(

            height: 603.5,

            child: buildList(),

          ),
        ],
      ),
    ),


  );

  Widget buildList() => GridView.builder(

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 5,
          crossAxisSpacing: 4,
          childAspectRatio: 2/1.26 ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(

          child: Card(
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            child: GridTile(


              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  items[index].image,
                  Padding(padding: const EdgeInsets.only(top: 10.0)),
                  Text(
                    items[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(

                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Outfit"),
                  ),
                ],
              ),
            ),
          ),
          onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>KnowledgeDetails()));},
        );;
      });
}