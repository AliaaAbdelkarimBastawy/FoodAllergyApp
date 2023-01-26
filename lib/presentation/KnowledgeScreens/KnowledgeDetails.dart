import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'KnowledgeScreen.dart';

class KnowledgeDetails extends StatelessWidget {
  KnowledgeDetails({Key? key}) : super(key: key);

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
                KnowledgeScreen()));
          },
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 20.0),
            child:
            Image (image: AssetImage('Assets/Images/milkallergy.png'),
              alignment: Alignment.center,
            ),
          ),

          Padding( padding: EdgeInsets.only(left:40, right:40, top: 20 ),
            child:
            Text("Milk allergy is a typical immune system response to milk and products containing milk. It's one of the most common food allergies in children. Cow's milk is the usual cause of milk allergy, but milk from sheep, goats, buffalo and other mammals also can cause a reaction.",

              textAlign: TextAlign.left,
              style: const TextStyle(

                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Outfit"),
            ),
          )
        ],
      ),
    );
  }
}