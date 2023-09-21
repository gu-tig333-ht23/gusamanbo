import 'package:flutter/material.dart';
import 'state.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';

void main() {
  MyState state = MyState();
  state.fetchList();

  runApp(ChangeNotifierProvider(
    create: (context) => state,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.cyan),
    );
  }
}
