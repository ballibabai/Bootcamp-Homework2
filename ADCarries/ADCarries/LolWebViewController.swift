//
//  LolWebViewController.swift
//  ADCarries
//
//  Created by İbrahim Ballıbaba on 17.09.2022.
//

import UIKit
import WebKit

class LolWebViewController: UIViewController {
    //MARK: - UI Elements
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        toWeb()
    }
    
    //MARK: - Functions
    //go to website
    func toWeb(){
        
        if let url = URL.init(string: "https://www.leagueoflegends.com/tr-tr/champions/"){
            let urlReq = URLRequest(url: url)
            webView.load(urlReq)
        }
    }

}
