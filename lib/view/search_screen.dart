import 'package:flutter/material.dart';
import 'package:flutterbookstore/helper/constant.dart';
import 'package:flutterbookstore/model/category.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Search",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Constant.blackColor),
              ),
            ),
            _search(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Browse by categories",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w400)),
            ),
           Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 15),
                      itemCount: listCategory.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return _categoryTile(listCategory[index]);
                      })),

          ],
        ),
      ),
    );
  }

  Widget _search() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(6),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          InkWell(
              child: Container(
                  child: Icon(
            Icons.search,
            color: Constant.fontColor,
          ))),
          SizedBox(
            width: 8,
          ),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                hintText: "Books, or Authors",
                hintStyle: TextStyle(fontSize: Constant.fontRegular1),
                border: InputBorder.none),
          )),
        ],
      ),
    );
  }

  Widget _categoryTile(Category category) {
    return Container(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              category.img,
              width: 164,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 164,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(4)),
            child: Text(
              category.name,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
