import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:pinzi/routes.dart';
import 'package:flamingo/flamingo.dart';

class AppInitializer extends StatefulWidget {
  final Widget Function(BuildContext) onDidInitilize;
  final Widget Function(BuildContext)? onLoading;
  final Widget Function(BuildContext, Object?)? onError;

  const AppInitializer({
    Key? key,
    required this.onDidInitilize,
    this.onLoading,
    this.onError,
  }) : super(key: key);

  @override
  _AppInitializerState createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  Future<void>? initialization;

  Future<void> loadEnv() async {}

  @override
  void initState() {
    super.initState();
    initialization = () async {
      await Firebase.initializeApp();
      if (kDebugMode) {
        // Force disable Crashlytics collection while doing every day development.
        // Temporarily toggle this to true if you want to test crash reporting in your app.
        FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
      }

      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      defineRoutes();

      WidgetsFlutterBinding.ensureInitialized();

      await Future.wait([
        this.loadEnv(),
        Flamingo.initializeApp(),
      ]);
    }();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          FirebaseCrashlytics.instance.recordError(
            snapshot.error,
            snapshot.stackTrace,
          );

          return (widget.onError != null)
              ? widget.onError!(context, snapshot.error)
              : SizedBox.shrink();
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return widget.onDidInitilize(context);
        }

        return (widget.onLoading != null)
            ? widget.onLoading!(context)
            : SizedBox.shrink();
      },
    );
  }
}
