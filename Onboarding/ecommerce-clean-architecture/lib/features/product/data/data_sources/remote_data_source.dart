import 'dart:convert';
import 'dart:io';
// import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/error/exception.dart';
import '../../domain/entities/product.dart';
import '../model/product_model.dart';

abstract class ProductRemoteDataSource {

Future<List<ProductModel>> getallproduct();
Future<void> addproduct(ProductModel newproduct) ;
Future<ProductModel> updateproduct(ProductModel newproduct) ; 
 Future<bool> deleteproduct(String id) ;
 Future<ProductModel> getproduct(String id) ;


}
class ProductRemoteDataSourceImpl extends ProductRemoteDataSource{

    final http.Client client;
    ProductRemoteDataSourceImpl({required this.client});
    
      @override
      Future<List<ProductModel>> getallproduct() async{
        final response = await client.get(Uri.parse(Urls.baseUrl));
        if (response.statusCode == 404) {
          throw ServerException();
        }

        if (response.statusCode != 200) {
          throw ServerException();
        }
        final jsondata = jsonDecode(response.body);
        final d = jsondata['data'] as List;
        final List<ProductModel> listofproducts=[];
        for(var j in d){
          listofproducts.add(ProductModel.fromJson(j));
        };

        if (response.statusCode==200){
          return listofproducts;
        }else{
          throw ServerException();
        }
      }

      @override
        Future<ProductModel> getproduct(name) async{
        List<ProductModel> products = await getallproduct() ;

        String id = '';
        for(var prod in products){
          if(prod.name == name){
            // print('found');
            id = prod.id;
            break;
          }
        }
        print('id is $id');
        if(id == ''){
          throw ServerException();
        }
        final uri = Uri.parse('${Urls.baseUrl}/$id');
        final response = await client.get(uri);
        if (response.statusCode == 404) {
          throw ServerException();
        }
        if (response.statusCode == 200) { 
          return ProductModel.fromJson(json.decode(response.body)['data']);
        } else {
          throw ServerException();
        }
      }

      @override
  
      Future<void> addproduct(newproduct) async{
        var uri = Uri.parse(Urls.baseUrl);
        var request = http.MultipartRequest('POST',uri);
        request.fields['name'] = newproduct.name;
        request.fields['description'] = newproduct.description;
        request.fields['price'] = newproduct.price.toString() ;  
        var imagefile = File(newproduct.image);  
        if (newproduct.image != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'image', 
          imagefile.path,
          contentType: MediaType('image', 'jpg'),
        ));
      
      final streamedresponse = await client.send(request);
      final response = await http.Response.fromStream(streamedresponse);
      // print(response.statusCode);
      // print(response.body);
      if (response.statusCode == 404) {
          throw ServerException();
        }
      if (response.statusCode==201){
        print('Product added Successfully');
      }else{
        throw(ServerException());
      }
        }
        }
      @override
      Future<ProductModel> updateproduct(newproduct) async{
        final uri = Uri.parse('${Urls.putUrl}/${newproduct.id}');
        final response = await client.put(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'name': newproduct.name,
            'description': newproduct.description,
            'price': newproduct.price,
            // 'imageUrl': newproduct.image,
          }),
       );
        if (response.statusCode == 404) {
          throw ServerException();
        }
 

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(response.body)["data"]; 
      return ProductModel.fromJson(jsondata);
    } else {
      throw ServerException();
    }
      }
      @override
      Future<bool> deleteproduct(String id)async{
        final uri = Uri.parse('${Urls.baseUrl}/${id}');
        final response = await client.delete(uri);
        if(response.statusCode == 404){
          throw ServerException();
        }
        if(response.statusCode == 200){
          return  true;
        }
        else{
          return false;
        }

      }
    
      
      }


