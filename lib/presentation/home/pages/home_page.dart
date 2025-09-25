import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/common/cubit/language_cubit.dart';
import 'package:kk_movie_app/common/widgets/appbar/base_app_bar.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/home/widgets/banner_movie.dart';
import 'package:kk_movie_app/presentation/home/widgets/cartoon_movie.dart';
import 'package:kk_movie_app/presentation/home/widgets/series_movie.dart';
import 'package:kk_movie_app/presentation/home/widgets/single_movie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey(context.watch<LanguageCubit>().state),
      appBar: BaseAppBar(title: Text(S.current.home)),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            spacing: 10.0,
            children: [
              BannerMovie(),
              SingleMovie(),
              SeriesMovie(),
              CartoonMovie(),
            ],
          ),
        ),
      ),
    );
  }
}
