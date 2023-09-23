import 'dart:async';

import 'package:tour/models/placesD.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.cartItem}) : super(key: key);

  final Product cartItem;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: const Icon(
          IconlyLight.delete,
          color: Colors.white,
          size: 25,
        ),
      ),
      confirmDismiss: (DismissDirection direction) async {
        final completer = Completer<bool>();

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Theme(
              data: Theme.of(context).copyWith(
                dialogBackgroundColor: Colors.grey.shade200, // Set light gray background color
              ),
              child: AlertDialog(
                title: Text("Confirm Removal"),
                content: Text("Are you sure you want to remove this?"),
                actions: [
                  TextButton(
                    child: Text("Yes"),
                    onPressed: () {
                      completer.complete(true);
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text("No"),
                    onPressed: () {
                      completer.complete(false);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );

        return await completer.future;
      },
      child: SizedBox(
        height: 145,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.white),
          ),
          elevation: 0.1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 90,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(cartItem.image),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.name, style: Theme.of(context).textTheme.headline6),
                      const SizedBox(height: 2),
                      Text(
                        cartItem.description,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text(
                          //   "\$${cartItem.price}",
                          //   style: Theme.of(context).textTheme.headline6?.copyWith(
                          //         color: Theme.of(context).colorScheme.primary,
                          //       ),
                          // ),
                          
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}