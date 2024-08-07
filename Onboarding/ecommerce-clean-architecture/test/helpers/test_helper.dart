import 'package:ecommerce/features/product/domain/repository/product_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;


@GenerateMocks(
[
  ProductRepository
],
customMocks: [MockSpec<http.Client>(as:#MockHttpClient)]

)
void main() {}