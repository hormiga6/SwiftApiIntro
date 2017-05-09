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

  func testSimpleJson() {
    let data =  "{\"hoge\": \"hogehoge\"}".data(using: String.Encoding.utf8, allowLossyConversion: false)!
    let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
    XCTAssertEqual(String(describing: type(of: json)), "Dictionary<String, AnyObject>")

    XCTAssertEqual(json["hoge"] as! String, "hogehoge")
  }

  func testEmptyJson() {
    let data =  "{\"hoge\": {}}".data(using: String.Encoding.utf8, allowLossyConversion: false)!
    let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
    XCTAssertEqual(String(describing: type(of: json)), "Dictionary<String, AnyObject>")
    let dic = json["hoge"] as! Dictionary<String, AnyObject>
    XCTAssertEqual(String(describing: type(of: dic)), "Dictionary<String, AnyObject>")
    XCTAssertEqual(dic.count, 0)

    //die
    //XCTAssertEqual(String(describing: type(of: (json["hoge"] as! String))), "Dictionary<String, AnyObject>")
  }
}
