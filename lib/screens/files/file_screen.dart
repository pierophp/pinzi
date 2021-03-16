import 'package:flutter/material.dart';
import 'package:pinzi/widgets/custom_appbar.dart';

class FileScreen extends StatefulWidget {
  FileScreen({
    Key? key,
  }) : super(key: key);

  @override
  createState() => FileScreenState();
}

class FileScreenState extends State<FileScreen> {
  FileScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Arquivo'.toUpperCase(),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Text("Arquivo"),
          ),
        ),
      ),
    );
  }
}
