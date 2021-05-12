//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthenticationApi {
  AuthenticationApi([ApiClient apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /auth/identification/device/new' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [Device] device:
  Future<Response> authIdentificationDeviceNewPostWithHttpInfo(
      {Device device}) async {
    // Verify required params are set.

    final path = r'/auth/identification/device/new';

    Object postBody = device;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json'];
    final nullableContentType =
        contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (nullableContentType != null &&
        nullableContentType.toLowerCase().startsWith('multipart/form-data')) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {}

    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Parameters:
  ///
  /// * [Device] device:
  Future authIdentificationDeviceNewPost({Device device}) async {
    final response =
        await authIdentificationDeviceNewPostWithHttpInfo(device: device);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    else if (response.body != null &&
        response.statusCode != HttpStatus.noContent) {
      return response.body;
    } else {
      return;
    }
  }

  /// Performs an HTTP 'POST /auth/identification/device' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [Device] device:
  Future<Response> authIdentificationDevicePostWithHttpInfo(
      {Device device}) async {
    // Verify required params are set.

    final path = r'/auth/identification/device';

    Object postBody = device;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json'];
    final nullableContentType =
        contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (nullableContentType != null &&
        nullableContentType.toLowerCase().startsWith('multipart/form-data')) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {}

    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Parameters:
  ///
  /// * [Device] device:
  Future authIdentificationDevicePost({Device device}) async {
    final response =
        await authIdentificationDevicePostWithHttpInfo(device: device);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    else if (response.body != null &&
        response.statusCode != HttpStatus.noContent) {
      return response.body;
    } else {
      return;
    }
  }
}
