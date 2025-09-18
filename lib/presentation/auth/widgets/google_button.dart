import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/core/utils/dialog/dialogs.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_state.dart';
import 'package:kk_movie_app/router/app_routes.dart';

class GoogleButton extends StatelessWidget {
  final void Function()? onTap;

  const GoogleButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) {
        return current is  AuthError || current is Authenticated;
      },
      listener: (context, state) {
        if (state is AuthError) {
          final message = switch (state.message) {
            'no-connection' => S.current.noConnection,
            _ => S.current.unknownError,
          };

          Dialogs.showErrorDialog(
            context: context,
            message: message,
            title: S.current.notification,
            onPressed: () => context.pop(),
          );
        }

        if (state is Authenticated) {
          context.go(AppRoutes.home);
        }
      },
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Theme.of(context).colorScheme.tertiary),
          ),
          child: Image.asset('assets/images/google.png', height: 32.0),
        ),
      ),
    );
  }
}
