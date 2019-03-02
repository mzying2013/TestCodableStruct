//
//  JSONValue.swift
//  TestCodableStruct
//
//  Created by Bill liu on 2019/3/2.
//  Copyright © 2019 Mzying. All rights reserved.
//

import Foundation

extension Optional {
    func or(_ other: Optional) -> Optional {
        switch self {
        case .none: return other
        case .some: return self
        }
    }
    
    func resolve(with error: @autoclosure () -> Error) throws -> Wrapped {
        switch self {
        case .none: throw error()
        case .some(let wrapped): return wrapped
        }
    }
}


public enum JSONValue: Decodable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case object([String: JSONValue])
    case array([JSONValue])
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        self = try ((try? container.decode(String.self)).map(JSONValue.string)) .or((try? container.decode(Int.self)).map(JSONValue.int)) .or((try? container.decode(Double.self)).map(JSONValue.double)) .or((try? container.decode(Bool.self)).map(JSONValue.bool)) .or((try? container.decode([String: JSONValue].self)).map(JSONValue.object)) .or((try? container.decode([JSONValue].self)).map(JSONValue.array)) .resolve(with: DecodingError.typeMismatch(JSONValue.self, DecodingError.Context(codingPath: container.codingPath, debugDescription: "Not a JSON")))
    }
}
