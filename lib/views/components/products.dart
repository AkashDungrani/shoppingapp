import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/Globals.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 848,
      color: CupertinoColors.extraLightBackgroundGray,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ...Product.map((e) => Container(
                  height: 100,
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // padding: EdgeInsets.all(5),
                        height: 70,
                        width: 80,
                        child: Image.asset(e["image"]),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e["Name"],
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            e["Price"],
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              sum = sum + int.parse(e["Price"]);
                              addtocart.add(e);
                            });
                          },
                          child: Icon(CupertinoIcons.add_circled)),
                    ],
                  ),
                )).toList(),
          ],
        ),
      ),
    );
  }
}
