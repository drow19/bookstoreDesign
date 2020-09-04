import 'package:flutter/material.dart';
import 'package:flutterbookstore/helper/constant.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookstore/widget/StarDisplay.dart';

class DetailScreen extends StatefulWidget {
  final String images;
  final String title;
  final String author;
  final String price;

  DetailScreen({this.images, this.title, this.price, this.author});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _press = false;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Constant.blackColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Center(
          child: Text(
            "Detail Book",
            style: TextStyle(fontSize: 14, color: Constant.blackColor),
          ),
        ),
        actions: [
          IconButton(
              icon: Image.asset(
                "images/bottom_nav_ic_cart.png",
                color: Constant.blackColor,
              ),
              onPressed: null),
          SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Column(
        children: [
          _imagesBook(_size),
          _title(),
          SizedBox(
            height: 16,
          ),
          Divider(
            thickness: 3,
            color: Constant.dividerColor,
          ),
          Description()
        ],
      ),
    );
  }

  Widget _imagesBook(Size size) {
    return Container(
      height: size.height / 3,
      alignment: Alignment.center,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(widget.images)),
    );
  }

  Widget _title() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(widget.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.author),
                StarDisplayWidget(
                  color: Constant.yellowColor,
                  size: 12,
                  value: 4,
                  marginFactor: 10,
                ),
              ],
            ),
            trailing: GestureDetector(
              onTap: () {
                setState(() {
                  if (_press == false) {
                    _press = true;
                  } else {
                    _press = false;
                  }
                });
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: _press ? Constant.redColor : Colors.grey,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.price,
              style: TextStyle(fontSize: 16, color: Constant.greenColor),
            ),
          )
        ],
      ),
    );
  }
}

class Description extends StatefulWidget {
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  List<String> _listItem = ["Summary", "Description"];

  int selectedIndex = 0;
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            child: ListView.builder(
                itemCount: _listItem.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _descTile(index);
                }),
          ),
          SizedBox(
            height: 8,
          ),
          selectedIndex == 0 ? Summary() : DetailDescription(),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [_cartCounter(), _buttonBuy()],
          )
        ],
      ),
    );
  }

  Widget _cartCounter() {
    return Container(
      width: 180,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      margin: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
          color: Color(0xffe0e0e0), borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Container(
            width: 40,
            alignment: Alignment.center,
            child: Text(
              "QTY",
              style: TextStyle(
                  fontSize: Constant.fontRegular1, color: Constant.fontColor),
            ),
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.grey,
          ),
          GestureDetector(
            onTap: () {
              if (numOfItems > 0) {
                setState(() {
                  numOfItems--;
                });
              }
            },
            child: SizedBox(
              width: 40,
              child: Container(
                child: Icon(Icons.remove),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14 / 2),
            child: Text(numOfItems.toString().padLeft(2, ""),
                style: TextStyle(fontSize: 20, color: Constant.greenColor)),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                numOfItems++;
              });
            },
            child: SizedBox(
              width: 40,
              child: Container(
                child: Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonBuy() {
    return Container(
      height: 50,
      width: 139,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Constant.greenColor, borderRadius: BorderRadius.circular(4)),
      child: Text(
        "Buy This Book",
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }

  Widget _descTile(int index) {
    print(selectedIndex);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

class DetailDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        Constant.description,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text("summary"),
    );
  }
}
