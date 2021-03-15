import 'package:fluro/fluro.dart';
import 'package:pinzi/controllers/index/index_controller.dart';

final router = FluroRouter.appRouter;

void defineRoutes() {
  router.define("/", handler: indexHandler);
}
