//
//  MyWebViewController.swift
//  SwiftApiIntro
//
//
//

import UIKit

class MyWebViewController: UIViewController, UIWebViewDelegate, NSURLConnectionDelegate, NSURLConnectionDataDelegate {

  @IBOutlet weak var webView: UIWebView!

  @IBAction func clickClose(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    webView.delegate = self
    let req = URLRequest(url: URL(string: "http://google.com")!)
    webView.loadRequest(req)
  }

  var selfCertError = false
  var failedRequest: URLRequest?
}

extension MyWebViewController {

  func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    if selfCertError {
      failedRequest = request
      NSURLConnection(request: request, delegate: self)?.start()
      return false
    }
    return true
  }

  func connection(_ connection: NSURLConnection,
                  willSendRequestFor challenge: URLAuthenticationChallenge){
    //server trust error
    if challenge.protectionSpace.authenticationMethod == "NSURLAuthenticationMethodServerTrust" {
      //set generated credential
      challenge.sender?.use(URLCredential(trust: challenge.protectionSpace.serverTrust!), for: challenge)
    }

    challenge.sender?.continueWithoutCredential(for: challenge)
  }

  func connection(_ connection: NSURLConnection, didReceive data: Data) {
    selfCertError = false
    connection.cancel()
    if let failedRequest = failedRequest {
      //aftar connection establised successfully, load web view again
      webView.loadRequest(failedRequest)
    }
  }
}
