//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Error {
  /// Returns a new [Error] instance.
  Error({
    this.errors,
  });

  Object errors;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Error &&
     other.errors == errors;

  @override
  int get hashCode =>
    (errors == null ? 0 : errors.hashCode);

  @override
  String toString() => 'Error[errors=$errors]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (errors != null) {
      json[r'errors'] = errors;
    }
    return json;
  }

  /// Returns a new [Error] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static Error fromJson(Map<String, dynamic> json) => json == null
    ? null
    : Error(
        errors: json[r'errors'],
    );

  static List<Error> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <Error>[]
      : json.map((v) => Error.fromJson(v)).toList(growable: true == growable);

  static Map<String, Error> mapFromJson(Map<String, dynamic> json) {
    final map = <String, Error>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = Error.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of Error-objects as value to a dart map
  static Map<String, List<Error>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<Error>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = Error.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

