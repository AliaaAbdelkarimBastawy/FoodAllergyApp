
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import '../../Alcohol-TextRecognition/Main-TextRecognition.dart';
import '../CategoriesScreen/CategoriesScreen.dart';
import '../HomeScreen/HomeScreen.dart';
import '../TextRecognition/Main-TextRecognition_2.dart';
import '../mainScreen/MainScreen.dart';


class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({Key? key}) : super(key: key);

  @override
  State<BarcodeScanner> createState() => _BarcodeScannerState();
}
class Model4 {
  late final String title;
  final Image image;


  Model4({
    required this.title,
    required this.image,
  });
}


class _BarcodeScannerState extends State<BarcodeScanner> {
  static final List<Model4> items = [
    Model4(
        title: "Alcohol Detection",
        image: Image.asset(
            'Assets/Images/alcohol.png', height: 130, width: 130)),
    Model4(
        title: "Allergy Detection",
        image:
        Image.asset('Assets/Images/nutsss.jpg', height: 130, width: 130)),

  ];

  int Current_Index = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void tapped(int index){
    setState(() {
      Current_Index = index;
    });
    if(index == 0){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CoreAlcohol()));
    } else if (index == 1) {
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => Core_3()));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      Current_Index = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF16CD54),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                MainScreen(Current: 0)));
          },
        ),
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 20),
              child: Text("Check on it!",
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,

                  )),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.circle_rounded,
                    color: Colors.red,
                    size: 37,
                  ),
                  SizedBox(width: 10,),
                  Text("What do you want to detect?",
                      textAlign: TextAlign.left,
                      style:
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      )
                  )
                ],
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
            ),

            Container(
              height: 480,
              child: buildList(context),
            ),
            Wrap(
              alignment: WrapAlignment.center,
            ),



          ],

        ),


      ),

    );
  }

  Widget buildList(BuildContext context) {
    return Scaffold(
      body:Container(
        child: GridView.builder(

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

            crossAxisCount: 2,
            mainAxisSpacing: 3,
            crossAxisSpacing: 2,
            childAspectRatio: 1 / 1),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(

            child: Card(

              borderOnForeground: false,
              surfaceTintColor: Colors.transparent,
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),

              child: GridTile(

                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,



                  children: [

                    items[index].image,

                    Text(
                      items[index].title,

                      textAlign: TextAlign.center,

                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Outfit"),

                    ),
                  ],
                ),
              ),
              ),

            onTap: () => tapped(index),

            /*onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScanAllergy()));
            },*/
          );;
        }),
      ),
    );
  }
}