import 'package:flutter/material.dart';

class ReorderableListViewWidget extends StatefulWidget {
  const ReorderableListViewWidget({super.key});

  @override
  State<ReorderableListViewWidget> createState() =>
      _ReorderableListViewWidgetState();
}

class _ReorderableListViewWidgetState extends State<ReorderableListViewWidget> {
  List<String> fruits = [
    "apple",
    "banana",
    "mango",
    "cherry",
    "strawberry",
    "papaya",
    "orange"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ReorderableListView"),
      ),
      body: ReorderableListView.builder(
        itemBuilder: (context, index) {
          return Card(
            key: ValueKey(fruits[index]),
            child: ListTile(title: Text(fruits[index])),
          );
        },
        itemCount: fruits.length,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex = newIndex - 1;
            }
            final element = fruits.removeAt(oldIndex);
            fruits.insert(newIndex, element);
          });
        },
      ),
    );
  }
}
