//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthApi {
  AuthApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Returns user data and user jwt
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] deviceId (required):
  Future<Response> apiV1AuthIdentificationDeviceGetWithHttpInfo(
      String deviceId) async {
    // Verify required params are set.
    if (deviceId == null) {
      throw ApiException(
          HttpStatus.badRequest, 'Missing required param: deviceId');
    }

    final path = r'/api/v1/auth/identification/device';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    queryParams.addAll(
        _convertParametersForCollectionFormat('', 'device_id', deviceId));

    final contentTypes = <String>[];
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
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Returns user data and user jwt
  ///
  /// Parameters:
  ///
  /// * [String] deviceId (required):
  Future<void> apiV1AuthIdentificationDeviceGet(String deviceId) async {
    final response =
        await apiV1AuthIdentificationDeviceGetWithHttpInfo(deviceId);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
  }
}