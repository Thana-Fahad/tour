import 'package:tour/data/places.dart';
import 'package:tour/widgets/like_card.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartItems = products.take(4).toList();

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ...List.generate(
            cartItems.length,
            (index) {
              final cartItem = cartItems[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: CartItem(cartItem: cartItem),
              );
            },
          ),
          
        ],
      ),
    ),
  );
}
  }

