import 'package:flutter/cupertino.dart';

class RestaurantModel extends StatefulWidget {
  const RestaurantModel({Key? key}) : super(key: key);

  @override
  State<RestaurantModel> createState() => _RestaurantModelState();
}

class MenuModel {
  late final String dishName;
  final Image dishImage;
  final String dishDetails;

  MenuModel(
      {required this.dishName,
        required this.dishImage,
        required this.dishDetails});
}

class Model {
  late final String title;
  final Image image;
  List<MenuModel> MenuList = [];

  Model({required this.title, required this.image, required this.MenuList});
}

class _RestaurantModelState extends State<RestaurantModel> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
