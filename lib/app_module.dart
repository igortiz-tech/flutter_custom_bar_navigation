import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_page.dart';
import 'modules/profile/profile_modules.dart';
import 'modules/auth/auth_modules.dart';
import 'modules/auth/guard/auth_guard.dart';

class AppModule extends Module {
  @override  List<Bind> get binds => [
    AsyncBind((i) => SharedPreferences.getInstance())
  ];
  @override  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => SplashPage()),
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/profile', module: ProfileModule(), guards: [AuthGuard()])
  ];
}
