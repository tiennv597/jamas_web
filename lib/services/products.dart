import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jamas_web/helpers/costants.dart';
import 'package:jamas_web/models/products.dart';

class ProductsServices {
  String collection = "products";

  Future<List<ProductModel>> getAllProducts() async =>
      firebaseFiretore.collection(collection).get().then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });
}
