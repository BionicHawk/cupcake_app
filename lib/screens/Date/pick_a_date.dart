import 'package:cupcake_app/common/DTO/selling_item.dart';
import 'package:cupcake_app/common/customized_text.dart';
import 'package:cupcake_app/common/flavors.dart';
import 'package:cupcake_app/screens/order/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PickDate extends StatefulWidget {
  final int quantity;
  final Flavors flavor;
  final double subtotal;

  const PickDate(
      {super.key,
      required this.quantity,
      required this.flavor,
      required this.subtotal});

  @override
  State<PickDate> createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  int? selected;
  double realPrice = 0.0;
  DateFormat formatter = DateFormat('EEE MMMM dd');

  List<DateTime> dates = [
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now()
  ];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < dates.length; i++) {
      dates[i] = dates[i].add(Duration(days: i));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var firstDateR = ListTile(
      title: CustomizedText(text: formatter.format(dates[0])),
      leading: Radio<int>(
        activeColor: Colors.cyan,
        value: 0,
        groupValue: selected,
        onChanged: (value) {
          setState(() {
            realPrice = widget.subtotal + 3.0;
            selected = value;
          });
        },
      ),
    );

    var secondDateR = ListTile(
      title: CustomizedText(text: formatter.format(dates[1])),
      leading: Radio<int>(
        activeColor: Colors.cyan,
        value: 1,
        groupValue: selected,
        onChanged: (value) {
          setState(() {
            realPrice = widget.subtotal;
            selected = value;
          });
        },
      ),
    );

    var thirdDateR = ListTile(
      title: CustomizedText(text: formatter.format(dates[2])),
      leading: Radio<int>(
        activeColor: Colors.cyan,
        value: 2,
        groupValue: selected,
        onChanged: (value) {
          setState(() {
            realPrice = widget.subtotal;
            selected = value;
          });
        },
      ),
    );
    var fourthDateR = ListTile(
      title: CustomizedText(text: formatter.format(dates[3])),
      leading: Radio<int>(
        activeColor: Colors.cyan,
        value: 3,
        groupValue: selected,
        onChanged: (value) {
          setState(() {
            realPrice = widget.subtotal;
            selected = value;
          });
        },
      ),
    );

    var fifthDateR = ListTile(
      title: CustomizedText(text: formatter.format(dates[4])),
      leading: Radio<int>(
        activeColor: Colors.cyan,
        value: 4,
        groupValue: selected,
        onChanged: (value) {
          setState(() {
            realPrice = widget.subtotal;
            selected = value;
          });
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Pickup date"),
      ),
      body: ListView(
        children: [
          Column(children: [
            firstDateR,
            secondDateR,
            thirdDateR,
            fourthDateR,
            fifthDateR
          ]),
          const Divider(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Subtotal: \$${realPrice.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 20),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 15))
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 150,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel",
                          style: TextStyle(color: Colors.white)))),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan.shade900),
                  onPressed: () {
                    if (selected == null) {
                      return;
                    }
                    Navigator.pop(context);
                    final data = SellingItem(
                        flavor: widget.flavor,
                        quantity: widget.quantity,
                        date: dates[selected!],
                        total: realPrice);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderSummary(order: data)));
                  },
                  child:
                      const Text("Next", style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
