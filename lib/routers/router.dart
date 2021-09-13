import 'package:fluro/fluro.dart';
import 'package:my_landing_page/routers/router_handlers.dart';

class Flurorouter {
  static late final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    //Ruters
    router.define('/:page', handler: homeHandler);
    // 404
    router.notFoundHandler = homeHandler;
  }
}
