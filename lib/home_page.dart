import 'package:flutter/material.dart';

import 'core/global/colors.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: defaultColor.withOpacity(0.5),
        body: ListView.separated(
          padding: EdgeInsets.only(top: 80, left: 15, right: 15),
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.grey[300],
            indent: 5,
            endIndent: 5,
          ),
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Container(
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: defaultColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(_items[index].title),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, _items[index].page);
              },
            );
          },
        ));
  }

  final _items = [
    ListItem(
      title: "Cat vs Dog",
      page: "/cat_vs_dog",
    ),
    ListItem(
      title: "not implemented pages",
      page: "/cat_vs_dog",
    ),
  ];
}

class ListItem {
  final String title;
  final String page;

  ListItem({
    @required this.title,
    @required this.page,
  });
}
