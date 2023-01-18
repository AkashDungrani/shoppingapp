import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_1/models/Globals.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  DateTime currentdate = DateTime.now();
  TimeOfDay currenttime = TimeOfDay.now();
  List<String> month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "Octomber",
    "November"
        "December",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              child: CupertinoTextField(
                prefix: Icon(
                  CupertinoIcons.person_fill,
                  color: Colors.grey,
                ),
                placeholder: "FirstName",
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300)),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              // padding: EdgeInsets.all(5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: CupertinoTextField(
                prefix: Icon(
                  CupertinoIcons.mail_solid,
                  color: Colors.grey,
                ),
                placeholder: "Email",
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              child: CupertinoTextField(
                prefix: Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                placeholder: "Location",
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300)),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 220,
                        color: Colors.white,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.dateAndTime,
                          onDateTimeChanged: (datetime) {
                            int hour = datetime.hour;
                            int minute = datetime.minute;
      
                            setState(() {
                              currenttime = TimeOfDay(hour: hour, minute: minute);
                            });
                          },
                          initialDateTime: currentdate,
                          maximumYear: 2050,
                          minimumYear: 2000,
                        ),
                      );
                    });
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300)),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.clock, color: Colors.grey),
                    
                    Text(
                        "  ${currentdate.day},${month[currentdate.month - 1]},${currentdate.year}  "),
                        Text(
                      (currenttime.hour > 12)
                          ? "${currenttime.hour - 12}:${currenttime.minute} ${currenttime.period.name}"
                          : "${currenttime.hour}:${currenttime.minute} ${currenttime.period.name}",
                      // "${currentdate.hour},${currentdate.minute},${currentdate.second}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            ...addtocart.map((e) => Container(
              // margin: EdgeInsets.only(top: 20),
              height: 100,
              alignment: Alignment.center,
              child:SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 Row(
                   children: [
                      Container(
                    height: 50,
                    width: 100,
                    child: Image.asset(e["image"]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(e["Name"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                      Text(e["Price"],style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  Spacer(),
                              Text(e["Price"]),
                   ],
                 )
                  
                ],),
              ),
            ),
            
            ).toList(),
      
          //  Text("${sum}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Tax:"),
                  Text("Discount:"),
                  Text("Total:"),

              ],),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("1297"),Text("12000"),Text("${sum - 12000 + 1297}")],),
            ],
          ),

          ],
        ),
      ),
    );
  }
}
