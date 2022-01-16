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
        UserDefaults.standard.set("4", forKey: "EI_Data")
        UserDefaults.standard.set("2", forKey: "NS_Data")
        UserDefaults.standard.set("7", forKey: "FT_Data")
        UserDefaults.standard.set("3", forKey: "PJ_Data")
        
        print(UserDefaults.standard.value(forKey: "UserMBTI") as! String)
        
        
        
    }
    
    @IBAction func onBtnTestReset(_ sender: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "UserMBTI")
        UserDefaults.standard.removeObject(forKey: "EI_Data")
        UserDefaults.standard.removeObject(forKey: "NS_Data")
        UserDefaults.standard.removeObject(forKey: "FT_Data")
        UserDefaults.standard.removeObject(forKey: "PJ_Data")
        
    }
    
    @IBAction func onBtnISFPTest(_ sender: UIButton) {
        
        UserDefaults.standard.set("ISFP", forKey: "UserMBTI")
        UserDefaults.standard.set("4", forKey: "EI_Data")
        UserDefaults.standard.set("2", forKey: "NS_Data")
        UserDefaults.standard.set("7", forKey: "FT_Data")
        UserDefaults.standard.set("6", forKey: "PJ_Data")
        
        print(UserDefaults.standard.value(forKey: "UserMBTI") as! String)
    }
    
    

}
