import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.provider_2.dart';
import 'app.routes_2.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Core_3());
}

class Core_3 extends StatelessWidget {
  const Core_3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: AppProvider.providers,
      child: const Lava(),
    );
  }
}

class Lava extends StatelessWidget {
  const Lava({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Detector',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRoute,
      theme: ThemeData(
        fontFamily: 'roboto',
      ),
      routes: AppRoutes.routes,
    );
  }
}
