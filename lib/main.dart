import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_1/views/components/cart.dart';
import 'package:outcaster_1/views/components/products.dart';
import 'package:outcaster_1/views/components/search.dart';
import './models/Globals.dart';

void main() {
  runApp(
    ShoppingApp(),
  );
}

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({super.key});

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  int cupertinoindex = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(
              "Cupertino Store",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          child: Column(
            children: [
              Spacer(),
              
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  IndexedStack(
                    index: cupertinoindex,
                    children: [
                      Products(),
                      search(),
                      Cart(),
                    ],
                  ),
                  CupertinoTabBar(
                    currentIndex: cupertinoindex,
                    onTap: (val) {
                      setState(() {
                        cupertinoindex = val;
                      });
                      // tabController.animateTo(val);
                      // pagecontroller.animateToPage(val,
                      //     duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                    },
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.home), label: "Products"),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.search), label: "Search"),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.shopping_cart),
                          label: "Cart"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
