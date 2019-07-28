
import 'package:flutter/material.dart';
import 'save_history/save_history.dart';

void main() {
  runApp(MaterialApp(

      title: "Using Tabs",
      home: SwipeRoute()));
}

class SwipeRoute extends StatefulWidget {
  @override
  SwipeRouteState createState() => SwipeRouteState();
}

// SingleTickerProviderStateMixin is used for animation
class SwipeRouteState extends State<SwipeRoute> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return TabBar(
      labelColor: Colors.indigo,
      tabs: <Tab>[
        Tab(
          // set icon to the tab
          icon: Icon(Icons.home),
        ),
        Tab(
          icon: Icon(Icons.mail),
        ),
        Tab(
          icon: Icon(Icons.person),
        ),
      ],
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {  //tabs accpected array
    return TabBarView(
      children: tabs,
      controller: controller,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
        bottomNavigationBar: getTabBar(),
        body: getTabBarView([SaveHistory(),SaveHistory(),SaveHistory()]));
  }
}

