
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'NotSafe.dart';

class ScanTheBarcode extends StatelessWidget {
  ScanTheBarcode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          color: Colors.black,
          Icons.arrow_back,
          size: 30,
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

                  margin: const EdgeInsets.only(top: 40, bottom: 0),
                  height: 45,
                  width: 450,
                  // width: double.infinity,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MaterialButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> NotSafe()));

                  },
                    child: Text("Scan the barcode",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF1FCA4F),
                        fontWeight: FontWeight.bold,



                      ),
                    ),
                    color: Colors.white70,
                  ),

                ),
                Container(
                    margin: const EdgeInsets.only(left: 0, right:0, top: 40, bottom: 25), alignment: Alignment.center,



                    child: Image(image: AssetImage('Assets/Images/detectAlcohol.png',
                    ),
                    )

                )

              ]

          ),
        ),
      ),




    );
  }
}