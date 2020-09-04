import 'package:flutter/material.dart';
import 'package:flutterbookstore/helper/constant.dart';

class TabItem extends StatefulWidget {
  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  List<String> _listItem = ["Newest", "Best Seller", "Sale"];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
          itemCount: _listItem.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _item(index);
          }),
    );
  }

  Widget _item(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          Constant.indexName = _listItem[index];
          print(Constant.indexName);
        });
      },
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _listItem[index],
              style: TextStyle(
                  fontSize: Constant.fontRegular1,
                  fontWeight: FontWeight.w500,
                  color: selectedIndex == index
                      ? Constant.greenColor
                      : Colors.grey),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              height: 2,
              width: 40,
              color: selectedIndex == index
                  ? Constant.greenColor
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
