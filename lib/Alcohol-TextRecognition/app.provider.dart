import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'home.notifer.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (_) => HomeNotifer(),
    )
  ];
}
