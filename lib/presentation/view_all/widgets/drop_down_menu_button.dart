import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/view_all/cubit/view_all_cubit.dart';
import 'package:kk_movie_app/presentation/view_all/cubit/view_all_state.dart';

class DropDownMenuButton extends StatelessWidget {
  const DropDownMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewAllCubit, ViewAllState>(
      builder: (context, state) {
        return DropdownButton<String>(
          value: state.sortType,
          underline: const SizedBox(),
          items: [
            DropdownMenuItem(
              value: "desc",
              child: Text(
                S.current.latest,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            DropdownMenuItem(
              value: "asc",
              child: Text(
                S.current.oldest,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            DropdownMenuItem(
              value: "vietsub",
              child: Text(
                S.current.vietSub,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            DropdownMenuItem(
              value: "thuyet-minh",
              child: Text(
                S.current.subtitled,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            DropdownMenuItem(
              value: "long-tieng",
              child: Text(
                S.current.dubbed,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              context.read<ViewAllCubit>().applyDropdownFilter(value);
            }
          },
        );
      },
    );
  }
}
