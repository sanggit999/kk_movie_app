import 'package:flutter/material.dart';
import 'package:kk_movie_app/common/widgets/shimmer/card_shimmer.dart';

class ListViewShimmer extends StatelessWidget {
  const ListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return const CardShimmer();
        },
        separatorBuilder: (_, _) => const SizedBox(width: 8.0),
        itemCount: 6,
      ),
    );;
  }
}
