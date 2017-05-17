//
//  OHHTTPStubsTests.swift
//  SwiftApiIntro
//
//
//

import XCTest
import OHHTTPStubs

class OHHTTPStubsTests: XCTestCase {

  func testGetRquest() {
    let semaphore = DispatchSemaphore(value: 0)

    stub(condition: isHost("google.com"), response: { _ in
      let stubData = "Hello World!".data(using: .utf8)
      return OHHTTPStubsResponse(data: stubData!, statusCode:200, headers:nil)
    })

    let task = URLSession.shared.dataTask(with: URL(string: "https://google.com")!, completionHandler: { (data, response, error) in
      if let data = data {
        XCTAssertEqual(String(data: data, encoding: .utf8)!, "Hello World!")
        semaphore.signal()
      }
    })
    task.resume()
    semaphore.wait()
  }

  func testGetRquestJson() throws {
    let semaphore = DispatchSemaphore(value: 0)

    stub(condition: isHost("google.com"), response: { _ in
      let json = ["hoge":["fuga":"hogefuga"]]
      return OHHTTPStubsResponse(jsonObject: json, statusCode:200, headers:nil)
    })

    let task = URLSession.shared.dataTask(with: URL(string: "https://google.com")!, completionHandler: { (data, response, error) in
      if let data = data {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []),
          let jsonObj = json as? [String: Any],
          let hogeObj = jsonObj["hoge"] as? [String:String],
          let fugaObj = hogeObj["fuga"] else{
            XCTFail()
            return
        }

        XCTAssertEqual(fugaObj, "hogefuga")
        semaphore.signal()
      }
    })
    task.resume()
    semaphore.wait()
  }
}
