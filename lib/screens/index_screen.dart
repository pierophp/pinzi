import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  final bool logged;

  IndexScreen({
    Key? key,
    required this.logged,
  }) : super(key: key);

  @override
  createState() => IndexScreenState();
}

class IndexScreenState extends State<IndexScreen> {
  IndexScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Index"),
      ),
    );
  }
}
