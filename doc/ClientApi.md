# openapi.api.ClientApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://api.clinkoin.com/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**clientSetReferralCodeCodeGet**](ClientApi.md#clientsetreferralcodecodeget) | **GET** /client/set_referral_code/{code} | 


# **clientSetReferralCodeCodeGet**
> clientSetReferralCodeCodeGet(code, authorization)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = ClientApi();
final code = code_example; // String | 
final authorization = authorization_example; // String | Enter the (Bearer) before token

try { 
    api_instance.clientSetReferralCodeCodeGet(code, authorization);
} catch (e) {
    print('Exception when calling ClientApi->clientSetReferralCodeCodeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**|  | 
 **authorization** | **String**| Enter the (Bearer) before token | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

