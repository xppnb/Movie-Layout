import 'package:china_model_d/Page/SecondPage.dart';
import 'package:china_model_d/Utils/Constant.dart';
import 'package:china_model_d/Utils/NavigatorUtils.dart';
import 'package:china_model_d/Utils/TextStyle.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  TabController tabController;
  PageController pageController;

  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: tabList.length, vsync: this);
    pageController = new PageController(
        initialPage: 1, keepPage: true, viewportFraction: 0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          top(),
          tab(),
          movieTypeWidget(),
          pageView(),
          scoreWidget(),
        ],
      ),
    );
  }

  ///顶部
  Widget top() {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu),
          Icon(Icons.search),
        ],
      ),
    );
  }

  ///TabBar
  Widget tab() {
    return Container(
      height: 50,
      child: TabBar(
          controller: tabController,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.black,
          indicatorColor: Colors.red,
          isScrollable: true,
          tabs: tabList
              .map((e) => Container(height: 30, child: Text(e)))
              .toList()),
    );
  }

  ///类型
  Widget movieTypeWidget() {
    return Container(
      width: double.infinity,
      height: 50,
      child: TabBarView(
          controller: tabController,
          physics: NeverScrollableScrollPhysics(),
          children: movieType.map((e) {
            return Container(
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  print(e[index]);
                  return Container(
                    width: 50,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(e[index]),
                  );
                },
                itemCount: e.length,
              ),
            );
          }).toList()),
    );
  }

  Widget pageView() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.all(20),
      child: PageView.builder(
        itemBuilder: pageViewBuilder,
        itemCount: imgList.length,
        controller: pageController,
        onPageChanged: (int index) {
          if (currentIndex != index) {
            setState(() {
              currentIndex = index;
            });
            // pageController.animateToPage(currentIndex,
            //     duration: Duration(milliseconds: 1000),
            //     curve: Curves.easeInOut);
          }
        },
      ),
    );
  }

  Widget pageViewBuilder(BuildContext context, int index) {
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: () {
              print(index);
              NavigatorUtils.push(
                  context,
                  SecondPage(
                    index: index,
                  ));
            },
            child: Image.network(
              imgList[index],
              fit: BoxFit.contain,
            ),
          )),
    );
  }

  ///评分模块
  Widget scoreWidget() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            tabList[currentIndex],
            style: testStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getStar(),
              SizedBox(
                width: 8,
              ),
              Text(
                scoreList[currentIndex] + "分",
                style: testStyle2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getStar() {
    List<String> starList2 = [];
    starList2.length = starList[currentIndex];
    return Row(
      children: starList2
          .map((e) => Icon(
                Icons.star,
                color: Colors.red,
              ))
          .toList(),
    );
  }
}
