//
//  HttpRequest.swift
//  SwiftApiIntro
//
//  Created by hormiga6 on 2017/05/04.
//
//

import XCTest

class HttpRequest: XCTestCase {

  func testGetWithURLSessioin() {
    let semaphore = DispatchSemaphore(value: 0)

    let url = URL(string: "https://google.com")!
    let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
      if let data = data {
        print(String(data: data, encoding: String.Encoding.ascii)!)
      }
      if let response = response {
        print(response)
      }
      if let error = error {
        print(error)
        XCTFail()
      }
      semaphore.signal()
    })
    task.resume()
    _ = semaphore.wait(timeout: .distantFuture)
  }

  func testGetToSelfSignedCert(){
    let semaphore = DispatchSemaphore(value: 0)

    //change domain to the server with self signed cert
    //you can use "allowsAnyHTTPSCertificateForHost" before swift 2.3
    let url = URL(string: "https://google.com")!
    let session = URLSession(configuration: URLSessionConfiguration.default, delegate: AcceptSSCDelegate(), delegateQueue: nil)

    let task = session.dataTask(with: url, completionHandler: {(data, response, error) in
      if let response = response {
        print(response)
      }
      if let error = error {
        print(error)
        XCTFail()
      }
      semaphore.signal()
    })
    task.resume()
    _ = semaphore.wait(timeout: .distantFuture)
  }

  class AcceptSSCDelegate: NSObject, URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Swift.Void){
      let credential = challenge.protectionSpace.authenticationMethod == "NSURLAuthenticationMethodServerTrust" ? URLCredential(trust: challenge.protectionSpace.serverTrust!) : nil
      completionHandler(.useCredential, credential)
    }
  }
}
