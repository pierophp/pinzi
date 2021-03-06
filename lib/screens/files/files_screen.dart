import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinzi/models/file.dart';
import 'package:pinzi/screens/files/modals/add_file_modal.dart';
import 'package:pinzi/screens/files/widgets/file_tile.dart';
import 'package:pinzi/widgets/custom_appbar.dart';

class FilesScreen extends StatefulWidget {
  final List<File> files;
  final User user;

  FilesScreen({
    Key? key,
    required this.files,
    required this.user,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.white,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: AddFileModal(user: this.widget.user),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
