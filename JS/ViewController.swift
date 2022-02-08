//
//  ViewController.swift
//  JS
//
//  Created by Bin CHEN on 07/02/2022.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler {
    let webView = WKWebView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        webView.frame = view.bounds
        configureWebview()

        let button = UIButton(frame: CGRect(x: 0, y: 700, width: 320, height: 50))
        button.setTitle("Refresh", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(refresh), for: .touchUpInside)
    }
    
    @objc func refresh() {
        webView.reload()
//        let url = URL(string: "https://www20-dev-knux.skyrock.fm/2020/chat/")!
//        webView.load(URLRequest(url: url))

    }

    private func configureWebview() {
        let configuration = webView.configuration
        
        let preferences = configuration.preferences
        preferences.javaScriptEnabled = true
        
        
        let contentController = configuration.userContentController
        contentController.add(self, name: "showMobile")
        contentController.add(self, name: "showName")
        contentController.add(self, name: "showSendMsg")
        contentController.add(self, name: "chatInterface")
        
//        let url = URL(string: "https://www20-dev-knux.skyrock.fm/2020/chat/")!
////        let url = URL(string: "http://localhost:8888/index.html")!
//        webView.load(URLRequest(url: url))


        let s = Bundle.main.url(forResource: "Test", withExtension: "html")!
        do {
            let content = try String(contentsOf: s, encoding: .utf8)
            webView.loadHTMLString(content, baseURL: nil)
        } catch {
            print(error)
        }
        
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
    }
    

}

