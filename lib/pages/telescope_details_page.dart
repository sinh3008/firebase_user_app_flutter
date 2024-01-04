import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:firebase_user_app_flutter/providers/cart_provider.dart';
import 'package:firebase_user_app_flutter/providers/user_provider.dart';
import 'package:firebase_user_app_flutter/utils/color.dart';

import '../customwidgets/image_holder_view.dart';
import '../models/image_model.dart';
import '../models/telescope.dart';
import '../providers/telescope_provider.dart';
import '../utils/constants.dart';
import '../utils/helper_functions.dart';

class TelescopeDetailsPage extends StatefulWidget {
  static const String routeName = 'productdetails';
  final String id;
  const TelescopeDetailsPage({super.key, required this.id,});

  @override
  State<TelescopeDetailsPage> createState() => _TelescopeDetailsPageState();
}

class _TelescopeDetailsPageState extends State<TelescopeDetailsPage> {
  late Telescope telescope;
  late TelescopeProvider provider;
  double userRating = 0.0;

  @override
  void didChangeDependencies() {
    provider = Provider.of<TelescopeProvider>(
      context,
    );
    telescope = provider.findTelescopeById(widget.id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(telescope.model, style: const TextStyle(overflow: TextOverflow.ellipsis),),
      ),
      body: ListView(
        children: [
          CachedNetworkImage(
            width: double.infinity,
            height: 200,
            imageUrl: telescope.thumbnail.downloadUrl,
            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Consumer<CartProvider>(
              builder: (context, provider, child) {
                final isInCart = provider.isTelescopeInCart(telescope.id!);
                return ElevatedButton.icon(
                  onPressed: () {
                    if(isInCart) {
                      provider.removeFromCart(telescope.id!);
                    } else {
                      provider.addToCart(telescope);
                    }
                  },
                  icon: Icon(isInCart ? Icons.remove_shopping_cart : Icons.shopping_cart),
                  label: Text(isInCart ? 'Remove from Cart' : 'Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isInCart ? kShrineBrown900 : kShrinePink400,
                    foregroundColor: isInCart ? kShrinePink100 : kShrinePink50,
                  ),
                );
              },
            ),
          ),
          if(telescope.additionalImage.isNotEmpty) SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Card(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                scrollDirection: Axis.horizontal,
                children: telescope.additionalImage.map((e) => ImageHolderView(
                  imageModel: e,
                  onImagePressed: () {
                    _showImageOnDialog(e);
                  },
                )).toList(),
              ),
            ),
          ),
          ListTile(
            title: Text('Sale Price: $currencySymbol${priceAfterDiscount(telescope.price, telescope.discount)}'),
            subtitle: Text('Stock: ${telescope.stock}'),
          ),
          _buildSpecification(),
          ListTile(
            title: const Text('Description'),
            subtitle: Text(telescope.description ?? 'Not Found'),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  RatingBar.builder(
                    initialRating: 0.0,
                    minRating: 0.0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (value) {
                      userRating = value;
                    },
                  ),
                  OutlinedButton(
                    onPressed: _rateThisProduct,
                    child: const Text('SUBMIT'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _rateThisProduct() async {
    EasyLoading.show(status: 'Please wait');
    final appUser = Provider.of<UserProvider>(context, listen: false).appUser;
    await provider.addRating(telescope.id!, appUser!, userRating);
    EasyLoading.dismiss();
    showMsg(context, 'Thanks for your rating');
  }

  void _showImageOnDialog(ImageModel image) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: CachedNetworkImage(
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height / 2,
            imageUrl: image.downloadUrl,
            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ));
  }

  Widget _buildSpecification() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Specifications', style: Theme.of(context).textTheme.titleLarge,),
          Row(
            children: [
              const Expanded(child: Text('Brand')),
              Expanded(child: Text(telescope.brand.name))
            ],
          ),
          Row(
            children: [
              const Expanded(child: Text('Model')),
              Expanded(child: Text(telescope.model))
            ],
          ),
          Row(
            children: [
              const Expanded(child: Text('Type')),
              Expanded(child: Text(telescope.type))
            ],
          ),
          Row(
            children: [
              const Expanded(child: Text('Dimension')),
              Expanded(child: Text(telescope.dimension))
            ],
          ),
          Row(
            children: [
              const Expanded(child: Text('Weight')),
              Expanded(child: Text('${telescope.weightInPound}lb'))
            ],
          ),
          Row(
            children: [
              const Expanded(child: Text('Focus Type')),
              Expanded(child: Text(telescope.focustype))
            ],
          ),
          Row(
            children: [
              const Expanded(child: Text('Lens Diameter')),
              Expanded(child: Text('${telescope.lensDiameterInMM}mm'))
            ],
          ),
          Row(
            children: [
              const Expanded(child: Text('Mount Description')),
              Expanded(child: Text(telescope.mountDescription))
            ],
          ),
        ],
      ),
    );
  }
}
