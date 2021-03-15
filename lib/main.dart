import 'package:flutter/material.dart';
import 'package:pinzi/routes.dart';
import 'package:pinzi/widgets/app_initializer.dart';
import 'package:pinzi/widgets/custom_page_loader.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

/// Avoid looking up for deactivated ancestor
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

void main() async {
  runApp(AppComponent());
}

class AppComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppInitializer(
      onLoading: (loadingContext) => CustomPageLoader(),
      onDidInitilize: (didInitContext) {
        return MaterialApp(
          title: 'Pinzi',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [],
          supportedLocales: [
            const Locale('pt', 'BR'),
          ],
          onGenerateRoute: router.generator,
          scaffoldMessengerKey: rootScaffoldMessengerKey,
          key: scaffoldKey,
        );
      },
    );
  }
}
