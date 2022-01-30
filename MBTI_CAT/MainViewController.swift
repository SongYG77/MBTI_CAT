//
//  ViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/13.
//
//  메인 뷰 컨트롤러

// 프로그래스를 애니메이션 처럼.(찾아봐서 짜야함)
// 사진부분 배열을 다시 ( 내 고양이와 연결하고 옆에 이름 닮은 정도, 정보 확인 버튼 )


import UIKit


@available(iOS 13.0, *)
class MainViewController: UIViewController {
    
    @IBOutlet weak var UserMBTI_Image: UIImageView!
    
    
    @IBOutlet weak var Rank1PercentProgress: UIProgressView!
    @IBOutlet weak var Rank1CatLabel: UILabel!
    
    @IBOutlet weak var Rank2PercentProgress: UIProgressView!
    @IBOutlet weak var Rank2CatLabel: UILabel!
    
    @IBOutlet weak var Rank3PercentProgress: UIProgressView!
    @IBOutlet weak var Rank3CatLabel: UILabel!
    
    @IBOutlet weak var Rank4PercentProgress: UIProgressView!
    @IBOutlet weak var Rank4CatLabel: UILabel!
    
    
    @IBOutlet weak var Rank1View: UIView!
    @IBOutlet weak var Rank2View: UIView!
    @IBOutlet weak var Rank3View: UIView!
    @IBOutlet weak var Rank4View: UIView!
    
    @IBOutlet weak var InfoView: UIView!
    
    @IBOutlet weak var ResetBtn: UIButton!
    
    
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var UserInfo : String? = nil
    
    var time : Timer?
    var maxtime : Float = 0.0
    var Rank1Percent = Float( UserDefaults.standard.value(forKey: "Ranking_Percent1") as? String ?? "0" )!
    var Rank2Percent = Float( UserDefaults.standard.value(forKey: "Ranking_Percent2") as? String ?? "0" )!
    var Rank3Percent = Float( UserDefaults.standard.value(forKey: "Ranking_Percent3") as? String ?? "0" )!
    var Rank4Percent = Float( UserDefaults.standard.value(forKey: "Ranking_Percent4") as? String ?? "0" )!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.mainVC = self

        InfoView.layer.cornerRadius = 20
        InfoView.layer.borderWidth = 2
        InfoView.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        Rank2PercentProgress.clipsToBounds = true
        
        Rank1PercentProgress.transform = Rank1PercentProgress.transform.scaledBy(x: 1, y: 3)
        Rank1PercentProgress.layer.cornerRadius = 10
        Rank1PercentProgress.clipsToBounds = true
        
        Rank2PercentProgress.transform = Rank2PercentProgress.transform.scaledBy(x: 1, y: 3)
        Rank2PercentProgress.layer.cornerRadius = 10
        Rank2PercentProgress.clipsToBounds = true
        
        Rank3PercentProgress.transform = Rank3PercentProgress.transform.scaledBy(x: 1, y: 3)
        Rank3PercentProgress.layer.cornerRadius = 10
        Rank3PercentProgress.clipsToBounds = true
        
        Rank4PercentProgress.transform = Rank4PercentProgress.transform.scaledBy(x: 1, y: 3)
        Rank4PercentProgress.layer.cornerRadius = 10
        Rank4PercentProgress.clipsToBounds = true
        
        Rank1View.layer.borderWidth = 2
        Rank1View.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        Rank1View.layer.cornerRadius = 15
        Rank2View.layer.borderWidth = 2
        Rank2View.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        Rank2View.layer.cornerRadius = 15
        Rank3View.layer.borderWidth = 2
        Rank3View.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        Rank3View.layer.cornerRadius = 15
        Rank4View.layer.borderWidth = 2
        Rank4View.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        Rank4View.layer.cornerRadius = 15
        
        
        if UserDefaults.standard.value(forKey: "UserRes") != nil {
            UserInfo = (UserDefaults.standard.value(forKey: "UserRes") as! String)
            UserMBTI_Image.image = UIImage(named: UserInfo! + "_Image.png")
        }
        else {
            UserMBTI_Image.image = nil
            UserMBTI_Image.isHidden = true
        }
        
        PrepareAnimation()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.value(forKey: "CatRanking1") != nil {
            
            
            UserInfo = (UserDefaults.standard.value(forKey: "CatRanking1") as! String)
            UserMBTI_Image.image = UIImage(named: UserInfo! + "_Image.png")
            UserMBTI_Image.isHidden = false
            ResetBtn.isHidden = false
            
            Rank1CatLabel.text = "1. " + (UserDefaults.standard.value(forKey: "CatRanking1") as! String)
            Rank2CatLabel.text = "2. " + (UserDefaults.standard.value(forKey: "CatRanking2") as! String)
            Rank3CatLabel.text = "3. " + (UserDefaults.standard.value(forKey: "CatRanking3") as! String)
            Rank4CatLabel.text = "4. " + (UserDefaults.standard.value(forKey: "CatRanking4") as! String)
            
            
//            Rank1PercentProgress.progress = Float(UserDefaults.standard.value(forKey: "Ranking_Percent1") as? String ?? "0")!
//            Rank2PercentProgress.progress = Float(UserDefaults.standard.value(forKey: "Ranking_Percent2") as? String ?? "0")!
//            Rank3PercentProgress.progress = Float(UserDefaults.standard.value(forKey: "Ranking_Percent3") as? String ?? "0")!
//            Rank4PercentProgress.progress = Float(UserDefaults.standard.value(forKey: "Ranking_Percent4") as? String ?? "0")!
            Rank1PercentProgress.progress = 0
            Rank2PercentProgress.progress = 0
            Rank3PercentProgress.progress = 0
            Rank4PercentProgress.progress = 0
            
            
       
            Rank1PercentProgress.progressTintColor? = UIColor(displayP3Red: 164/255, green: 255/255, blue: 237/255, alpha: 1)
            Rank1PercentProgress.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            
            Rank2PercentProgress.progressTintColor? = UIColor(displayP3Red: 210/255, green: 255/255, blue: 237/255, alpha: 1)
            Rank2PercentProgress.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            
            Rank3PercentProgress.progressTintColor? = UIColor(displayP3Red: 210/255, green: 255/255, blue: 237/255, alpha: 1)
            Rank3PercentProgress.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            
            Rank4PercentProgress.progressTintColor? = UIColor(displayP3Red: 210/255, green: 255/255, blue: 237/255, alpha: 1)
            Rank4PercentProgress.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            
            ShowAnimation()
            
        }
        else {
            
            UserMBTI_Image.image = nil
            UserMBTI_Image.isHidden = true
            ResetBtn.isHidden = true
            
            Rank1PercentProgress.progress = 0.5
            
            Rank1PercentProgress.progressTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            Rank1PercentProgress.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    
    @IBAction func onBtnReset(_ sender: UIButton) {
        let alert = UIAlertController(title: "주의!", message: "사용자 정보가 초기화됩니다.", preferredStyle: .alert)
        let resetAltyes = UIAlertAction(title: "네", style: .destructive){
            (_) in
            
            UserDefaults.standard.removeObject(forKey: "UserRes")
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
    
    
    //MARK: -애니메이션 파트
    private func PrepareAnimation() {
        
        Rank1View.alpha = 0
        Rank2View.alpha = 0
        Rank3View.alpha = 0
        Rank4View.alpha = 0
        
        InfoView.alpha = 0
    }
    
    private func ShowAnimation() {
        
        
        UIView.animate(withDuration: 0.8, animations: {
            self.InfoView.alpha = 1
        }, completion: {_ in
            
            //랭킹 애니메이션
            UIView.animate(withDuration: 0.5, animations: {
                self.Rank1View.alpha = 1
                self.Rank2View.alpha = 1
                self.Rank3View.alpha = 1
                self.Rank4View.alpha = 1
                
            } , completion: { _ in
                print("completion")
                self.startAnimateProgress()
                
            })
        })
        
        
    }
    
    func startAnimateProgress() {
        
        maxtime = 0.0
        time?.invalidate()
        time = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(progressAnimate), userInfo: nil, repeats: true)
               
    }
    @objc func progressAnimate() {
        
        maxtime += 0.01
        Rank1PercentProgress.setProgress((Rank1Percent * maxtime), animated: true)
        Rank2PercentProgress.setProgress((Rank2Percent * maxtime), animated: true)
        Rank3PercentProgress.setProgress((Rank3Percent * maxtime), animated: true)
        Rank4PercentProgress.setProgress((Rank4Percent * maxtime), animated: true)
        
        if maxtime >= 1.0 { time?.invalidate()}
        
    }

}

