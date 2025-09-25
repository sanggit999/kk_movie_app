import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/common/cubit/language_cubit.dart';
import 'package:kk_movie_app/common/widgets/appbar/base_app_bar.dart';
import 'package:kk_movie_app/l10n/l10n.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<LanguageCubit>().state;

    return Scaffold(
      appBar: BaseAppBar(
        hideLeading: false,
        centerTitle: false,
        title: Text(S.current.language),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                S.current.english,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: currentLocale.languageCode == 'en'
                  ? Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )
                  : null,
              onTap: () {
                context.read<LanguageCubit>().setLocale(const Locale('en'));
              },
            ),
            ListTile(
              title: Text(
                S.current.vietnamese,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: currentLocale.languageCode == 'vi'
                  ? Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )
                  : null,
              onTap: () {
                context.read<LanguageCubit>().setLocale(const Locale('vi'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
