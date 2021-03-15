import 'package:flutter/material.dart';

class FilesScreen extends StatefulWidget {
  FilesScreen({
    Key? key,
  }) : super(key: key);

  @override
  createState() => FilesScreenState();
}

class FilesScreenState extends State<FilesScreen> {
  FilesScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Arquivos"),
        ),
      ),
    );
  }
}
