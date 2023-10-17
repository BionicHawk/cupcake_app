import 'package:cupcake_app/screens/flavor/flavor.dart';
import 'package:cupcake_app/screens/home/components/customized_btn.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final cupcakeImg = Image.asset(
    'assets/images/Cupcake.png',
    width: 300,
    height: 300,
  );

  static void goToPage(BuildContext context, Widget page, bool returning) {
    if (!returning) Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    const margin = Padding(padding: EdgeInsets.symmetric(vertical: 30));
    const secondMargin = Padding(padding: EdgeInsets.symmetric(vertical: 10));

    const mainTile = Text(
      "Order Cupcakes",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );

    final menu = SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          CustomizedButton(
            title: "One Cupcake",
            function: () => goToPage(
                context,
                const FlavorPage(
                  quantity: 1,
                ),
                true),
          ),
          CustomizedButton(
            title: "Six Cupcakes",
            function: () =>
                goToPage(context, const FlavorPage(quantity: 6), true),
          ),
          CustomizedButton(
            title: "Twelve Cupcakes",
            function: () =>
                goToPage(context, const FlavorPage(quantity: 12), true),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("CupCake"),
      ),
      body: ListView(children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          margin,
          cupcakeImg,
          margin,
          mainTile,
          secondMargin,
          menu
        ])
      ]),
    );
  }
}
