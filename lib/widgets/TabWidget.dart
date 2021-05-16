import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final int length;
  final String title;
  final List<Widget> viewItems;
  final List<Tab> tabItems;
  const TabWidget({Key key, this.length, this.title,this.viewItems,this.tabItems}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: length, child: Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          isScrollable: true,
          tabs: tabItems
        )
      ),
      body: TabBarView(
        children: viewItems
      )
    )
    );
  }
}