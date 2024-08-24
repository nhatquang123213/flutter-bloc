import 'dart:math';

import 'package:bloc_pattern/blocs/login_bloc.dart';
import 'package:bloc_pattern/blocs/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final login = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: login.state,
      builder: (ctx, snapshot) {
        if (snapshot.data!.isLoading) return CircularProgressIndicator();
        if (snapshot.data!.isSuccess) Text("Oke");
        if (snapshot.data!.isFailure) Text("Failed");
        return SizedBox();
      },
      initialData: LoginState.initState(),
    );
  }
}
