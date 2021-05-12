import 'package:flutter/material.dart';

import '../Constant.dart';
import 'DetailsBody.dart';

class DetailsScreen extends StatelessWidget {

  Movie movie;


  DetailsScreen({this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBody(movie: movie,),
    );
  }
}
