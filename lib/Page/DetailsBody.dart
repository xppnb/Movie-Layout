import 'package:china_model_d2/Page/HomePage.dart';
import 'package:china_model_d2/Page/title_duration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Constant.dart';

class DetailsBody extends StatefulWidget {
  Movie movie;

  DetailsBody({this.movie});

  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          child: Column(children: [
        backDrop(size),
        title_duration(widget: widget),
        genres(widget: widget),
        plotSummary(context),
        CastAndCrew(
          movie: widget.movie,
        ),
      ])),
    );
  }

  Padding plotSummary(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDeFaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Plot Summary",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: kDeFaultPadding / 2,
                ),
                Text(
                  sentence,
                  style: TextStyle(color: Color(0xFF737599)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget backDrop(Size size) {
    return Column(
      children: [
        Container(
          height: size.height * 0.4,
          child: Stack(
            children: [
              Hero(
                tag: widget.movie.img,
                child: Container(
                  height: size.height * 0.4 - 50,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50)),
                    image: DecorationImage(
                        image: NetworkImage(widget.movie.img),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                child: Card(
                  child: Container(
                      width: size.width * 0.9,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow[800],
                                size: 25,
                              ),
                              SizedBox(
                                height: kDeFaultPadding / 4,
                              ),
                              RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                      TextSpan(
                                          text: widget.movie.score + "/",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                      TextSpan(
                                        text: "10\n",
                                      ),
                                      TextSpan(
                                        text: "150,212",
                                        style:
                                            TextStyle(color: kTextLightColor),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_border,
                                size: 30,
                              ),
                              SizedBox(
                                height: kDeFaultPadding / 4,
                              ),
                              Text(
                                "Rate This",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  widget.movie.rateScore,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFF51CF66),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                padding: EdgeInsets.all(6),
                              ),
                              SizedBox(
                                height: kDeFaultPadding / 4,
                              ),
                              Text(
                                "Metascore",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              Text(
                                "62 critic reviews",
                                style: TextStyle(color: kTextLightColor),
                              ),
                            ],
                          )
                        ],
                      )),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  )),
                  elevation: 6,
                ),
                bottom: 0,
                right: -4,
              ),
              SafeArea(
                  child: BackButton(
                color: Colors.white,
              )),
            ],
          ),
        )
      ],
    );
  }
}

class genres extends StatelessWidget {
  const genres({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final DetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDeFaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GenreCard(
              genre: widget.movie.genre[index],
            );
          },
          itemCount: widget.movie.genre.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class CastAndCrew extends StatefulWidget {
  Movie movie;

  CastAndCrew({this.movie});

  @override
  _CastAndCrewState createState() => _CastAndCrewState();
}

class _CastAndCrewState extends State<CastAndCrew> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDeFaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast & Crew",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => CastCard(
                actorImg: widget.movie.actorImg[index],
                actorName: widget.movie.actorName[index],
                actorType: widget.movie.actorType[index],
              ),
              itemCount: widget.movie.actorImg.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class CastCard extends StatefulWidget {
  String actorImg;
  String actorName;
  String actorType;

  CastCard({this.actorImg, this.actorName, this.actorType});

  @override
  _CastCardState createState() => _CastCardState();
}

class _CastCardState extends State<CastCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: kDeFaultPadding * 2.5),
      width: 50,
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(widget.actorImg), fit: BoxFit.cover),
            ),
          ),
          Text(
            widget.actorName,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          Text(
            widget.actorType,
            style: TextStyle(fontSize: 8, color: kTextLightColor),
            textAlign: TextAlign.center,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
