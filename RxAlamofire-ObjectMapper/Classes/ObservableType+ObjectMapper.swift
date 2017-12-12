//
//  ObservableType+ObjectMapper.swift
//  RxAlamofire-ObjectMapper
//
//  Created by Arnaud Dorgans on 12/12/2017.
//

import RxSwift
import RxAlamofire
import ObjectMapper
import Alamofire

extension ObservableType where E == (HTTPURLResponse, Any) {
    
    private func mapper<T: Mappable>(_ type: T.Type? = nil, from object: Any, keyPath: String? = nil, context: MapContext? = nil) -> (mapper: Mapper<T>, object: Any?) {
        var object: Any? = object
        if let keyPath = keyPath,
            let JSON = object as? [String:Any] {
            object = try? Map(mappingType: .fromJSON, JSON: JSON).value(keyPath)
        }
        let mapper = Mapper<T>()
        mapper.context = context
        return (mapper, object)
    }
    
    public func mappable<T: Mappable>(`as` type: T.Type? = nil, to object: T? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<T> {
        return self
            .flatMapLatest { _, json -> Observable<T> in
                let tempObject: T?
                let mapper = self.mapper(type, from: json, keyPath: keyPath, context: context)
                if let object = object {
                    tempObject = mapper.mapper.map(JSONObject: mapper.object, toObject: object)
                } else {
                    tempObject = mapper.mapper.map(JSONObject: mapper.object)
                }
                guard let object = tempObject else {
                    return .error(RxAlamofireObjectMapperMapError)
                }
                return .just(object)
        }
    }
    
    public func mappableArray<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[T]> {
        return self
            .flatMapLatest { _, json -> Observable<[T]> in
                let mapper = self.mapper(type, from: json, keyPath: keyPath, context: context)
                return .just(mapper.mapper.mapArray(JSONObject: mapper.object) ?? [])
        }
    }
    
    public func mappableDictionary<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[String:T]> {
        return self
            .flatMapLatest { _, json -> Observable<[String:T]> in
                let mapper = self.mapper(type, from: json, keyPath: keyPath, context: context)
                return .just(mapper.mapper.mapDictionary(JSONObject: mapper.object) ?? [:])
        }
    }
    
    public func mappableDictionaryOfArrays<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[String:[T]]> {
        return self
            .flatMapLatest { _, json -> Observable<[String:[T]]> in
                let mapper = self.mapper(type, from: json, keyPath: keyPath, context: context)
                return .just(mapper.mapper.mapDictionaryOfArrays(JSONObject: mapper.object) ?? [:])
        }
    }
    
    public func mappableArrayOfArrays<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[[T]]> {
        return self
            .flatMapLatest { _, json -> Observable<[[T]]> in
                let mapper = self.mapper(type, from: json, keyPath: keyPath, context: context)
                return .just(mapper.mapper.mapArrayOfArrays(JSONObject: mapper.object) ?? [])
        }
    }
}

extension ObservableType where E == (HTTPURLResponse, [String: Any]) {
    
    public func mappable<T: Mappable>(`as` type: T.Type? = nil, to object: T? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<T> {
        return self.map { ($0.0, $0.1 as Any) }
            .mappable(as: type, to: object, keyPath: keyPath, context: context)
    }
    
    public func mappableArray<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[T]> {
        return self.map { ($0.0, $0.1 as Any) }
            .mappableArray(as: type, keyPath: keyPath, context: context)
    }
    
    public func mappableDictionary<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[String:T]> {
        return self.map { ($0.0, $0.1 as Any) }
            .mappableDictionary(as: type, keyPath: keyPath, context: context)
    }
    
    public func mappableDictionaryOfArrays<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[String:[T]]> {
        return self.map { ($0.0, $0.1 as Any) }
            .mappableDictionaryOfArrays(as: type, keyPath: keyPath, context: context)
    }
    
    public func mappableArrayOfArrays<T: Mappable>(`as` type: T.Type? = nil, keyPath: String? = nil, context: MapContext? = nil) -> Observable<[[T]]> {
        return self.map { ($0.0, $0.1 as Any) }
            .mappableArrayOfArrays(as: type, keyPath: keyPath, context: context)
    }
}
