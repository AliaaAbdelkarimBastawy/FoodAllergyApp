import 'package:flutter/cupertino.dart';

class RecipeModelOfHomePage extends StatefulWidget {
  const RecipeModelOfHomePage({Key? key}) : super(key: key);

  @override
  State<RecipeModelOfHomePage> createState() => _RecipeModelOfHomePageState();
}

class recipeModel {
  late final String Name;
  final Image image;
  String duration;
  String direction;
  String ingredients;
  String containedAllery;

  recipeModel(
      {required this.Name,
        required this.image,
        required this.duration,
        required this.direction,
        required this.containedAllery,
        required this.ingredients});
}

class _RecipeModelOfHomePageState extends State<RecipeModelOfHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
