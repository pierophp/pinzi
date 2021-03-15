import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('pt', 'BR'),
          ],
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: router.generator,
          scaffoldMessengerKey: rootScaffoldMessengerKey,
          key: scaffoldKey,
        );
      },
    );
  }
}
