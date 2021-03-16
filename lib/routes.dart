import 'package:fluro/fluro.dart';
import 'package:pinzi/controllers/files/file_controller.dart';
import 'package:pinzi/controllers/files/files_controller.dart';
import 'package:pinzi/controllers/index/index_controller.dart';

final router = FluroRouter.appRouter;

void defineRoutes() {
  router.define("/", handler: indexHandler);
  router.define("/files", handler: filesHandler);
  router.define("/file/:id", handler: fileHandler);
}
