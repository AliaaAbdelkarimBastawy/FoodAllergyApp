import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../presentation/BarcodeScreens/AlcoholDetected.dart';
import '../presentation/BarcodeScreens/AlcoholNotDetected.dart';
import '../presentation/BarcodeScreens/BarcodeScanner.dart';
import 'home.notifer.dart';

class HomeView extends StatefulWidget {
   HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                  text: const TextSpan(
                    text: "Detect",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: ' Alcohol!',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 130,
                  child: Image.asset('Assets/Images/no-alcohol.png'),
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
                        child: Text("Gallery",
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
                        child: Text("Camera",
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
                            .getUserImage!=null
                      ? Image.file(
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
                            onPressed: Provider.of<HomeNotifer>(context, listen: false)
                                .getUserImage!=null? () async {
                            print(await Provider.of<HomeNotifer>(context, listen: false)
                                .getImageFromText(context: context));
                            if (await Provider.of<HomeNotifer>(context, listen: false)
                                .getImageFromText(context: context) == 1)
                            {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => AlcoholDetected()));
                            }

                            else
                            {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => AlcoholNotDetected()));
                            }
                          } : ()
                            {

                            },
                            child: Text("Scan",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,),),
                            color: Color(0xFF16CD54)),),
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
