import 'package:flutter/material.dart';
import 'package:movies_app/core/router/routes.dart';
import 'package:movies_app/presentation/layout/main_layout.dart';

class RouteManager {
  static Route<MaterialPageRoute> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      default:
        return MaterialPageRoute(builder: (_) => const UnDefinedWidget());
    }
  }
}

class UnDefinedWidget extends StatelessWidget {
  const UnDefinedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No Route Found!'),
      ),
    );
  }
}
