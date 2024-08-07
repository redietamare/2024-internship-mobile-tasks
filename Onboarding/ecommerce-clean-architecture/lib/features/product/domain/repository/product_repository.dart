import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';

import '../../../../core/error/failure.dart';

abstract class ProductRepository{

 Future<Either<Failure,List<Productentity>>> getallproduct() ;
 Future<Either<Failure,void>> addproduct(Productentity newproduct) ;
 Future<Either<Failure,Productentity>> updateproduct(int id,) ;
 Future<Either<Failure,Productentity>> deleteproduct(int id) ;
 Future<Either<Failure,Productentity>> getproduct(int id) ;
}