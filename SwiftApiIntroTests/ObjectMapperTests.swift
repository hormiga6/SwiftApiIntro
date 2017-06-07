//
//  ObjectMapperTests.swift
//  SwiftApiIntro
//
//
//

import XCTest
import ObjectMapper

class ObjectMapperTests: XCTestCase {

  class Hoge: Mappable {
    var val1: String?
    required init?(map: Map) {
    }

    func mapping(map: Map) {
      val1 <- map["val1"]
    }
  }

  class Foo: Mappable {
    var hoge: Hoge?
    required init?(map: Map){
    }

    func mapping(map: Map) {
      hoge <- map["hoge"]
    }
  }

  func testMapping(){
    let hoge = Hoge(JSONString: "{\"val1\": \"fuga\"}")
    XCTAssertEqual(hoge?.val1, "fuga")
  }

  func testNestMapping(){
    let foo = Foo(JSONString: "{\"hoge\":{\"val1\": \"fuga\"} }")
    XCTAssertEqual(foo?.hoge?.val1, "fuga")
  }
}
