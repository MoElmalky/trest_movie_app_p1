import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../util/constants.dart';

class ClickablePoster extends StatelessWidget {
  final String posterPath;
  final void Function() onTap;
  const ClickablePoster(
      {super.key, required this.posterPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                  '$imagesLowBaseUrl$posterPath',
                ),
                fit: BoxFit.cover),
          ),
          height: 300,
          width: 200,
          child: InkWell(
            onTap: onTap,
            child: const SizedBox(
              width: 200,
              height: 300,
            ),
          ),
        ),
      ),
    );
  }
}
