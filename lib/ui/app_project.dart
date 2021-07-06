import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppProject extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '我的项目',
      home: Scaffold(),
    );
  }
}
