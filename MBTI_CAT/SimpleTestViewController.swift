//
//  SimpleTestViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/13.
//  간이 테스트 뷰

import UIKit

class SimpleTestViewController: UIViewController {
    
    
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var TestNoticeTV: UITextView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StartButton.layer.borderWidth = 2
        StartButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        StartButton.layer.cornerRadius = 10
        StartButton.clipsToBounds = true
        
        TestNoticeTV.layer.borderWidth = 2
        TestNoticeTV.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        TestNoticeTV.layer.cornerRadius = 20
        TestNoticeTV.clipsToBounds = true
        
    }
    
    
    
  
    
    
    @IBAction func onBtnStart(_ sender: UIButton) {
        
        let NextVC = self.storyboard?.instantiateViewController(withIdentifier: "FirstTestVC") as! FirstTestViewController
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
}
