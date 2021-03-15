import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pinzi/widgets/custom_loader.dart';

class CustomPageLoader extends StatefulWidget {
  @override
  _CustomPageLoaderState createState() => _CustomPageLoaderState();
}

class _CustomPageLoaderState extends State<CustomPageLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 255, 255, 1),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomLoader(),
        ],
      ),
    );
  }
}
