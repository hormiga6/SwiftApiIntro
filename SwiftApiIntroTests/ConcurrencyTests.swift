//
//  ConcurrencyTests.swift
//  SwiftApiIntro
//
//

import XCTest

class ConcurrencyTests: XCTestCase {

  private static let queue = DispatchQueue(label: "com.hormiga6.swiftapiintro", attributes: .concurrent)

  class NoVisibility {
    static var ready: Bool! = false
    static var number: Int! = 0
    static func run(){
      queue.async {
        while (!NoVisibility.ready){
          print("[run] I'm running on \(Thread.current)!!")
          usleep(100_000 * 1)
        }
        print("Number is \( NoVisibility.number)")
      }
    }
  }

  func testMemoryVisibility() {
    //In this test case, var "number" and "ready" seem to work fine witout any volatile/memory barrier...
    print("[testExample] I'm running on \(Thread.current)!!")
    NoVisibility.run()
    usleep(1_000_000 * 2)
    NoVisibility.number = 666
    NoVisibility.ready = true
    usleep(1_000_000 * 2)
  }

  func testMutateArray(){
    let semaphore = DispatchSemaphore(value: 0)

    var array = [0]
    let queue = DispatchQueue(label: "MyArray", attributes: .concurrent)
    queue.async(flags: .barrier) {
      array.append(1)
    }
    queue.async(flags: .barrier) {
      array.append(2)
      semaphore.signal()
    }
    _ = semaphore.wait(timeout: .distantFuture)
    XCTAssertEqual(array, [0,1,2])
  }
}
