//
//  JsonTest.swift
//  SwiftApiIntro
//
//  Created by hormiga6 on 2017/04/19.
//
//

import XCTest
import Foundation

class JsonTest: XCTestCase {
    
    func testExample() {
        let data =  "{\"hoge\": \"hogehoge\"}".data(using: String.Encoding.utf8, allowLossyConversion: false)!
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
        XCTAssertEqual(String(describing: type(of: json)), "Dictionary<String, AnyObject>")
        
        XCTAssertEqual(json["hoge"] as! String, "hogehoge")
    }
}
