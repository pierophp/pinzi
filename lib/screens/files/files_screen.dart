import 'package:flutter/material.dart';
import 'package:pinzi/models/file.dart';
import 'package:pinzi/screens/files/widgets/file_tile.dart';
import 'package:pinzi/widgets/custom_appbar.dart';

class FilesScreen extends StatefulWidget {
  final List<File> files;
  FilesScreen({
    Key? key,
    required this.files,
  }) : super(key: key);

  @override
  createState() => FilesScreenState();
}

class FilesScreenState extends State<FilesScreen> {
  FilesScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Arquivos'.toUpperCase(),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: widget.files
                .map(
                  (file) => FileTile(file: file),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}