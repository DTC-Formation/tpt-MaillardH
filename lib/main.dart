import 'package:flutter/material.dart';
import 'package:tsitsio/model/model.dart';
import 'package:tsitsio/view/page1.dart';
import 'package:provider/provider.dart';
import 'model/theme.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Personne()),
    ChangeNotifierProvider(create: (Context) => ColorProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Page1(),
    );
  }
}
