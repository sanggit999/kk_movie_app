import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/common/cubit/execute_cubit.dart';
import 'package:kk_movie_app/common/cubit/execute_state.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_state.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final String title;
  const AuthButton({
    super.key,
    required this.onPressed,
    this.width,
    this.height,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExecuteCubit, ExecuteState>(
      builder: (context, state) {
        final isLoading = state is ExecuteLoading;

        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            side: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
              width: 2.0,
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            minimumSize: Size(
              width ?? MediaQuery.of(context).size.width,
              height ?? 60.0,
            ),
          ),
          child: isLoading
              ? const SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  ),
                )
              : Text(
                  title,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
        );
      },
    );
  }
}
