import 'package:flutter/material.dart';

import '../../config/theme/colors.dart';
import '../../config/theme/fonts.dart';


class ErrorDisplayer extends StatelessWidget {
  final String message;
  const ErrorDisplayer(
      {super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 150,
      ),
      const Icon(
        Icons.error_outline_sharp,
        size: 100,
        color: TRestColors.tertiary,
      ),
      const SizedBox(
        height: 50,
      ),
      Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TRestFonts.mainB28,
        ),
      )
    ]);
  }
}
