import 'package:cloud_firestore/cloud_firestore.dart';

class MedicalEquipment {
  String id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final List<String> imagesUrls;
  final String vendorName;
  final String vendorId;
  final String brand;
  final String productType;
  final double vendorRating;
  final int numOfReviews;
  final DateTime createdAt;

  MedicalEquipment({
    this.id = '',
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.imagesUrls,
    required this.vendorId,
    required this.vendorName,
    required this.vendorRating,
    required this.brand,
    required this.productType,
    required this.numOfReviews,
    required this.createdAt,
  });

  MedicalEquipment.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
          price: (json['price'] as num).toDouble(),
          rating: (json['rating'] as num).toDouble(),
          imagesUrls: (json['imagesUrls'] as List)
              .map((imageUrl) => imageUrl as String)
              .toList(),
          vendorId: json['vendorId'] as String,
          vendorName: json['vendorName'] as String,
          vendorRating: (json['vendorRating'] as num).toDouble(),
          brand: json['brand'] as String,
          productType: json['productType'] as String,
          numOfReviews: json['numOfReviews'] as int,
          createdAt: (json['createdAt'] as Timestamp).toDate(),
        );
}
