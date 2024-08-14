import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/product/data/data_sources/local_data_source.dart';
import 'features/product/data/model/product_model.dart';

void main() async {
  var sharedPreference = await SharedPreferences.getInstance();
  var localDataSource = localDataSourceImpl(sharedPreference: sharedPreference);
const tProductModel =  ProductModel(
    id: '123',
    name: 'Nike Shoes',
    description: 'High-quality sports shoes',
    price: 99,
    image: 'path/to/image.jpg'
  );
  const tProductModel2 =  ProductModel(
    id: '12233',
    name: 'Nike Shoes',
    description: 'High-quality sports shoes',
    price: 99,
    image: 'path/to/image.jpg'
  );
  const updatedProduct =  ProductModel(
    id: '12233',
    name: 'Shoes',
    description: 'High-quality sports shoes',
    price: 99,
    image: 'path/to/image.jpg'
  );
  var listProduct = [tProductModel, tProductModel2];
  // await localDataSource.cachedproduct(listProduct);
  // await localDataSource.deleteproduct('12233');
  var product = localDataSource.getallproduct();
  var something = "12432";
  runApp(const Test());
}

  class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        

      ),
    );
  }
}
