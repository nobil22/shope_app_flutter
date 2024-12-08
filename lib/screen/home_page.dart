import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/services/all_product_service.dart';
import 'package:shop_app/widget/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'New Brand',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                ))
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 75),
            child: FutureBuilder<List<ProductModel>>(
                future: GetProdutService().getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ProductModel> products =snapshot.data!;
                    return GridView.builder(
                      itemCount: products.length,
                        clipBehavior: Clip.none,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                          mainAxisSpacing: 70,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return CustomCard(prduct: products[index]);
                        });
                  }
                  else{
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
