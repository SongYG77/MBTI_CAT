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
    
    @IBOutlet weak var E_I_ProgressView: UIProgressView!
    @IBOutlet weak var N_S_ProgressView: UIProgressView!
    @IBOutlet var F_T_ProgressView: UIProgressView!
    @IBOutlet weak var P_J_ProgressView: UIProgressView!
    
    @IBOutlet weak var E_Label: UILabel!
    @IBOutlet weak var I_Label: UILabel!
    @IBOutlet weak var N_Label: UILabel!
    @IBOutlet weak var S_Label: UILabel!
    @IBOutlet weak var T_Label: UILabel!
    @IBOutlet weak var F_Label: UILabel!
    @IBOutlet weak var J_Label: UILabel!
    @IBOutlet weak var P_Label: UILabel!
    @IBOutlet weak var ResetBtn: UIButton!
    
    
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var UserMBTI : String? = nil
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.mainVC = self

        E_I_ProgressView.transform = E_I_ProgressView.transform.scaledBy(x: 1, y: 3)
        E_I_ProgressView.layer.cornerRadius = 10
        E_I_ProgressView.clipsToBounds = true
        
        N_S_ProgressView.transform = N_S_ProgressView.transform.scaledBy(x: 1, y: 3)
        N_S_ProgressView.layer.cornerRadius = 10
        N_S_ProgressView.clipsToBounds = true
        
        F_T_ProgressView.transform = F_T_ProgressView.transform.scaledBy(x: 1, y: 3)
        F_T_ProgressView.layer.cornerRadius = 10
        F_T_ProgressView.clipsToBounds = true
        
        P_J_ProgressView.transform = P_J_ProgressView.transform.scaledBy(x: 1, y: 3)
        P_J_ProgressView.layer.cornerRadius = 10
        P_J_ProgressView.clipsToBounds = true
        
        
        
        if UserDefaults.standard.value(forKey: "UserMBTI") != nil {
            UserMBTI = (UserDefaults.standard.value(forKey: "UserMBTI") as! String)
            UserMBTI_Image.image = UIImage(named: UserMBTI! + "_Image.png")
        }
        else {
            UserMBTI_Image.image = nil
            UserMBTI_Image.isHidden = true
        }
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.value(forKey: "UserMBTI") != nil {
            
            
            UserMBTI = (UserDefaults.standard.value(forKey: "UserMBTI") as! String)
            UserMBTI_Image.image = UIImage(named: UserMBTI! + "_Image.png")
            UserMBTI_Image.isHidden = false
            ResetBtn.isHidden = false
            
            E_I_ProgressView.progress = Float(UserDefaults.standard.value(forKey: "EI_Data") as? String ?? "0")! / 9.0
            N_S_ProgressView.progress = Float(UserDefaults.standard.value(forKey: "NS_Data") as? String ?? "0")! / 9.0
            F_T_ProgressView.progress = Float(UserDefaults.standard.value(forKey: "FT_Data") as? String ?? "0")! / 9.0
            P_J_ProgressView.progress = Float(UserDefaults.standard.value(forKey: "PJ_Data") as? String ?? "0")! / 9.0
            
            if Float(UserDefaults.standard.value(forKey: "EI_Data") as? String ?? "0")! > 4.5 {
                
                E_I_ProgressView.progressTintColor? = UIColor(displayP3Red: 201/255, green: 140/255, blue: 255/255, alpha: 1)
                E_I_ProgressView.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                E_Label.textColor? = UIColor(displayP3Red: 201/255, green: 140/255, blue: 255/255, alpha: 1)
                I_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                
            }
            else {
                
                E_I_ProgressView.progressTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                E_I_ProgressView.trackTintColor? = UIColor(displayP3Red: 201/255, green: 140/255, blue: 255/255, alpha: 1)
                E_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                I_Label.textColor? = UIColor(displayP3Red: 201/255, green: 140/255, blue: 255/255, alpha: 1)
                
            }
            
            if Float(UserDefaults.standard.value(forKey: "NS_Data") as? String ?? "0")! > 4.5 {
                
                N_S_ProgressView.progressTintColor? = UIColor(displayP3Red: 138/255, green: 255/255, blue: 229/255, alpha: 1)
                N_S_ProgressView.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                N_Label.textColor? = UIColor(displayP3Red: 138/255, green: 255/255, blue: 229/255, alpha: 1)
                S_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                
            }
            else {
                
                N_S_ProgressView.progressTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                N_S_ProgressView.trackTintColor? = UIColor(displayP3Red: 138/255, green: 255/255, blue: 229/255, alpha: 1)
                N_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                S_Label.textColor? = UIColor(displayP3Red: 138/255, green: 255/255, blue: 229/255, alpha: 1)
                
            }
            
            if Float(UserDefaults.standard.value(forKey: "FT_Data") as? String ?? "0")! > 4.5 {
                
                F_T_ProgressView.progressTintColor? = UIColor(displayP3Red: 255/255, green: 193/255, blue: 100/255, alpha: 1)
                F_T_ProgressView.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                F_Label.textColor? = UIColor(displayP3Red: 255/255, green: 193/255, blue: 100/255, alpha: 1)
                T_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                
            }
            else {
                
                F_T_ProgressView.progressTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                F_T_ProgressView.trackTintColor? = UIColor(displayP3Red: 255/255, green: 193/255, blue: 100/255, alpha: 1)
                F_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                T_Label.textColor? = UIColor(displayP3Red: 255/255, green: 193/255, blue: 100/255, alpha: 1)
                
            }
            
            if Float(UserDefaults.standard.value(forKey: "PJ_Data") as? String ?? "0")! > 4.5 {
                
                P_J_ProgressView.progressTintColor? = UIColor(displayP3Red: 122/255, green: 255/255, blue: 119/255, alpha: 1)
                P_J_ProgressView.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                P_Label.textColor? = UIColor(displayP3Red: 122/255, green: 255/255, blue: 119/255, alpha: 1)
                J_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                
            }
            else {
                
                P_J_ProgressView.progressTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                P_J_ProgressView.trackTintColor? = UIColor(displayP3Red: 122/255, green: 255/255, blue: 119/255, alpha: 1)
                P_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
                J_Label.textColor? = UIColor(displayP3Red: 122/255, green: 255/255, blue: 119/255, alpha: 1)
                
            }
        }
        else {
            
            UserMBTI_Image.image = nil
            UserMBTI_Image.isHidden = true
            ResetBtn.isHidden = true
            
            E_I_ProgressView.progress = 0.5
            N_S_ProgressView.progress = 0.5
            F_T_ProgressView.progress = 0.5
            P_J_ProgressView.progress = 0.5
            
            E_I_ProgressView.progressTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            E_I_ProgressView.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            E_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            I_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            
            N_S_ProgressView.progressTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            N_S_ProgressView.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            N_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            S_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            
            F_T_ProgressView.progressTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            F_T_ProgressView.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            F_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            T_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            
            P_J_ProgressView.progressTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            P_J_ProgressView.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            P_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            J_Label.textColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    
    @IBAction func onBtnReset(_ sender: UIButton) {
        let alert = UIAlertController(title: "주의!", message: "사용자 정보가 초기화됩니다.", preferredStyle: .alert)
        let resetAltyes = UIAlertAction(title: "네", style: .destructive){
            (_) in
            
            UserDefaults.standard.removeObject(forKey: "UserMBTI")
            UserDefaults.standard.removeObject(forKey: "EI_Data")
            UserDefaults.standard.removeObject(forKey: "NS_Data")
            UserDefaults.standard.removeObject(forKey: "FT_Data")
            UserDefaults.standard.removeObject(forKey: "PJ_Data")
            
            self.viewDidAppear(true)
        }
        let resetAltno = UIAlertAction(title: "아니오" , style: .cancel, handler: nil)
        
        alert.addAction(resetAltyes)
        alert.addAction(resetAltno)
        
        present(alert, animated: true, completion: nil)
        
        
        
        
        
    }
    


}

