//
//  SimpleTestViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/13.
//  간이 테스트 뷰

import UIKit

class SimpleTestViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func onBtnTest(_ sender: UIButton) {
        
        UserDefaults.standard.set("ISFJ", forKey: "UserMBTI")
        print(UserDefaults.standard.value(forKey: "UserMBTI") as! String)
        
    }
    
    @IBAction func onBtnTestReset(_ sender: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "UserMBTI")
        print(UserDefaults.standard.value(forKey: "UserMBTI") as? String)
    }
    
    
    

}
