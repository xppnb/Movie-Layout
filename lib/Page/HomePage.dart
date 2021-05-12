import 'package:china_model_d2/Constant.dart';
import 'package:china_model_d2/Page/DetailsScreem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  PageController pageController;
  int initPage = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController =
        PageController(initialPage: initPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            categoryList(),
            Container(
              height: 36,
              margin: EdgeInsets.symmetric(vertical: kDeFaultPadding / 2),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GenreCard(
                    genre: genres[index],
                  );
                },
                itemCount: genres.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
              ),
            ),
            movieCarousel(),
          ],
        ),
      ),
    );
  }

  ///顶部视图
  Widget categoryList() {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: kDeFaultPadding / 2),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildText(index, context),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  ///顶部视图List
  Widget buildText(int index, BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDeFaultPadding),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.w600,
                  color: currentIndex == index
                      ? kTextColor
                      : Colors.black.withOpacity(0.4)),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: kDeFaultPadding / 2,
              ),
              height: 6,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == currentIndex
                    ? kSecondaryColor
                    : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget genreCard() {}

  Widget genreList(BuildContext context, int index) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: kDeFaultPadding, vertical: kDeFaultPadding / 4),
      margin: EdgeInsets.symmetric(horizontal: kDeFaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genres[index],
        style: TextStyle(color: kTextColor.withOpacity(0.8), fontSize: 16),
      ),
    );
  }

  Widget movieCarousel() {
    // int x = 1;
    // x = (x * 80).clamp(-1, 10);
    // print(x.toString());
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDeFaultPadding),
      child: AspectRatio(
          aspectRatio: 8 / 8.3,
          child: PageView.builder(
              physics: ClampingScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  initPage = value;
                });
              },
              controller: pageController,
              itemCount: movieList.length,
              itemBuilder: (context, index) => buildMovieSlider(index))),
    );
  }

  Widget buildMovieSlider(int index) => AnimatedBuilder(
        builder: (context, child) {
          double value = 0;
          if (pageController.position.haveDimensions) {
            value = index - pageController.page;
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: initPage == index ? 1 : 0.4,
            child: Transform.rotate(
              child: moviePage(movieList[index]),
              angle: math.pi * value, //旋转角度
            ),
          );
        },
        animation: pageController,
      );

  Widget moviePage(Movie movie) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailsScreen(
              movie: movie,
            );
          },
        ));
      },
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDeFaultPadding),
          child: buildMovieCard(movie)),
    );
  }

  Column buildMovieCard(Movie movie) {
    return Column(
      children: [
        Expanded(
            child: Hero(
          tag: movie.img,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(movie.img),
                ),
                boxShadow: [kDefaultShadow]),
          ),
        )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: kDeFaultPadding / 2),
          child: Text(
            movie.title,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow[800],
              size: 25,
            ),
            SizedBox(width: kDeFaultPadding / 2),
            Text(movie.score, style: Theme.of(context).textTheme.bodyText2),
          ],
        ),
      ],
    );
  }
}

class GenreCard extends StatelessWidget {
  final String genre;

  const GenreCard({Key key, this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: kDeFaultPadding, vertical: kDeFaultPadding / 4),
      margin: EdgeInsets.symmetric(horizontal: kDeFaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genre,
        style: TextStyle(color: kTextColor.withOpacity(0.8), fontSize: 16),
      ),
    );
  }
}
