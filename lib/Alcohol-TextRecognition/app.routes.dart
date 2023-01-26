
import 'home.view.dart';

class AppRoutes {
  static const String homeRoute = "/home";

  static final routes = {
    homeRoute: (context) => const HomeView(),
  };
}
