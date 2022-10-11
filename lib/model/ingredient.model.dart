import 'package:floor/floor.dart';

@entity
class Ingredient {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String name;
  final double baseQuantityForPriceCalculation;
  final double price;
  final String unitMeasurement;

  Ingredient({
    this.id,
    required this.name,
    required this.baseQuantityForPriceCalculation,
    required this.price,
    required this.unitMeasurement,
  });

  Map<String, dynamic> toJson() => {
    'id': id, 
    'name': name, 
    'baseQuantityForPriceCalculation': baseQuantityForPriceCalculation, 
    'price': price, 
    'unitMeasurement': unitMeasurement
  };

  Map<String, dynamic> toMap() => {
    'id': id, 
    'name': name, 
    'baseQuantityForPriceCalculation': baseQuantityForPriceCalculation, 
    'price': price, 
    'unitMeasurement': unitMeasurement
  };
}
