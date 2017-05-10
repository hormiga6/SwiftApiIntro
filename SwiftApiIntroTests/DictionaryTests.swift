//
//  DictionaryTests.swift
//  SwiftApiIntro
//
//
//

import XCTest

class DictionaryTests: XCTestCase {

  func testType() {
    let dic = [1:"hoge",2:"fuga"]
    XCTAssertEqual(String(describing: type(of: dic[1])), "Optional<String>")
    XCTAssertEqual(String(describing: type(of: dic[3])), "Optional<String>")
  }

  func testNested(){
    let dic = ["key":["nested_key":"hoge"]]
    XCTAssertEqual(dic["key"]?["nested_key"], "hoge")
  }
}
