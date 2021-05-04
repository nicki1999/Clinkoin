# openapi.api.AuthApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://api.clinkoin.com/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authIdentificationDeviceNewPost**](AuthApi.md#authidentificationdevicenewpost) | **POST** /auth/identification/device/new | 
[**authIdentificationDevicePost**](AuthApi.md#authidentificationdevicepost) | **POST** /auth/identification/device | 


# **authIdentificationDeviceNewPost**
> User authIdentificationDeviceNewPost(device)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = AuthApi();
final device = Device(); // Device | 

try { 
    final result = api_instance.authIdentificationDeviceNewPost(device);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authIdentificationDeviceNewPost: $e\n');
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

final api_instance = AuthApi();
final device = Device(); // Device | 

try { 
    final result = api_instance.authIdentificationDevicePost(device);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authIdentificationDevicePost: $e\n');
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

