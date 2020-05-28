import 'package:flutter/material.dart';
import 'screens/list_page.dart';

void main() => runApp(TheIdiotBox());

class TheIdiotBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Idiot Box',
        home: ListPage(),
        );
  }
  }