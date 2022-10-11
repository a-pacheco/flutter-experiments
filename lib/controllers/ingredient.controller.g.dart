// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IngredientController on _IngredientController, Store {
  late final _$statusAtom =
      Atom(name: '_IngredientController.status', context: context);

  @override
  AppStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AppStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$listAtom =
      Atom(name: '_IngredientController.list', context: context);

  @override
  ObservableList<Ingredient> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<Ingredient> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$getAllAsyncAction =
      AsyncAction('_IngredientController.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$createAsyncAction =
      AsyncAction('_IngredientController.create', context: context);

  @override
  Future<void> create(Ingredient item) {
    return _$createAsyncAction.run(() => super.create(item));
  }

  late final _$updateAsyncAction =
      AsyncAction('_IngredientController.update', context: context);

  @override
  Future<void> update(Ingredient item) {
    return _$updateAsyncAction.run(() => super.update(item));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_IngredientController.delete', context: context);

  @override
  Future<void> delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
status: ${status},
list: ${list}
    ''';
  }
}
