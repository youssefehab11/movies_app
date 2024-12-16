import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/application/app_view_model.dart';
import 'package:movies_app/presentation/application/application.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(
    BlocProvider(
      create: (context) => getIt<AppViewModel>(),
      child: const MoviesApp(),
    ),
  );
}
