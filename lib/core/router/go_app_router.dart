import 'package:notif/core/router/app_router.dart';
import 'package:notif/core/router/go_router.dart';
import 'package:notif/core/typedefs.dart';

class GoAppRouter implements AppRouter {
  @override
  void push(
    String routeName, {
    StringMap? parameters,
  }) =>
      goRouter.goNamed(
        routeName,
        queryParameters: parameters ?? {},
      );

  @override
  void pop<T>(T result) => goRouter.pop<T>(result);
}
