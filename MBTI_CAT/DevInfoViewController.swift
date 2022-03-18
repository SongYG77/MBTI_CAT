//
//  DevInfoViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/02/07.
//

import UIKit

class DevInfoViewController: UIViewController {

    @IBOutlet weak var MadeByLabel: UILabel!
    @IBOutlet weak var InfoView: UIView!
    @IBOutlet weak var TabmadeinfoView: UIView!
    @IBOutlet weak var TabMadeLabel: UILabel!
    
    @IBOutlet weak var BackButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MadeByLabel.clipsToBounds = true
        MadeByLabel.layer.cornerRadius = 15
        MadeByLabel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        TabMadeLabel.clipsToBounds = true
        TabMadeLabel.layer.cornerRadius = 15
        TabMadeLabel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        BackButton.layer.borderWidth = 2
        BackButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        BackButton.layer.cornerRadius = 10
        BackButton.clipsToBounds = true
        
        InfoView.layer.borderWidth = 2
        InfoView.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        InfoView.layer.cornerRadius = 15
        InfoView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        InfoView.clipsToBounds = true
        
        TabmadeinfoView.layer.borderWidth = 2
        TabmadeinfoView.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        TabmadeinfoView.layer.cornerRadius = 15
        TabmadeinfoView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        TabmadeinfoView.clipsToBounds = true
        
        print("Test")
    }
    

    @IBAction func onBtnBack(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func onBtnWebView(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "WebViewVC") as! TabImageWebViewController
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
}
