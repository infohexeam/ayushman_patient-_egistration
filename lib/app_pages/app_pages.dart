import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:paitent_registration/app_routes/app_routes.dart';
import 'package:paitent_registration/registration/registration_controller.dart';
import 'package:paitent_registration/registration/registration_view.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(
        name: AppRoutes.register,
        page: () => const RegistrationScreen(),
        binding: RegistrationControllerBinding())
  ];
}
