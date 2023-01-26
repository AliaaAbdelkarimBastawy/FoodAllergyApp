
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../TextRecognition/Main-TextRecognition_2.dart';
import 'BarcodeScanner.dart';
import 'NotSafe.dart';

class Safe extends StatelessWidget {
  Safe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF16CD54),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                Core_3()));
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),

        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 0, right:0, top: 60, bottom: 30), alignment: Alignment.center,


                    child: Image(image: AssetImage('Assets/Images/AllergyFree.png',
                    ),
                    )
                ),
                Container(
                  height: 44,
                  margin: const EdgeInsets.only(left: 100, right:100, ),
                  width: 150,
                  // width: double.infinity,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MaterialButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BarcodeScanner()));

                  },
                    child: Text("OK",
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