import 'package:flutter/material.dart';
import 'package:widgets/future_builder_widget.dart';
import 'package:widgets/re_orderable_list_view_builder_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilderWidget(),
    );
  }
}
