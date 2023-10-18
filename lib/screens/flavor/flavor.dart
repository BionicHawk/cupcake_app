import 'package:cupcake_app/common/Dialogs.dart';
import 'package:cupcake_app/common/customized_text.dart';
import 'package:cupcake_app/screens/Date/pick_a_date.dart';
import 'package:flutter/material.dart';
import 'package:cupcake_app/common/flavors.dart';

class FlavorPage extends StatefulWidget {
  final int quantity;
  const FlavorPage({super.key, required this.quantity});

  @override
  State<FlavorPage> createState() => _FlavorPageState();
}

class _FlavorPageState extends State<FlavorPage> {
  Flavors? selected;
  static const cupCost = 2.0;
  static var subtotal = 0.0;

  @override
  void initState() {
    subtotal = cupCost * widget.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vanillaOption = ListTile(
      title: const CustomizedText(text: "Vanilla"),
      leading: Radio<Flavors>(
        activeColor: const Color.fromARGB(255, 255, 214, 118),
        value: Flavors.vanilla,
        groupValue: selected,
        onChanged: (flavor) => {
          setState(() {
            selected = flavor;
          })
        },
      ),
    );

    final chocolateOption = ListTile(
      title: const CustomizedText(text: "Chocolate"),
      leading: Radio<Flavors>(
        activeColor: Colors.brown.shade600,
        value: Flavors.chocolate,
        groupValue: selected,
        onChanged: (flavor) => {
          setState(() {
            selected = flavor;
          })
        },
      ),
    );

    final redVelvetOption = ListTile(
      title: const CustomizedText(text: "Red Velvet"),
      leading: Radio<Flavors>(
        activeColor: const Color.fromARGB(255, 118, 3, 3),
        value: Flavors.redVelvet,
        groupValue: selected,
        onChanged: (flavor) => {
          setState(() {
            selected = flavor;
          })
        },
      ),
    );

    final saltedCaramelOption = ListTile(
      title: const CustomizedText(text: "Salted Caramel"),
      leading: Radio<Flavors>(
        activeColor: const Color.fromARGB(255, 195, 110, 13),
        value: Flavors.saltedCaramel,
        groupValue: selected,
        onChanged: (flavor) => {
          setState(() {
            selected = flavor;
          })
        },
      ),
    );

    final coffeeOption = ListTile(
      title: const CustomizedText(text: "Coffee"),
      leading: Radio<Flavors>(
        activeColor: Colors.brown.shade700,
        value: Flavors.coffee,
        groupValue: selected,
        onChanged: (flavor) => {
          setState(() {
            selected = flavor;
          })
        },
      ),
    );

    const middleMargin = Padding(padding: EdgeInsets.symmetric(horizontal: 10));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose a flavor"),
      ),
      body: ListView(children: [
        Column(
          children: [
            vanillaOption,
            chocolateOption,
            redVelvetOption,
            saltedCaramelOption,
            coffeeOption
          ],
        ),
        const Divider(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Subtotal: \$${subtotal.toStringAsFixed(2)}",
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
            middleMargin,
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan.shade900),
                onPressed: () {
                  if (selected == null) {
                    showInfo(context, "Please choose a flavor",
                        "You can't proceed without choosing a flavor");
                    return;
                  }
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PickDate(
                                quantity: widget.quantity,
                                flavor: selected!,
                                subtotal: subtotal,
                              )));
                },
                child:
                    const Text("Next", style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        )
      ]),
    );
  }
}
