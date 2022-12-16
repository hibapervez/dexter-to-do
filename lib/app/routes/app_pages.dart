import 'package:get/get.dart';

import '../modules/addToDo/bindings/add_to_do_binding.dart';
import '../modules/addToDo/views/add_to_do_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/toDoDetail/bindings/to_do_detail_binding.dart';
import '../modules/toDoDetail/views/to_do_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TO_DO,
      page: () => AddToDoView(),
      binding: AddToDoBinding(),
    ),
    GetPage(
      name: _Paths.TO_DO_DETAIL,
      page: () => ToDoDetailView(data: Get.arguments,),
      binding: ToDoDetailBinding(),
    ),
  ];
}
