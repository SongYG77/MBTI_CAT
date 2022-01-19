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
        
        UserDefaults.standard.set("ISFJ", forKey: "UserRes")
        UserDefaults.standard.set("0.4", forKey: "EI_Data")
        UserDefaults.standard.set("0.1", forKey: "NS_Data")
        UserDefaults.standard.set("0.8", forKey: "FT_Data")
        UserDefaults.standard.set("0.2", forKey: "PJ_Data")
        
        print(UserDefaults.standard.value(forKey: "UserRes") as! String)
        
        
        
    }
    
    
    
  
    
    
    @IBAction func onBtnStart(_ sender: UIButton) {
        
        let NextVC = self.storyboard?.instantiateViewController(withIdentifier: "FirstTestVC") as! FirstTestViewController
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
}
