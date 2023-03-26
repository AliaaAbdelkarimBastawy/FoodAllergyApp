import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/UserProfile/EditUserProfile.dart';
import '../../helper/helper_function.dart';
import 'globalsOfUserData.dart' as globals;
import '../../data/profileScreen/profileScreenModel.dart';
import '../HomeScreen/HomeScreen.dart';
import '../Language/LanguageScreen.dart';
import '../TextRecognition/home.notifer_2.dart';
import '../favoritesScreen/FavoritesScreen.dart';
import '../mainScreen/MainScreen.dart';
import '../signUpScreen/signUpScreen.dart';

class ProfileScreen extends StatefulWidget {

   ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String getName = "";

  String userName = "";
  String getEmail = "";

  String getPassword = "";

  List<ProfileViewModel> ProfileScreensList = [
    ProfileViewModel(title: "My Favorites", icon: Icons.favorite),
    ProfileViewModel(title: "Edit Account", icon: Icons.account_circle_outlined),
    ProfileViewModel(title: "Language", icon: Icons.language),
  ];

   var snapshotName;
   var snapshotEmail;
   var snapshotPassword;

   Future<dynamic> getUserData() async {
     final ref = FirebaseDatabase.instance.ref();
     var authenVariable = auth.currentUser?.uid;
     final fb = FirebaseDatabase.instance.reference().child("$authenVariable");

     snapshotName = await ref.child('$authenVariable/UserData/Name').get();
     snapshotEmail = await ref.child('$authenVariable/UserData/Email').get();
     snapshotPassword = await ref.child('$authenVariable/UserData/Password').get();

     setState(() {
       getName = snapshotName.value.toString();
       getEmail = snapshotEmail.value.toString();
       getPassword = snapshotPassword.value.toString();
     });
     print("DATAAA");
     print(getName);
     globals.Name = getName;
     print(getPassword);
   }


  gettingUserData() async {
    print("gettingUserData");
    await HelperFunctions.getUserNameFromSF().then((val) {
      setState(() {
        userName = val!;
      });
    });
    // getting the list of snapshots in our stream
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF16CD54),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              MainScreen(Current: 0,drawer: true,)));
        },
        ),
        title:  Padding(
          padding: const EdgeInsets.only(left: 100.0),
          child: Text("Profile"),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Icon(
                    Icons.account_circle,
                    size: 150,
                    color: Colors.grey[700],
                  ),
                ),
                Text(userName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
              ],

            ),
            Expanded(
              child: GestureDetector(
                onTap: ()
                {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));

                },
                child: Container(
                  child: ListView.separated(itemBuilder: (context, index) =>
                      GestureDetector(
                          onTap: ()
                          {
                            if(ProfileScreensList[index].title == "My Favorites")
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> FavoritesScreen()));

                              }

                            else if(ProfileScreensList[index].title == "Edit Account")
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  editAccountScreen(Name: getName, Email: getEmail, Password: getPassword,)));

                            }

                            else if(ProfileScreensList[index].title == "Language")
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> EditLanguageScreen()));

                            }

                          },
                          child: buildStartScreensItem(ProfileScreensList[index])),
                      separatorBuilder: (context, index) {
                        return Divider();},
                      itemCount: ProfileScreensList.length),
                ),
              ),
            )
          ],
        ),
      ),

      );
  }

   Widget buildStartScreensItem(ProfileViewModel model)=> Padding(
     padding: const EdgeInsets.all(8.0),
     child: Material(
       borderRadius: BorderRadius.all(Radius.circular(20)),
       elevation: 4,
       child: Container(

         height: 60,
         child:  Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             children: [
               SizedBox(width: 10,),
               Icon(model.icon),
               SizedBox(width: 10,),
               Text('${model.title}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
               Spacer(),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Transform.rotate(angle: 380,
                     child: Icon(Icons.arrow_back_ios_new)),
               ),
             ],
           ),
         ),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.all(Radius.circular(20)),
           border: Border.all(
             color:  Colors.white30,
           ),
           boxShadow: [
             //BoxShadow
             BoxShadow(
               color: Colors.white,
               offset: const Offset(0.0, 0.0),
               blurRadius: 0.0,
               spreadRadius: 0.0,
             ), //BoxShadow
           ],
         ),

       ),
     ),
   );

  @override
  void initState() {
    getUserData();
    super.initState();
    gettingUserData();
  }

}
