import 'package:flexible_text_editing_controller/flexible_text_editing_controller.dart';
import 'package:flutter/material.dart';

///[styler] definition
TextSpan styler(String text, TextStyle? defaultStyle) {
  List<TextSpan> children = [];
  for (int i = 0; i < text.length; i++) {
    i % 2 == 0
        ? children.add(TextSpan(
        text: text.substring(i, i + 1),
        ///red for even,
        style: const TextStyle(color: Colors.red)))
        : children.add(TextSpan(
        text: text.substring(i, i + 1),
        ///blue for odd
        style: const TextStyle(color: Colors.blue)));
  }
  return TextSpan(style: defaultStyle, children: children);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flexible TEC'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title;
  TextField textField =  TextField(controller: FlexibleTextEditingController(styler: styler),);

  MyHomePage({super.key, required this.title});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            textField,
          ],
        ),
      ),
    );
  }
}

