//
//  MetatypeTests.swift
//  SwiftApiIntro
//
//
//

import XCTest

class MetatypeTests: XCTestCase {

  class SomeBaseClass {
    class func className() -> String {
      return "SomeBaseClass"
    }
  }

  class SomeSubClass: SomeBaseClass {
    override class func className() -> String {
      return "SomeSubClass"
    }
  }

  class AnotherSubClass: SomeBaseClass {
    let string: String
    required init(string: String){
      self.string = string
    }

    override class func className() -> String{
      return "AnotherSubClass"
    }
  }

  func testTypeOf() {
    let someInstance: SomeBaseClass = SomeSubClass()
    XCTAssertEqual(type(of: someInstance).className(), "SomeSubClass")
  }

  func testInit(){
    let metatype: AnotherSubClass.Type = AnotherSubClass.self
    let obj = metatype.init(string: "hoge")
    XCTAssertEqual(obj.string, "hoge")
  }
}
