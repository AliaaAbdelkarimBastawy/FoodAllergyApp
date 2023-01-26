import 'package:flutter/cupertino.dart';

class CategoriesViewModel
{
  late final String title;
  final AssetImage imageProvider;
  CategoriesViewModel(
      {
        required this.imageProvider, required this.title,
      });

}