import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;

class HomeNotifer with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late DatabaseReference reference;
  FirebaseDatabase db = FirebaseDatabase.instance;
  List<String> Allergies=["Almonds","Corn","Crustaceans","Eggs","Fish","Gluten","MILK","Nut","Peanut","Soy","Strawberry","Wheat"];
  List<String> AllergiesValue=[];
  List<String> TrueAllergies=[];


  Future<void> _ImageSharedPreference() async {

    SharedPreferences prefss = await SharedPreferences.getInstance();
    prefss.setBool('Image', true);
  }

  Future<void> _ImageSharedPreference2() async {

    SharedPreferences prefss = await SharedPreferences.getInstance();
    prefss.setBool('Image', false);
  }


  final ImagePicker picker = ImagePicker();
  File? userImage;
  File? get getUserImage => userImage;
  bool loading = false;
  bool? get getLoading => loading;
  String? finalText;
  final textDetector = GoogleMlKit.vision.textDetector();
  var Almondssnapshot;
  var Cornsnapshot;
  var Crustaceanssnapshot;
  var Eggssnapshot;
  var Fishsnapshot;
  var Glutensnapshot;
  var Milksnapshot;
  var Nutsnapshot;
  var Peanutssnapshot;
  var Soysnapshot;
  var Strawberrysnapshot;
  var Wheatsnapshot;


// Method to choose a image from gallery or can use camera
  Future pickUserImage(
      {required BuildContext context, required ImageSource source}) async {
    final pickedUserImage = await picker.pickImage(source: source);
    userImage = File(pickedUserImage!.path);

    if (userImage != null) {
      finalText = '';
      userImage = await ImageCropper().cropImage(

          sourcePath: userImage!.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: const AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Color(0xFF16CD54),
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: const IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));
      loading = true;
      notifyListeners();
    } else {
      loading = false;
      notifyListeners();
    }
  }

  Future<int> getImageFromText_2({required BuildContext context}) async {
    if (userImage != null) {
      final inputImage = InputImage.fromFile(userImage!);
      // Function that takes [InputImage] processes it and returns a [RecognisedText] object.
      final RecognisedText recognisedText =
      await textDetector.processImage(inputImage);
      String text = recognisedText.text;
      final User? user = auth.currentUser;
      final uid = user?.uid;
      print(uid);
      reference = db.ref();

      Almondssnapshot  = await reference.child('$uid/Allergies/Almonds Allergy').get();
      print("SNAPSHOT ------- Allergy");
      print(Almondssnapshot.value.toString());
      AllergiesValue.add(Almondssnapshot.value.toString());


      Cornsnapshot  = await reference.child('$uid/Allergies/Corn Allergy').get();
      print("SNAPSHOT ------- Corn");
      print(Cornsnapshot.value.toString());
      AllergiesValue.add(Cornsnapshot.value.toString());


      Crustaceanssnapshot  = await reference.child('$uid/Allergies/Crustaceans Allergy').get();
      print("SNAPSHOT ------- Crustaceans");
      print(Crustaceanssnapshot.value.toString());
      AllergiesValue.add(Crustaceanssnapshot.value.toString());


      Eggssnapshot  = await reference.child('$uid/Allergies/Eggs Allergy').get();
      print("SNAPSHOT ------- Eggs");
      print(Eggssnapshot.value.toString());
      AllergiesValue.add(Eggssnapshot.value.toString());



      Fishsnapshot  = await reference.child('$uid/Allergies/Fish Allergy').get();
      print("SNAPSHOT ------- Fish");
      print(Fishsnapshot.value.toString());
      AllergiesValue.add(Fishsnapshot.value.toString());



      Glutensnapshot  = await reference.child('$uid/Allergies/Gluten Allergy').get();
      print("SNAPSHOT ------- Gluten");
      print(Glutensnapshot.value.toString());
      AllergiesValue.add(Glutensnapshot.value.toString());



      Milksnapshot  = await reference.child('$uid/Allergies/Milk Allergy').get();
      print("SNAPSHOT ------- Milk");
      print(Milksnapshot.value.toString());
      AllergiesValue.add(Milksnapshot.value.toString());



      Nutsnapshot = await reference.child('$uid/Allergies/Nut Allergy').get();
      print("SNAPSHOT ------- Nut");
      print(Nutsnapshot.value.toString());
      AllergiesValue.add(Nutsnapshot.value.toString());


      Peanutssnapshot = await reference.child('$uid/Allergies/Peanuts Allergy').get();
      print("SNAPSHOT ------- Peanuts");
      print(Peanutssnapshot.value.toString());
      AllergiesValue.add(Peanutssnapshot.value.toString());


      Soysnapshot = await reference.child('$uid/Allergies/Soy Allergy').get();
      print("SNAPSHOT ------- Soy");
      print(Soysnapshot.value.toString());
      AllergiesValue.add(Soysnapshot.value.toString());



      Strawberrysnapshot = await reference.child('$uid/Allergies/Strawberry Allergy').get();
      print("SNAPSHOT ------- Strawberry");
      print(Strawberrysnapshot.value.toString());
      AllergiesValue.add(Strawberrysnapshot.value.toString());


      Wheatsnapshot = await reference.child('$uid/Allergies/Wheat Allergy').get();
      print("SNAPSHOT ------- Wheat");
      print(Wheatsnapshot.value.toString());
      AllergiesValue.add(Wheatsnapshot.value.toString());


      for(int j=0; j<12; j++)
        {
          if(AllergiesValue[j] == "true")
            {
              TrueAllergies.add(Allergies[j]);
            }
        }
      print("TRUEEEEEEEEEE");
      print(AllergiesValue);
      print(Allergies);
      print(TrueAllergies);
      print("lehhh?");
      print(TrueAllergies.length);
      for (int z=0; z<TrueAllergies.length; z++)
        {
          if (text.contains(TrueAllergies[z])) {
            print('This Product is not safe.');
            return 1;
          }
          print('baraaa el if.');
        }

    } else {
      showInfo(context: context, text: 'Please Select A Image');
    }

    return 0;
  }

  showInfo({required BuildContext context, required String text}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
