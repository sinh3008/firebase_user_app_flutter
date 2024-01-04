import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:firebase_user_app_flutter/auth/auth_service.dart';
import 'package:firebase_user_app_flutter/customwidgets/main_drawer.dart';
import 'package:firebase_user_app_flutter/pages/cart_page.dart';
import 'package:firebase_user_app_flutter/pages/login_page.dart';
import 'package:firebase_user_app_flutter/providers/cart_provider.dart';
import 'package:firebase_user_app_flutter/providers/order_provider.dart';
import 'package:firebase_user_app_flutter/providers/user_provider.dart';

import '../customwidgets/telescope_grid_item_view.dart';
import '../providers/telescope_provider.dart';

class ViewTelescopePage extends StatefulWidget {
  static const String routeName = '/';
  const ViewTelescopePage({super.key});

  @override
  State<ViewTelescopePage> createState() => _ViewTelescopePageState();
}

class _ViewTelescopePageState extends State<ViewTelescopePage> {
  @override
  void didChangeDependencies() {
    Provider.of<TelescopeProvider>(context, listen: false).getAllBrands();
    Provider.of<TelescopeProvider>(context, listen: false).getAllTelescopes();
    Provider.of<CartProvider>(context, listen: false).getAllCartItems();
    Provider.of<UserProvider>(context, listen: false).getUserInfo();
    Provider.of<OrderProvider>(context, listen: false).getMyOrders();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Telescope List'),
        actions: [
          InkWell(
            onTap: () => context.goNamed(CartPage.routeName),
            child: Consumer<CartProvider>(
              builder: (context, provider, child) => Badge(
                alignment: Alignment.topLeft,
                offset: const Offset(-5, -5),
                label: Text('${provider.totalItemsInCart}', style: const TextStyle(fontSize: 14),),
                largeSize: 25,
                child: const Icon(Icons.shopping_cart, size: 30,),
              ),
            ),
          ),
        ],
      ),
      body: Consumer<TelescopeProvider>(
        builder: (context, provider, child) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7
          ),
          itemCount: provider.telescopeList.length,
          itemBuilder: (context, index) {
            final telescope = provider.telescopeList[index];
            return TelescopeGridItemView(telescope: telescope);
          },
        ),
      ),
    );
  }
}
