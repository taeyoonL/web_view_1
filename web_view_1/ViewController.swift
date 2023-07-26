//
//  ViewController.swift
//  web_view_1
//
//  Created by 이태윤 on 2023/07/07.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    
    @IBOutlet var text_field: UITextField!
    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet var web_view: WKWebView!
    
    func loadwebpage (_ url : String) {
        let myurl = URL(string: url)
        let myrequest = URLRequest(url: myurl!)
        web_view.load(myrequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        web_view.navigationDelegate = self
        loadwebpage("https://2sam.net")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.startAnimating()
        indicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    func checkurl (_ url : String) -> String {
        var strurl = url
        let strfix = strurl.hasPrefix("http://")
        if !strfix {
            strurl = "http://" + strurl
        }
        return strurl
    }
    
    @IBAction func go(_ sender: UIButton) {
        let myurl = checkurl(text_field.text!)
        text_field.text = ""
        loadwebpage(myurl)
    }
    
    @IBAction func site_1(_ sender: UIButton) {
        loadwebpage("https://google.com")
    }
    
    
    @IBAction func site_2(_ sender: UIButton) {
        loadwebpage("https://naver.com")
    }
    
    
    @IBAction func html(_ sender: UIButton) {
        let html_string = "<h1>HTML String</h1><p>String 변수를 이용한 웹 페이지</p><p><a href=\"https://2sam.net\">2sam</a>로 이동</p>"
        web_view.loadHTMLString(html_string, baseURL: nil)
    }
    
    
    @IBAction func file(_ sender: UIButton) {
        let filepath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myurl = URL(fileURLWithPath: filepath!)
        let myrequest = URLRequest(url: myurl)
        web_view.load(myrequest)
    }
    
    
    @IBAction func stop(_ sender: UIBarButtonItem) {
        web_view.stopLoading()
    }
    
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        web_view.reload()
    }
    
    
    @IBAction func rewind(_ sender: UIBarButtonItem) {
        web_view.goBack()
    }
    
    
    @IBAction func fast_forward(_ sender: UIBarButtonItem) {
        web_view.goForward()
    }
    
}

