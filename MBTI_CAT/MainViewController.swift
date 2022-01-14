//
//  ViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/13.
//
//  메인 뷰 컨트롤러


import UIKit


@available(iOS 13.0, *)
class MainViewController: UIViewController {
    
    @IBOutlet weak var UserMBTI_Image: UIImageView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var UserMBTI : String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.value(forKey: "UserMBTI") != nil {
            UserMBTI = (UserDefaults.standard.value(forKey: "UserMBTI") as! String)
            UserMBTI_Image.image = UIImage(named: UserMBTI! + "_Image.png")
        }
        else {
            UserMBTI_Image.image = nil
        }
        
        
        
    }


}

