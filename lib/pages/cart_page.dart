import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:firebase_user_app_flutter/pages/checkout_page.dart';
import 'package:firebase_user_app_flutter/providers/cart_provider.dart';
import 'package:firebase_user_app_flutter/utils/constants.dart';

import '../customwidgets/cart_item_view.dart';

class CartPage extends StatefulWidget {
  static const String routeName = 'cartpage';

  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, provider, child) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: provider.cartList.length,
                itemBuilder: (context, index) {
                  final model = provider.cartList[index];
                  return CartItemView(cartModel: model, provider: provider);
                },
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'SUB TOTAL: $currencySymbol${provider.getCartSubTotal()}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: provider.totalItemsInCart == 0 ? null : () {
                        context.goNamed(CheckoutPage.routeName);
                      },
                      child: const Text('CHECKOUT'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
