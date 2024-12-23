class HotelSelectionItemModel {
  final int id;
  final String name;
  final String location;
  final double price;
  final double rating;

  HotelSelectionItemModel({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
  });

  factory HotelSelectionItemModel.fromJson(Map<String, dynamic> json) {
    return HotelSelectionItemModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
    );
  }
}
