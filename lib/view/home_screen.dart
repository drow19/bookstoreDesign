import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookstore/helper/constant.dart';
import 'package:flutterbookstore/model/recommendation.dart';
import 'package:flutterbookstore/view/detail_book_screen.dart';
import 'package:flutterbookstore/widget/StarDisplay.dart';
import 'package:flutterbookstore/widget/tab_item_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _userAppbar(),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommendations",
                    style: TextStyle(
                        fontSize: Constant.fontReg,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontSize: Constant.fontRegular1, color: Constant.greenColor, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 300,
              child: ListView.builder(
                  itemCount: recommendationList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _listRecommendation(recommendationList[index]);
                  }),
            ),
            Divider(
              thickness: 3,
              color: Constant.dividerColor,
            ),
            TabItem(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${Constant.indexName}",
                    style: TextStyle(
                        fontSize: Constant.fontReg,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontSize: Constant.fontRegular1, color: Constant.greenColor, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 300,
              child: ListView.builder(
                  itemCount: bestSellerList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _bestSeller(bestSellerList[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bestSeller(Recommendations bestSellerList){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          bestSellerList.image,
          width: 160,
          height: 220,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _listRecommendation(Recommendations recommendations) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => DetailScreen(
              images: recommendations.image,
              title: recommendations.title,
              author: recommendations.author,
              price: recommendations.price,
            )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                recommendations.image,
                width: 160,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              recommendations.title,
              style: TextStyle(fontSize: Constant.fontRegular1, color: Color(0xff333333)),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              recommendations.author,
              style: TextStyle(fontSize: Constant.fontSmall, color: Constant.fontColor),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  recommendations.price,
                  style: TextStyle(fontSize: Constant.fontSmall, color: Constant.greenColor),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: StarDisplayWidget(
                    color: Constant.yellowColor,
                    size: 12,
                    value: 4,
                    marginFactor: 10,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _userAppbar() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset("images/user_poto.jpg")),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Hi, Drow !",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 14),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  width: 80,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff0FB269)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Promo",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xffffffff)),
                        child: Text(
                          "%",
                          style:
                              TextStyle(color: Color(0xff0FB269), fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                    child: Image.asset(
                  "images/ic_fav.png",
                  height: 24,
                  width: 24,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
