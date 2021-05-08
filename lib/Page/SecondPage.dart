import 'package:china_model_d/Utils/Constant.dart';
import 'package:china_model_d/Utils/TextStyle.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  int index;

  SecondPage({this.index});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SecondBody(
        index: widget.index,
      ),
    );
  }
}

class SecondBody extends StatefulWidget {
  int index;

  SecondBody({this.index});

  @override
  _SecondBodyState createState() => _SecondBodyState();
}

class _SecondBodyState extends State<SecondBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Column(
          children: [
            topImage(),
            introduct(),
          ],
        ),
        Positioned(
          child: stackWidget(),
          top: 140,
          left: 20,
        ),
      ],
    ));
  }

  ///顶部图片
  Widget topImage() {
    return Container(
      width: double.infinity,
      height: 180,
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
        child: Image.network(
          imgList[widget.index],
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  ///悬浮框
  Widget stackWidget() {
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Container(
        width: 400,
        height: 60,
        padding: EdgeInsets.only(
          left: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("xxx"),
                Text("xxx"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.red,
                  size: 18,
                ),
                Text("xxx"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text("xxx"),
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  padding: EdgeInsets.all(5),
                ),
                Text("xxx"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///介绍
  Widget introduct() {
    return Container(
      margin: EdgeInsets.only(
        top: 50,
        left: 10,
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "介绍:",
              style: testStyle3,
            ),
            padding: EdgeInsets.only(left: 8),
          ),
          Card(
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Text(introduceList[widget.index])),
          ),
          Container(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              "演职人员:",
              style: testStyle3,
            ),
          ),
          Card(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Container(
                width: 400,
                height: 180,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ClipOval(
                              child: Image.network(
                                actorImage[index],
                                fit: BoxFit.cover,
                                width: 80,
                                height: 80,
                              ),
                            ),
                            // child: CircleAvatar(
                            //   child: Image.network(
                            //     actorImage[index],
                            //     fit: BoxFit.contain,
                            //     width: 80,
                            //     height: 80,
                            //   ),
                            //   radius: 50,
                            // ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(actorName[widget.index][index].toString(),style:testStyle4 ,),
                          SizedBox(
                            height: 10,
                          ),
                          Text(actorType[widget.index][index],style: testStyle5,),
                          // ClipOval(child: Image.network(actorImage[index],fit: BoxFit.contain,width: 50,height: 100,),),
                        ],
                      ),
                    );
                  },
                  itemCount: actorName[widget.index].length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
