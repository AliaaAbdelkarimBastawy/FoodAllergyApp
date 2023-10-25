import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../BarcodeScreens/BarcodeScanner.dart';
import '../BarcodeScreens/NotSafe.dart';
import '../BarcodeScreens/Safe.dart';
import '../SelectAllergyScreen/SelectAlleryScreen.dart';
import 'home.notifer_2.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
          child: Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text:  TextSpan(
                    text: "Detect Allergy!".tr,
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 130,
                  child: Image.asset('Assets/Images/someallergies.png', width: 300, height: 300,),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: MaterialButton(       onPressed: () {
                        Provider.of<HomeNotifer>(context, listen: false)
                            .pickUserImage(
                            context: context, source: ImageSource.gallery);
                      },
                        child: Text("Gallery".tr,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,),),
                        color: Color(0xFF16CD54),),),
                    Container(
                      width: 100,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: MaterialButton(  onPressed: () {
                        Provider.of<HomeNotifer>(context, listen: false)
                            .pickUserImage(
                            context: context, source: ImageSource.camera);
                      },
                        child: Text("Camera".tr,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,),),
                        color: Color(0xFF16CD54),),),



                  ],
                ),
                Provider.of<HomeNotifer>(context, listen: true).getLoading == true
                    ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        child: Provider.of<HomeNotifer>(context, listen: false)
                            .getUserImage!=null? Image.file(
                            Provider.of<HomeNotifer>(context, listen: false)
                                .getUserImage!)
                            :
                        const Icon(
                          Icons.camera_alt,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        Provider.of<HomeNotifer>(context, listen: true)
                            .finalText!,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                        maxLines: 4,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      Visibility(
                        visible: Provider.of<HomeNotifer>(context, listen: false)
                            .getUserImage!=null? true : false,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: MaterialButton(
                            onPressed: () async {
                            if (await Provider.of<HomeNotifer>(context, listen: false)
                                .getImageFromText_2(context: context) == 1)
                            {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => NotSafe()));
                            }

                            else
                            {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Safe()));
                            }
                          },
                            child: Text("Scan".tr,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,),),
                            color: Color(0xFF16CD54),),),
                      ),
                    ],
                  ),
                )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF16CD54),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  BarcodeScanner()));
            },
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
