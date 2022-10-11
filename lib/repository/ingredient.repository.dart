import 'package:flutter_application_v1/repository/base.repository.dart';
import 'package:flutter_application_v1/model/ingredient.model.dart';

class IngredientRepository {
  BaseRepository? _baseRepository;

  static IngredientRepository? _instance;
  IngredientRepository._();

  static Future<IngredientRepository> getInstance() async {
    if (_instance != null) {
      return _instance!;
    }

    _instance = IngredientRepository._();
    await _instance!._init();

    return _instance!;
  }

  Future<void> _init() async {
    _baseRepository = await BaseRepository.getInstance();
  }

  Future<List<Ingredient>> getAll() async {
    try {
      return await _baseRepository!.database!.ingredientDao.findAllIngredient();
    } catch (e) {
      print("Erro ao recuperar lista de ingredientes. Error message = $e");
      return <Ingredient>[];
    }
  }

  Future<bool> save(Ingredient item) async {
    try {
      await _baseRepository!.database!.ingredientDao.saveIngredient(item);
      return true;
    } catch (e) {
      print("Erro ao salvar ingrediente. Error message = $e");
      return false;
    }
  }

  Future<bool> update(Ingredient item) async {
    try {
      await _baseRepository!.database!.ingredientDao.updateIngredient(item);
      return true;
    } catch (e) {
      print("Erro ao atualizar ingrediente. Error message = $e");
      return false;
    }
  }

  Future<bool> delete(int id) async {
    try {
      Ingredient? item = await _baseRepository!.database!.ingredientDao.getIngredientById(id);
      await _baseRepository!.database!.ingredientDao.deleteIngredient(item!);
      return true;
    } catch (e) {
      print("Erro ao deletar ingrediente. Error message = $e");
      return false;
    }
  }
}
