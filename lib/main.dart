import 'package:flutter/material.dart';
import 'package:users/ui/userScreen.dart';
import 'package:users/ui/postsScreen.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => PostScreen(),
      },
    ));
