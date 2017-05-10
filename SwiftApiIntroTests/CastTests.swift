//
//  CastTests.swift
//  SwiftApiIntro
//
//
//

import XCTest

class CastTests: XCTestCase {

  func testCast() {
    let hoge = "hoge"
    let ao: AnyObject = hoge as! AnyObject
    let casted = ao as? String
    XCTAssertEqual(casted, "hoge")
  }

  func testCastFailed() {
    let hoge = "hoge"
    let ao: AnyObject = hoge as! AnyObject
    guard let casted = ao as? Array<String> else {
      print("fuckk hell")
      return
    }
    XCTAssertNil(casted)
  }
}
