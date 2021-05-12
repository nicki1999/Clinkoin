# openapi.api.AuthenticationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://api.clinkoin.com/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authIdentificationDeviceNewPost**](AuthenticationApi.md#authidentificationdevicenewpost) | **POST** /auth/identification/device/new | 
[**authIdentificationDevicePost**](AuthenticationApi.md#authidentificationdevicepost) | **POST** /auth/identification/device | 


# **authIdentificationDeviceNewPost**
> User authIdentificationDeviceNewPost(device)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = AuthenticationApi();
final device = Device(); // Device | 

try { 
    final result = api_instance.authIdentificationDeviceNewPost(device);
    print(result);
} catch (e) {
    print('Exception when calling AuthenticationApi->authIdentificationDeviceNewPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **device** | [**Device**](Device.md)|  | [optional] 

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authIdentificationDevicePost**
> User authIdentificationDevicePost(device)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = AuthenticationApi();
final device = Device(); // Device | 

try { 
    final result = api_instance.authIdentificationDevicePost(device);
    print(result);
} catch (e) {
    print('Exception when calling AuthenticationApi->authIdentificationDevicePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **device** | [**Device**](Device.md)|  | [optional] 

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

