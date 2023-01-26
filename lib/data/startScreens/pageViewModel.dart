import 'dart:ui';

import 'package:flutter/cupertino.dart';

class PageViewModel
{
  late final String title;
  late final String description;
  final AssetImage imageProvider;
  PageViewModel(
  {
   required this.imageProvider, required this.title, required this.description
  });

}