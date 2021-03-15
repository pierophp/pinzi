import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pinzi/screens/index_screen.dart';
import 'package:pinzi/widgets/custom_page_loader.dart';

class FutureBuilderResponse {
  FutureBuilderResponse();
}

class IndexController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FutureBuilderResponse>(future: () async {
      return FutureBuilderResponse();
    }(), builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return CustomPageLoader();
      }

      return IndexScreen(
        logged: false,
      );
    });
  }
}

var indexHandler = Handler(handlerFunc: (
  BuildContext? context,
  Map<String, dynamic> params,
) {
  return IndexController();
});
