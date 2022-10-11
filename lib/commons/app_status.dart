enum AppStatus {loading, success, error, none}

extension AppStatusExt on AppStatus{
  static var _value;
  get value => _value;
  set value(value) => _value = value;
}