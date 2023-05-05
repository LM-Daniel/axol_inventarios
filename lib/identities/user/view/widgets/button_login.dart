import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/login/controllers/login_txt_cubit.dart';
import '../../cubit/login/login/login_controller.dart';
import '../../cubit/login/login/login_cubit.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    String user;
    String password;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 58),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () async {
        user = context.read<UserTxtCubit>().state;
        password = context.read<PasswordTxtCubit>().state;
        context.read<LoginCubit>().checkLogin(user, password);
        const LoginController();
      },
      child: const Text(
        'Iniciar',
        style: Typo.textButton,
      ),
    );
  }
}
