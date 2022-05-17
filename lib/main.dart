import 'package:NextNewsApp/const/blockobserver.dart';
import 'package:NextNewsApp/cubit/DIO_halper.dart';
import 'package:NextNewsApp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();

  Diohalper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primaryTextTheme: TextTheme(
        title: TextStyle(
        color: Colors.white
    )
    ),
    scaffoldBackgroundColor: Colors.deepOrangeAccent,
    appBarTheme: AppBarTheme(

    color: Colors.deepOrangeAccent,
    iconTheme: IconThemeData(color: Colors.black),

    elevation: 0,
    ),
        ),
          home:homepage(),
    );
  }
}
