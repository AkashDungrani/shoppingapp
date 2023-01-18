import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_1/models/Globals.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: CupertinoColors.systemGrey3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(CupertinoIcons.search),
                SizedBox(width: 10,),
                Text("Mobile"),
                Spacer(),
                Icon(CupertinoIcons.clear_circled)
              ],
            ),
          ),
          ...find.map((e) => Container(
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
                        Icon(CupertinoIcons.add_circled),
                      ],
                    ),
                  )).toList(),
        ],
      ),
    );
  }
}
