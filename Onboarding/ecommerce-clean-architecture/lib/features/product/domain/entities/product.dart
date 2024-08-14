import 'package:equatable/equatable.dart';

class Productentity extends Equatable{
const Productentity({
  required this.id,
  required this.image,
  required this.name,
  // required this.type,
  required this.description,
  required this.price,
}
);
  final String id;
  final String image;
  final String name;
  // final String type;
  final String description;
  final int price;

  @override
  List<Object ? > get props=>[
    id,
    image,
    name,
    // type,
    description,
    price,
  ];

}