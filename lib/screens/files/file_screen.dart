import 'package:flutter/material.dart';
import 'package:pinzi/models/file.dart';
import 'package:pinzi/widgets/custom_appbar.dart';

class FileScreen extends StatefulWidget {
  final File file;

  FileScreen({
    Key? key,
    required this.file,
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
