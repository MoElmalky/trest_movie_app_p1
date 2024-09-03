import 'package:flutter/material.dart';

import '../../../../core/common/background_container.dart';


class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( 
        children: [ 
          BackgroundContainer(),
          
        ],
      ),
    );
  }
}