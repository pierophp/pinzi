import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinzi/routes.dart';
import 'package:pinzi/widgets/custom_page_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FilesScreen extends StatefulWidget {
  final bool logged;

  FilesScreen({
    Key? key,
    required this.logged,
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
