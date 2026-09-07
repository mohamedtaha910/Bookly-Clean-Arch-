class BookEntity {
  final String entityId;
  final String title;
  final String? image;
  final String? authorName;
  final num? price;
  final num? rating;

  BookEntity(
   { required this.title,
    required this.image,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.entityId,}
  );
}
