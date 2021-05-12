import 'package:flutter/material.dart';

import '../Constant.dart';
import 'DetailsBody.dart';
class title_duration extends StatelessWidget {
  const title_duration({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final DetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDeFaultPadding),
      child: Row(
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.movie.title,style: Theme.of(context).textTheme.headline5,),
                  SizedBox(height: kDeFaultPadding / 2,),
                  Row(
                    children: [
                      Text(
                        "2019",
                        style: TextStyle(color: kTextLightColor),
                      ),
                      SizedBox(width: kDeFaultPadding),
                      Text(
                        "PG-13",
                        style: TextStyle(color: kTextLightColor),
                      ),
                      SizedBox(width: kDeFaultPadding),
                      Text(
                        "2h 32",
                        style: TextStyle(color: kTextLightColor),
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(
            width: 64,
            height: 64,
            child: FlatButton(
              onPressed: () {},
              child: Icon(Icons.add),
              color: kSecondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
    );
  }
}