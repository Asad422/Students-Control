import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:missingpeple/login.dart';


import 'package:firebase_core/firebase_core.dart';
import 'cubit/currentcls_cubit.dart';

import 'package:firebase_auth/firebase_auth.dart';


import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: 'AIzaSyBQrsfSOTBADkbYOUTv7v8uyYBDH8-LXXA', appId: '1:103498613498:web:0f05dd9187c0d12c5f3f43', messagingSenderId: '', projectId: 'missingpeople-367f5'));
  FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    Widget firstWidget;

    if (firebaseUser != null) {
      firstWidget = Home();
    }
    else {
      firstWidget = LoggingIn();
    }

    return BlocProvider(
      create: (context) => CurrentclsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       
        home: firstWidget,
      ),
    );
  }
}
