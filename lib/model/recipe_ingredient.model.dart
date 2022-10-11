class RecipeIngredient {
  int? id;
  final String name;
  final double amount;
  String? unitMeasurement;
  final double price;

  RecipeIngredient({
    this.id,
    required this.name,
    required this.amount,
    this.unitMeasurement,
    required this.price,
  });

  /*Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': name,
      'title': amount,
      'ingredients': unitMeasurement,
    };
  }*/
}
