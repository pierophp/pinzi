import 'package:flutter/material.dart';
import 'package:pinzi/models/file.dart';
import 'package:pinzi/widgets/custom_typography.dart';

class FileTile extends StatelessWidget {
  final File file;

  FileTile({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // this.onSelected(!this.selected);
      },
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              padding: EdgeInsets.symmetric(vertical: 0),
              child: ListTile(
                title: CustomTypography(
                  textAlign: TextAlign.start,
                  text: file.title!,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
