//
//  TabImageWebViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/03/18.
//

import UIKit
import WebKit

class TabImageWebViewController: UIViewController {
    
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var WebView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        BackButton.layer.borderWidth = 2
        BackButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        BackButton.layer.cornerRadius = 10
        BackButton.clipsToBounds = true
        
        loadWebPage("https://www.flaticon.com/")
        
    }
    
    func loadWebPage(_ url : String) {
        
        let MyURL = URL(string: url)
        let MyRequest = URLRequest(url: MyURL!)
        WebView.load(MyRequest)
    }

    @IBAction func onBtnBack(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
