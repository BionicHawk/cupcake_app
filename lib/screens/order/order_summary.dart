import 'package:cupcake_app/common/DTO/selling_item.dart';
import 'package:cupcake_app/common/dialogs.dart';
import 'package:cupcake_app/common/flavors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderSummary extends StatefulWidget {
  final SellingItem order;
  const OrderSummary({super.key, required this.order});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  String flavor = "";
  DateFormat formatter = DateFormat('EEE MMMM dd');

  @override
  void initState() {
    super.initState();
    switch (widget.order.flavor) {
      case Flavors.vanilla:
        flavor = "Vanilla";
        break;
      case Flavors.chocolate:
        flavor = "Chocolate";
        break;
      case Flavors.redVelvet:
        flavor = "Red";
        break;
      case Flavors.saltedCaramel:
        flavor = "Salted Caramel";
        break;
      case Flavors.coffee:
        flavor = "Coffee";
        break;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Summary")),
      body: ListView(children: [
        SizedBox(
          child: Column(children: [
            InfoLabel(
                labelName: "QUANTITY",
                infoText: widget.order.quantity.toString()),
            InfoLabel(
              labelName: "FLAVOR",
              infoText: flavor,
            ),
            InfoLabel(
                labelName: "PICKUP DATE",
                infoText: formatter.format(widget.order.date)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("TOTAL: \$${widget.order.total.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 15))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan.shade900),
                      onPressed: () async {
                        await showInfo(context, "I send your request",
                            "The order has been sended to the bakery");
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "SEND ORDER",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel",
                        style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            )
          ]),
        )
      ]),
    );
  }
}

class InfoLabel extends StatelessWidget {
  final String labelName;
  final String infoText;

  const InfoLabel({super.key, required this.labelName, required this.infoText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(labelName, style: const TextStyle(fontSize: 16)),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(infoText,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        const Divider(height: 10)
      ],
    );
  }
}
