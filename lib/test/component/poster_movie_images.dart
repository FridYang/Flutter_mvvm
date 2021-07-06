import 'package:flutter/material.dart';
import 'package:kaboshi_flutter_project/test/model/movie.dart';

class PosterMovieImages extends StatelessWidget {
  final Movie movie;

  const PosterMovieImages({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          movie.fullImageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ],
    );
  }
}
