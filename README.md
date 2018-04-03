# RxAlamofire-ObjectMapper

[![CI Status](http://img.shields.io/travis/arnauddorgans/RxAlamofire-ObjectMapper.svg?style=flat)](https://travis-ci.org/arnauddorgans/RxAlamofire-ObjectMapper)
[![Version](https://img.shields.io/cocoapods/v/RxAlamofire+ObjectMapper.svg?style=flat)](http://cocoapods.org/pods/RxAlamofire+ObjectMapper)
[![License](https://img.shields.io/cocoapods/l/RxAlamofire+ObjectMapper.svg?style=flat)](http://cocoapods.org/pods/RxAlamofire+ObjectMapper)
[![Platform](https://img.shields.io/cocoapods/p/RxAlamofire+ObjectMapper.svg?style=flat)](http://cocoapods.org/pods/RxAlamofire+ObjectMapper)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

RxAlamofire+ObjectMapper is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RxAlamofire+ObjectMapper'
```

## Usage

#### Map Object
```swift
// func responseMappable<T: Mappable>(`as` type: T.Type? = nil, to object: T? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<T>

RxAlamofire.request(method, url, parameters: parameters)
    .responseMappable(as: User.self) // Observable<User>
    
Alamofire.request(url).rx
    .responseMappable(as: User.self) // Observable<User>
    
requestJSON(method, url)
    .mappable(as: User.self) // Observable<User>
```

#### Map Array
```swift
// func responseMappableArray<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[T]>

RxAlamofire.request(method, url, parameters: parameters)
    .responseMappableArray(as: User.self, keyPath: "followers") // Observable<[User]>
    
Alamofire.request(url).rx
    .responseMappableArray(as: User.self, keyPath: "followers") // Observable<[User]>
    
requestJSON(method, url)
    .mappableArray(as: User.self, keyPath: "followers") // Observable<[User]>
```

#### Map Dictionary
```swift
// func responseMappableDictionary<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[String:T]>

RxAlamofire.request(method, url, parameters: parameters)
    .responseMappableDictionary(as: User.self, keyPath: "followers") // Observable<[String: User]>
    
Alamofire.request(url).rx
    .responseMappableDictionary(as: User.self, keyPath: "followers") // Observable<[String: User]>
    
requestJSON(method, url)
    .mappableDictionary(as: User.self, keyPath: "followers") // Observable<[String: User]>
```

#### Map Dictionary Of Arrays
```swift
// func responseMappableDictionaryOfArrays<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[String:[T]]>

RxAlamofire.request(method, url, parameters: parameters)
    .responseMappableDictionaryOfArrays(as: Place.self, keyPath: "places") // Observable<[String:[Place]]>
    
Alamofire.request(url).rx
    .responseMappableDictionaryOfArrays(as: Place.self, keyPath: "places") // Observable<[String:[Place]]>
    
requestJSON(method, url)
    .mappableDictionaryOfArrays(as: Place.self, keyPath: "places") // Observable<[String:[Place]]>
```

#### Map Array Of Arrays
```swift
// func responseMappableArrayOfArrays<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[[T]]>

RxAlamofire.request(method, url, parameters: parameters)
    .responseMappableArrayOfArrays(as: User.self, keyPath: "users") // Observable<[[User]]>
    
Alamofire.request(url).rx
    .responseMappableArrayOfArrays(as: User.self, keyPath: "users") // Observable<[[User]]>

requestJSON(method, url)
    .mappableArrayOfArrays(as: User.self, keyPath: "users") // Observable<[[User]]>
```

## Author

Arnaud Dorgans, arnaud.dorgans@gmail.com

## License

RxAlamofire+ObjectMapper is available under the MIT license. See the LICENSE file for more info.
