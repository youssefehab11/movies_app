import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/application/app_view_model.dart';
import 'package:movies_app/presentation/config/theme.dart';
import 'package:movies_app/data/services/api/api_manager.dart';
import 'package:movies_app/presentation/core/router/route_manager.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    edgeToEdgeInit();
    ApiManager.init();
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => RouteManager.onGenerateRoute(settings),
        initialRoute: context.read<AppViewModel>().checkAutoLogin(),
        theme: AppTheme.lightTheme,
      ),
    );
  }
}

void edgeToEdgeInit() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
}
