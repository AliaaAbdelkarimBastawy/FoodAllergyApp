import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeNotifer with ChangeNotifier {
  final ImagePicker picker = ImagePicker();
  File? userImage;
  File? get getUserImage => userImage;
  bool loading = false;
  bool? get getLoading => loading;
  String? finalText;
  final textDetector = GoogleMlKit.vision.textDetector();

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
      print("NULLLLLLL");
      notifyListeners();

    }
  }

  Future<int> getImageFromText({required BuildContext context}) async {
    if (userImage != null) {
      final inputImage = InputImage.fromFile(userImage!);
      // Function that takes [InputImage] processes it and returns a [RecognisedText] object.
      final RecognisedText recognisedText =
      await textDetector.processImage(inputImage);

      // ignore: unused_local_variable
      String text = recognisedText.text;

      if (text.contains("Alcohol")) {
        print('This Product Contains Alcohol.');
        return 1;
        // Navigator.of(context).pushReplacementNamed('/Users/aliaakaram/Desktop/text_extract_google_mi_kit/lib/presentation/BarcodeScreens/NotSafe');

      } else {
        print('This Product does not contain Alcohol.');
        return 0;
      }


    } else {
      showInfo(context: context, text: 'Please Select A Image');
    }
    return 5;
  }


  showInfo({required BuildContext context, required String text}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
