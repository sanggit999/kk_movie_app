import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardShimmer extends StatelessWidget {
  final bool isBanner;
  const CardShimmer({super.key, this.isBanner = false});

  @override
  Widget build(BuildContext context) {
    return isBanner
        ? Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Container(
        width: double.infinity,
        height: 300.0,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    )
        : Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: SizedBox(
        width: 180.0,
        height: 300.0,
        child: ListView(
          children: [
            Container(
              height: 240.0,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            const SizedBox(height: 6.0),
            Container(
              width: 120.0,
              height: 20.0,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            const SizedBox(height: 6.0),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 60.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}