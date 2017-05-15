//
//  ConditionalTests.swift
//  SwiftApiIntro
//
//
//

import XCTest

class ConditionalTests: XCTestCase {

  func testCommaSeparated() {
    guard let hoge1 = Optional.some("hoge"), let fuga1 = Optional.some("fuga") else {
      XCTFail()
    }
    print(hoge1 + fuga1)

    //commap separated conditionald are evalueated one by one from top
    //https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID333
    guard let hoge2: String = Optional.none, let fuga2 = Optional.some("fuga") else {
      return
    }
    print(hoge2 + fuga2)
    XCTFail()
  }
}
