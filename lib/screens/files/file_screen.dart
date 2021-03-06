import 'package:flutter/material.dart';
import 'package:pinzi/models/file.dart';
import 'package:pinzi/models/file_content.dart';
import 'package:pinzi/screens/files/widgets/file_row.dart';
import 'package:pinzi/widgets/custom_appbar.dart';

class FileScreen extends StatefulWidget {
  final File file;
  final List<FileContent> fileContents;

  FileScreen({
    Key? key,
    required this.file,
    required this.fileContents,
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
          child: Column(
            children: this
                .widget
                .fileContents
                .map((fileContent) => FileRow(fileContent: fileContent))
                .toList(),
          ),
        ),
      ),
    );
  }
}
