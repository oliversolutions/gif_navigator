import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_navigator/features/gif_navigator/presentation/pages/search_page.dart';
import 'package:gif_navigator/features/login/presentation/widgets/login_form_widget.dart';
import '../../../../injection_container.dart';
import '../bloc/user_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Login';
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: BlocProvider(
        create: (_) => sl<UserBloc>(),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is LoginSuccessful) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                );
              });
            } else if (state is LoginFailed) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                ));
              });
            }
            return LoginFormWidget();
          },
        ),
      ),
    );
  }
}
