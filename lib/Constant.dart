import 'package:flutter/material.dart';

const kSecondaryColor = Color(0xFFFE6D8E);
const kTextColor = Color(0xFF12153D);
const kTextLightColor = Color(0xFF9A9BB2);
const kFillStarColor = Color(0XFFFCC419);

const kDeFaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
    offset: Offset(0, 4),
    blurRadius: 4,
    color: Colors.black26,
    spreadRadius: 5);

const List<String> categories = ["In Theater", "Box Office", "Coming Soon"];
const List<String> genres = [
  "Action",
  "Crime",
  "Comedy",
  "Drama",
  "Horror",
  "Animation"
];
const String sentence =
    "If a reader is lost, it is generally because the writer has not been careful enough to keep him on the path. This carelessness can take any number of forms. Perhaps a sentence is so excessively cluttered that the reader.";

List<Movie> movieList = [
  Movie(
      img:
          "https://img2.doubanio.com/view/photo/s_ratio_poster/public/p480747492.jpg",
      score: "9.7",
      title: "Ford v Ferrari",
      rateScore: "87",
      genre: [
        "Action",
        "Crime",
        "Comedy",
      ],
      actorImg: [
        "https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/forum/w=580/sign=b6cd11f3b251f819f1250342eab64a76/a271ae51f3deb48f038b3606f21f3a292ff57897.jpg",
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=600567618,606487767&fm=26&gp=0.jpg",
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2746022019,1637618154&fm=26&gp=0.jpg",
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1133192067,693494649&fm=11&gp=0.jpg"
      ],
      actorName: [
        "蒂姆",
        "摩根",
        "鲍勃",
        "威廉姆"
      ],
      actorType: [
        "Director",
        "Carroll",
        "Ken Miles",
        "Mollie"
      ]),
  Movie(
      img:
          "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2141185978.jpg",
      score: "9.8",
      title: "Ford v Ferrari",
      rateScore: "77",
      genre: [
        "Drama",
        "Horror",
        "Animation"
      ],
      actorImg: [
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=511226008,731630792&fm=11&gp=0.jpg",
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=74857862,3700563021&fm=11&gp=0.jpg",
        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3100174398,2440010837&fm=26&gp=0.jpg",
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=675141459,4240350870&fm=26&gp=0.jpg"
      ],
      actorName: [
        "马小刚",
        "含笑",
        "吴雨珏",
        "朱颜曼滋"
      ],
      actorType: [
        "Director",
        "Carroll",
        "Ken Miles",
        "Mollie"
      ]),
  Movie(
      img:
          "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2539779201.jpg",
      score: "9.9",
      title: "Ford v Ferrari",
      rateScore: "67",
      genre: [
        "Comedy",
        "Drama",
        "Horror",
      ],
      actorImg: [
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3393390906,3130758319&fm=26&gp=0.jpg",
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2737505410,1534826472&fm=26&gp=0.jpg",
        "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/d4628535e5dde711a0c43865acefce1b9d16610a.jpg",
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1891400972,3659016767&fm=26&gp=0.jpg"
      ],
      actorName: [
        "罗永昌",
        "池内博之",
        "雅玫",
        "刘承俊"
      ],
      actorType: [
        "Director",
        "Carroll",
        "Ken Miles",
        "Mollie"
      ]),
];

class Movie {
  String img;
  String score;
  String title;
  String rateScore;
  List<String> genre;
  List<String> actorImg;
  List<String> actorName;
  List<String> actorType;

  Movie(
      {this.img,
      this.score,
      this.title,
      this.rateScore,
      this.genre,
      this.actorImg,
      this.actorName,
      this.actorType});
}
