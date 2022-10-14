import 'package:flutter_modular/flutter_modular.dart';
import 'dart:async';
import '../blocs/login_bloc.dart';
import '../../../app_module.dart';

class AuthGuard extends RouteGuard {

  AuthGuard(): super(redirectTo: '/auth/');


  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    final logged = await Modular.get<LoginBloc>().checkCurrentUser();
    return logged;
  }
}