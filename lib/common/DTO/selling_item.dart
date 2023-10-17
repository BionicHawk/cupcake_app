import 'package:cupcake_app/common/flavors.dart';

class SellingItem {
  final Flavors flavor;
  final int quantity;
  final DateTime date;
  final double total;

  SellingItem(
      {required this.flavor,
      required this.quantity,
      required this.date,
      required this.total});
}
