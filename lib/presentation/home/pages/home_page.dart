import 'package:flutter/material.dart';
import 'package:kk_movie_app/common/widgets/base_app_bar.dart';
import 'package:kk_movie_app/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text((S.current.home))),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [Center(child: Text('Home Screen'))]),
        ),
      ),
    );
  }
}
