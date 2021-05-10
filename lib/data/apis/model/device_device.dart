//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeviceDevice {
  /// Returns a new [DeviceDevice] instance.
  DeviceDevice({
    @required this.deviceId,
    @required this.password,
    @required this.passwordConfirmation,
  });

  String deviceId;

  String password;

  String passwordConfirmation;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DeviceDevice &&
     other.deviceId == deviceId &&
     other.password == password &&
     other.passwordConfirmation == passwordConfirmation;

  @override
  int get hashCode =>
    (deviceId == null ? 0 : deviceId.hashCode) +
    (password == null ? 0 : password.hashCode) +
    (passwordConfirmation == null ? 0 : passwordConfirmation.hashCode);

  @override
  String toString() => 'DeviceDevice[deviceId=$deviceId, password=$password, passwordConfirmation=$passwordConfirmation]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'device_id'] = deviceId;
      json[r'password'] = password;
      json[r'password_confirmation'] = passwordConfirmation;
    return json;
  }

  /// Returns a new [DeviceDevice] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static DeviceDevice fromJson(Map<String, dynamic> json) => json == null
    ? null
    : DeviceDevice(
        deviceId: json[r'device_id'],
        password: json[r'password'],
        passwordConfirmation: json[r'password_confirmation'],
    );

  static List<DeviceDevice> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <DeviceDevice>[]
      : json.map((v) => DeviceDevice.fromJson(v)).toList(growable: true == growable);

  static Map<String, DeviceDevice> mapFromJson(Map<String, dynamic> json) {
    final map = <String, DeviceDevice>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = DeviceDevice.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of DeviceDevice-objects as value to a dart map
  static Map<String, List<DeviceDevice>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<DeviceDevice>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = DeviceDevice.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}
