import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/theme/colors.dart';

class MovieListLoadVisual extends StatelessWidget {
  const MovieListLoadVisual({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.transparent,
      highlightColor: TRestColors.tertiary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white),
                ),
                Container(
                  height: 20,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          ClipRect(
            child: SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          height: 300,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                          height: 300,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}