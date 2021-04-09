import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solo_flutter/provider/provider_model.dart';
import 'package:solo_flutter/screens/screen1.dart';
import 'package:solo_flutter/screens/screen2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataProvider>.value(
      value: DataProvider(),
      child: MaterialApp(
        title: 'Aplikasi sederhana',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Screen1(),
        routes: {
          Screen1.id: (context) => Screen1(),
          Screen2.id: (context) => Screen2()
        },
      ),
    );
  }
}
