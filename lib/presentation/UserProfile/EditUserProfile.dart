import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject26_1/presentation/loginScreen/loginScreen.dart';
import 'package:graduationproject26_1/presentation/profileScreen/profileScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../SelectAllergyScreen/SelectAlleryScreen.dart';

class editAccountScreen extends StatefulWidget {
  String Name;
  String Email;
  String Password;

  editAccountScreen(
      {Key? key, required this.Name, required this.Email, required this.Password})
      : super(key: key);

  @override
  State<editAccountScreen> createState() => _editAccountScreenState();
}

class _editAccountScreenState extends State<editAccountScreen> {

  var UserName = TextEditingController();

  var UserEmail = TextEditingController();

  var UserPassword = TextEditingController();




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
                MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
        ),
        backgroundColor: const Color(0xFF16CD54),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 90.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Center(
                    child: Icon(
                      Icons.account_circle,
                      size: 130,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Text(
                    "Edit Account".tr,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: UserName..text = widget.Name,
                    decoration:  InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: "Edit username".tr,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 0.5, color: Color(0xFF16CD54)),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: UserEmail..text = widget.Email,
                    decoration:  InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: "Edit email".tr,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 0.5, color: Color(0xFF16CD54)),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 40,
                  ),


                  Container(
                    height: 44,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: MaterialButton(
                      color: const Color(0xFF16CD54),
                      onPressed: () {
                        UpdateData();
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                SelectAllergyScreen(EmailController: UserEmail,
                                  UsernameController: UserName,
                                  PasswordController: UserPassword,)));
                      },
                      child:  Text(
                        "Edit Allergies".tr,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 44,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: MaterialButton(
                      color: const Color(0xFF16CD54),
                      onPressed: () {
                        UpdateData();
                      },
                      child:  Text(
                        "Update".tr,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  late DatabaseReference reference;

  FirebaseDatabase db = FirebaseDatabase.instance;

  Future<void> UpdateData() async {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    print(uid);

    reference = db.ref(auth.currentUser?.uid);
    var authenVariable = auth.currentUser?.uid;
    final fb = FirebaseDatabase.instance.reference().child("$authenVariable");
    Map<String, String> DataOfUser =
    {
      'Name': UserName.text,
      'Email': UserEmail.text,
      'Password': UserPassword.text,
    };
    fb.child("UserData").set(DataOfUser);

     auth.currentUser?.updateEmail(UserEmail.text);
    // await auth.currentUser?.updatePassword(UserPassword.text);
  }
}