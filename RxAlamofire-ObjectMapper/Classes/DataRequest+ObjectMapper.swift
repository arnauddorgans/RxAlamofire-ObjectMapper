//
//  DataRequest+ObjectMapper.swift
//  RxAlamofire-ObjectMapper
//
//  Created by Arnaud Dorgans on 12/12/2017.
//

import RxSwift
import RxAlamofire
import ObjectMapper
import Alamofire

public let RxAlamofireObjectMapperMapError = NSError(domain: "RxAlamofireObjectMapperDomain", code: -1, userInfo: nil)

extension Reactive where Base: DataRequest {
    
    public func responseMappable<T: Mappable>(`as` type: T.Type? = nil, to object: T? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<T> {
        return self.responseJSON()
            .mappable(as: type, to: object, keyPath: keyPath, context: context)
    }
    
    public func responseMappableArray<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[T]> {
        return self.responseJSON()
            .mappableArray(as: type, keyPath: keyPath, context: context)
    }
    
    public func responseMappableDictionary<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[String:T]> {
        return self.responseJSON()
            .mappableDictionary(as: type, keyPath: keyPath, context: context)
    }
    
    public func responseMappableDictionaryOfArrays<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[String:[T]]> {
        return self.responseJSON()
            .mappableDictionaryOfArrays(as: type, keyPath: keyPath, context: context)
    }
    
    public func responseMappableArrayOfArrays<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[[T]]> {
        return self.responseJSON()
            .mappableArrayOfArrays(as: type, keyPath: keyPath, context: context)
    }
}

extension Observable where E == DataRequest {
    
    public func responseMappable<T: Mappable>(`as` type: T.Type? = nil, to object: T? = nil, context: MapContext? = nil, keyPath: String? = nil) -> Observable<T> {
        return self.flatMapLatest { $0.rx.responseMappable(as: type, to: object, keyPath: keyPath, context: context) }
    }
    
    public func responseMappableArray<T: Mappable>(`as` type: T.Type? = nil, context: MapContext? = nil, keyPath: String? = nil) -> Observable<[T]> {
        return self.flatMapLatest { $0.rx.responseMappableArray(as: type, keyPath: keyPath, context: context) }
    }
    
    public func responseMappableDictionary<T: Mappable>(`as` type: T.Type? = nil, context: MapContext? = nil, keyPath: String? = nil) -> Observable<[String:T]> {
        return self.flatMapLatest { $0.rx.responseMappableDictionary(as: type, keyPath: keyPath, context: context) }
    }
    
    public func responseMappableDictionaryOfArrays<T: Mappable>(`as` type: T.Type? = nil, context: MapContext? = nil, keyPath: String? = nil) -> Observable<[String:[T]]> {
        return self.flatMapLatest { $0.rx.responseMappableDictionaryOfArrays(as: type, keyPath: keyPath, context: context) }
    }
    
    public func responseMappableArrayOfArrays<T: Mappable>(`as` type: T.Type? = nil, context: MapContext? = nil, keyPath: String? = nil) -> Observable<[[T]]> {
        return self.flatMapLatest { $0.rx.responseMappableArrayOfArrays(as: type, keyPath: keyPath, context: context) }
    }
}
