import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/common/widgets/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/base_elevated_button.dart';
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
      body: Column(
        children: [
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is Unauthenticated) {
                context.go(AppRoutes.signin);
              }

              if (state is AuthError) {}
            },
            child: BaseElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
              title: S.current.signOut,
            ),
          ),
        ],
      ),
    );
  }
}
