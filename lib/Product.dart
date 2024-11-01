class Ingredient {
  final String ingredient;
  final String category;
  final String rating;
  final String benefit;

  Ingredient({
    required this.ingredient,
    required this.category,
    required this.rating,
    required this.benefit,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      ingredient: json['Ingredient'] ?? '',
      category: json['Category'] ?? '',
      rating: json['Rating'] ?? '',
      benefit: json['Benefit'] ?? '',
    );
  }
}

class Product {
  final String productName;
  final String brand;
  final String productImg;
  final String price;
  final String score;
  bool favorite;
  final List<Ingredient> ingredients;

  Product(
      {required this.productName,
      required this.productImg,
      this.favorite = false,
      required this.brand,
      required this.price,
      required this.score,
      required this.ingredients});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['Product'] ?? '',
      brand: json['Brand'] ?? '',
      productImg: json['img'] ?? '',
      favorite: json['fav'] ?? false,
      price: json['Price'] ?? '',
      score: json['Score'] ?? '',
      ingredients: (json['ingredient'] as List)
          .map((ingredientJson) => Ingredient.fromJson(ingredientJson))
          .toList(),
    );
  }
}
