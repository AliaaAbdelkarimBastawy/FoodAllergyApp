import 'package:flutter/cupertino.dart';

class KnowledgeViewModel
{
  late final String title;
  final AssetImage imageProvider;
  KnowledgeViewModel(
      {
        required this.imageProvider, required this.title,
      });

}