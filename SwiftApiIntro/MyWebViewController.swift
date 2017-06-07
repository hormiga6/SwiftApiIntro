//
//  MyWebViewController.swift
//  SwiftApiIntro
//
//
//

import UIKit

class MyWebViewController: UIViewController {

  @IBOutlet weak var webView: UIWebView!

  @IBAction func clickClose(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    let req = URLRequest(url: URL(string: "https://google.com")!)
    webView.loadRequest(req)
  }
}
