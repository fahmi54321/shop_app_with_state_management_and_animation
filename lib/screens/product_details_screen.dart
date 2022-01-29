import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_providers.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = 'product_details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadProduct = Provider.of<ProductProvider>(
      context,
      listen: false, // false maksudnya tidak mentrigger update pada provider
    ).findById(productId);

    return Scaffold(
      body: CustomScrollView( //todo 1
        slivers: [
          SliverAppBar( //todo 2
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadProduct.title),
              background: Hero(
                tag: loadProduct.id,
                child: Image.network(
                  loadProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList( //todo 3
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${loadProduct.price}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    loadProduct.description,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox( //todo 4 (finish)
                  height: 800,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
