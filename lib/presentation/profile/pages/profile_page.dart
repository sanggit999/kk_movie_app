import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/common/widgets/appbar/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/button/base_elevated_button.dart';
import 'package:kk_movie_app/core/utils/dialog/dialogs.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_state.dart';
import 'package:kk_movie_app/router/app_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text(S.current.profile)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            spacing: 20.0,
            children: [
              SizedBox(
                height: 60.0,
                child: InkWell(
                  onTap: () {
                    context.push(AppRoutes.language);
                  },
                  child: ColoredBox(
                    color: Theme.of(context).colorScheme.secondary,
                    child: ListTile(
                      leading: const Icon(Icons.language, size: 24.0),
                      title: Text(
                        S.current.language,
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                ),
              ),
             const Spacer(),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthError) {
                    final message = switch (state.message) {
                      'sign-out-failed' => 'Error',
                      _ => S.current.unknownError,
                    };

                    Dialogs.showErrorDialog(
                      context: context,
                      message: message,
                      title: S.current.notification,
                      onPressed: () => context.pop(),
                    );
                  }

                  if (state is Unauthenticated) {
                    context.go(AppRoutes.signin);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return BaseElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().signOut();
                    },
                    title: S.current.signOut,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
