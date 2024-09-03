import 'package:flutter/material.dart';

import '../../../../config/theme/fonts.dart';
import '../../domain/entities/movie_entity.dart';

class TempWidget extends StatelessWidget {
  final List<MovieEntity> movieList;
  const TempWidget({super.key, required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8,top: 12),
      child: SizedBox(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [ 
            ...movieList.map((item) => InkWell(
              onTap: () {
              },
              child: Card(child: Text(item.title!.toString(),style: TRestFonts.mainB32,),)))
          ],
        ),
      ),
    );
  }
}
