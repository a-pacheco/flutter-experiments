import 'package:flutter_application_v1/commons/app_status.dart';
import 'package:flutter_application_v1/model/ingredient.model.dart';
import 'package:flutter_application_v1/repository/ingredient.repository.dart';
import 'package:mobx/mobx.dart';

part 'ingredient.controller.g.dart';

class IngredientController = _IngredientController with _$IngredientController;

abstract class _IngredientController with Store {
  IngredientRepository? _repository;

  _IngredientController() {
    _init();
  }

  Future<void> _init() async {
    _repository = await IngredientRepository.getInstance();
    await getAll();
  }

  @observable
  AppStatus status = AppStatus.none;

  @observable
  ObservableList<Ingredient> list = ObservableList<Ingredient>();

  @action
  Future<void> getAll() async {
    status = AppStatus.loading;
    try {
      if (_repository != null) {
        final allList = await _repository!.getAll();
        list.clear();
        list.addAll(allList);
      }
      status = AppStatus.success;
    } catch (e) {
      status = AppStatus.error..value = e;
    }
  }

  @action
  Future<void> create(Ingredient item) async {
    status = AppStatus.loading;
    try {
      await _repository!.save(item);
      await getAll();
      status = AppStatus.success;
    } catch (e) {
      status = AppStatus.error..value = e;
    }
  }

  @action
  Future<void> update(Ingredient item) async {
    status = AppStatus.loading;
    try {
      await _repository!.update(item);
      await getAll();
      status = AppStatus.success;
    } catch (e) {
      status = AppStatus.error..value = e;
    }
  }

  @action
  Future<void> delete(int id) async {
    status = AppStatus.loading;
    try {
      await _repository!.delete(id);
      await getAll();
      status = AppStatus.success;
    } catch (e) {
      status = AppStatus.error..value = e;
    }
  }
}
