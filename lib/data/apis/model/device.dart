//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Device {
  /// Returns a new [Device] instance.
  Device({
    @required this.device,
  });

  DeviceDevice device;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Device &&
     other.device == device;

  @override
  int get hashCode =>
    (device == null ? 0 : device.hashCode);

  @override
  String toString() => 'Device[device=$device]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'device'] = device;
    return json;
  }

  /// Returns a new [Device] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static Device fromJson(Map<String, dynamic> json) => json == null
    ? null
    : Device(
        device: DeviceDevice.fromJson(json[r'device']),
    );

  static List<Device> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <Device>[]
      : json.map((v) => Device.fromJson(v)).toList(growable: true == growable);

  static Map<String, Device> mapFromJson(Map<String, dynamic> json) {
    final map = <String, Device>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = Device.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of Device-objects as value to a dart map
  static Map<String, List<Device>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<Device>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = Device.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

