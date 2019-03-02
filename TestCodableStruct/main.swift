//
//  main.swift
//  TestCodableStruct
//
//  Created by Bill liu on 2019/3/2.
//  Copyright © 2019 Mzying. All rights reserved.
//

import Foundation

print("Hello, World!")

let jsondoc = """
{
"imAString": "aString",
"imAnInt": 1,
"imADouble": 0.5,
"imABool": true,
"imAnArray": [1,2,"3",false],
"imAnArrayOfArrays": [[[[[[[true]]]]]]],
"imAnObject": {"imAnotherString": "anotherString"},
"imAnObjectInAnObject": {"anObj": {"anInt": 1}},
"imAnArrayOfObjects": [{"anObj": {"anInt": 1}}, {"aBool": true}]
}
"""


let parsed : JSONValue = try JSONDecoder().decode(JSONValue.self, from: jsondoc.data(using: .utf8)!)

print("\(parsed)")
