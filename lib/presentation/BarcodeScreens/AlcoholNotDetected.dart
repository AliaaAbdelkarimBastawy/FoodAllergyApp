
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../Alcohol-TextRecognition/Main-TextRecognition.dart';
import 'BarcodeScanner.dart';
import 'Safe.dart';

class AlcoholNotDetected extends StatelessWidget {
  AlcoholNotDetected({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color(0xFF16CD54),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                CoreAlcohol()));
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Column(
              mainAxisAlignment:  MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 0, right:0, top: 60, bottom: 30), alignment: Alignment.center,
                    child: Image(image: AssetImage('Assets/Images/alcoholdetected.png',
                    ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.only(left: 50, right:50, ),
                  width: double.infinity,
                  height: 44,
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MaterialButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BarcodeScanner()));

                  },
                    child: Text("OK",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    color: Color(0xFF16CD54),
                  ),

                )

              ]

          ),
        ),
      ),
    );
  }
}