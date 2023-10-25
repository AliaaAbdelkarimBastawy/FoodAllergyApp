
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Alcohol-TextRecognition/Main-TextRecognition.dart';
import 'BarcodeScanner.dart';
import 'Safe.dart';

class AlcoholDetected extends StatelessWidget {
  AlcoholDetected({Key? key}) : super(key: key);
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
                    margin: const EdgeInsets.only(left: 0, right:0, top: 60, bottom: 25), alignment: Alignment.center,
                    child: Image(image: AssetImage('Assets/Images/alcohol.png',
                     ),)
                ),
                Center(child: Text("Alcohol Detected!".tr, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.red),)),
                SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.only(left: 100, right:100, ),
                  width: 150,
                  height: 44,
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MaterialButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BarcodeScanner()));

                  },
                    child: Text("OK".tr,
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