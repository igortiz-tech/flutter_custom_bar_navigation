import 'package:flutter_modular/flutter_modular.dart';
import 'views/login_page.dart';
import 'repositories/login_repository.dart';
import 'blocs/login_bloc.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class AuthModule extends Module {

  @override
  List<Bind> get binds => [
    Bind.factory((i) => LoginRepository()),
    BlocBind.singleton((i) => LoginBloc(i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => LoginPage())
  ];
}