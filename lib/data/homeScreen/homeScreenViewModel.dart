import 'package:flutter/cupertino.dart';

class HomeViewModel
{
  late final String title;
  final AssetImage imageProvider;
  HomeViewModel(
      {
        required this.imageProvider, required this.title,
      });

}