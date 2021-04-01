import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pinzi/models/file.dart';
import 'package:pinzi/models/file_content.dart';
import 'package:pinzi/repositories/file_content_repository.dart';
import 'package:pinzi/repositories/file_repository.dart';
import 'package:pinzi/routes.dart';
import 'package:pinzi/screens/files/file_screen.dart';
import 'package:pinzi/widgets/custom_page_loader.dart';

class FutureBuilderResponse {
  FutureBuilderResponse();
}

class FileController extends StatelessWidget {
  final String id;

  FileController({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FutureBuilderResponse>(future: () async {
      return FutureBuilderResponse();
    }(), builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return CustomPageLoader();
      }

      final logged = FirebaseAuth.instance.currentUser != null;
      if (!logged) {
        Future.delayed(Duration(seconds: 2), () {
          router.navigateTo(
            context,
            "/",
            transition: TransitionType.inFromLeft,
            clearStack: true,
          );
        });

        return CustomPageLoader();
      }

      return StreamBuilder<DocumentSnapshot>(
        stream: FileRepository().findOneByUserAndId(
          FirebaseAuth.instance.currentUser!,
          this.id,
        ),
        builder: (context, snapshotFile) {
          if (!snapshotFile.hasData) {
            return CustomPageLoader();
          }

          return StreamBuilder<DocumentSnapshot>(
            stream: FileContentRepository().findOneByUserAndId(
              FirebaseAuth.instance.currentUser!,
              this.id,
            ),
            builder: (context, snapshotFileContent) {
              if (!snapshotFileContent.hasData) {
                return CustomPageLoader();
              }

              if (snapshotFileContent.data == null) {
                Future.delayed(Duration(seconds: 2), () {
                  router.navigateTo(
                    context,
                    "/files",
                    transition: TransitionType.inFromLeft,
                    clearStack: true,
                  );
                });

                return CustomPageLoader();
              }

              final file = File(snapshot: snapshotFile.data);

              final fileContent = FileContent(
                snapshot: snapshotFileContent.data,
              );

              return FileScreen(
                file: file,
                fileContent: fileContent,
              );
            },
          );
        },
      );
    });
  }
}

var fileHandler = Handler(handlerFunc: (
  BuildContext? context,
  Map<String, dynamic> params,
) {
  return FileController(id: params["id"][0].toString());
});
