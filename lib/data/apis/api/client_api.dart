//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ClientApi {
  ClientApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /client/set_referral_code/{code}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] code (required):
  ///
  /// * [String] authorization (required):
  ///   Enter the (Bearer) before token
  Future<Response> clientSetReferralCodeCodeGetWithHttpInfo(String code, String authorization) async {
    // Verify required params are set.
    if (code == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: code');
    }
    if (authorization == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: authorization');
    }

    final path = r'/client/set_referral_code/{code}'
      .replaceAll('{' + 'code' + '}', code.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

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

  /// Parameters:
  ///
  /// * [String] code (required):
  ///
  /// * [String] authorization (required):
  ///   Enter the (Bearer) before token
  Future<void> clientSetReferralCodeCodeGet(String code, String authorization) async {
    final response = await clientSetReferralCodeCodeGetWithHttpInfo(code, authorization);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
  }
}
