import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/services/udate_product_service.dart';
import 'package:shop_app/widget/custom_button.dart';
import 'package:shop_app/widget/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  static String id = 'update product';

  UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? prductName, desc, image, price;

  bool isbool = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isbool,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.transparent),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextfild(
                onChanged: (data) {
                  prductName = data;
                },
                hinttext: ' product name',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextfild(
                onChanged: (data) {
                  desc = data;
                },
                hinttext: ' describtion',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextfild(
                inputType: TextInputType.number,
                onChanged: (data) {
                  price = data;
                },
                hinttext: ' Price',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextfild(
                onChanged: (data) {
                  image = data;
                },
                hinttext: ' image',
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                txt: 'Update',
                onTap: ()async {
                  isbool = true;
                  setState(() {});
                  try {
                   await updateproduct(product);
                    print('success');
                  } catch (e) {
                    print(e.toString());
                    // TODO
                  }
                  isbool = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

 Future<void>  updateproduct(ProductModel product)async{
   await UdateProductService().updateProduct(
      title: prductName == null ? product.title : prductName!,
      price: price == null ? product.price.toString() : price!,
      desc:  desc == null ? product.description: desc!,
      image: image == null ? product.image: image!,
      category: product.category,
    );
  }
}
