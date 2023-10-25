import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/AdminHomePage/AdminHomePage.dart';
import 'package:graduationproject26_1/presentation/profileScreen/profileScreen.dart';
import 'package:graduationproject26_1/SelectLanguageByAdmin.dart' as LanguageGlobalByAdmin;
class EditLanguageScreen extends StatefulWidget {
  EditLanguageScreen({Key? key}) : super(key: key);

  @override
  State<EditLanguageScreen> createState() => _EditLanguageScreenState();
}

class _EditLanguageScreenState extends State<EditLanguageScreen> {
  String def = LanguageGlobalByAdmin.isEnglish? "English" : "Arabic";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdminHomePage()));
          },
        ),
        backgroundColor: const Color(0xFF16CD54),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                child: Center(
                  child: Text(
                    "Choose Your Language",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              RadioListTile(
                title: Text("Arabic"),
                value: "Arabic",
                groupValue: def,
                onChanged: (value){
                  setState(() {
                    def = value.toString();
                    LanguageGlobalByAdmin.isEnglish = false;
                  });
                },
              ),

              RadioListTile(
                title: Text("English"),
                value: "English",
                groupValue: def,
                onChanged: (value){
                  setState(() {
                    def = value.toString();
                    LanguageGlobalByAdmin.isEnglish = true;
                  });
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}