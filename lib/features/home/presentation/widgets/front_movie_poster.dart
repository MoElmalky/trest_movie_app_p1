import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/fonts.dart';
import '../../../../core/common/auto_scroller.dart';
import '../../../../core/util/constants.dart';

class FrontMoviePoster extends StatelessWidget {
  final String posterPath;
  final String title;
  final List<int> genreIds;
  const FrontMoviePoster({super.key, required this.posterPath, required this.title, required this.genreIds});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
                Colors.transparent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: CachedNetworkImage(
            imageUrl:  '$imagesBaseUrl$posterPath',
            height: MediaQuery.of(context).size.width * 1.5,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.width * 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: AutoScroller(
                      scrollDirection: Axis.horizontal,
                      backCurve: Curves.fastOutSlowIn,
                      reverse: true,
                      child: Text(
                        title,
                        style: TRestFonts.mainB32,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16,bottom: 8),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: AutoScroller(
                      reverse: true,
                      forwardDuration: const Duration(seconds: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...genreIds.map((id) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  decoration: BoxDecoration( 
                                    color: Colors.white12,
                                    borderRadius: BorderRadius.circular(16)
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    genres[id]!,
                                    style: TRestFonts.faintN16,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            )),
      ],
    );
  }
}
