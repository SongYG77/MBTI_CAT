//
//  ViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/13.
//
//  메인 뷰 컨트롤러
// 고양이 사진 오면 이후 작업
// se 모델 지원을 위해 리스트 수정 필요.
// 고민



import UIKit
import Firebase


@available(iOS 13.0, *)
class MainViewController: UIViewController {
    
    @IBOutlet weak var UserMBTI_Image: UIImageView!
    
    @IBOutlet weak var NicknameLabel: UILabel!
    
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
    
    @IBOutlet weak var SimilarTitle_Label: UILabel!
    @IBOutlet weak var RankTitle_Label: UILabel!
    
    @IBOutlet weak var MyCatLabel: UILabel!
    @IBOutlet weak var MyPersentLabel: UILabel!
    
    @IBOutlet weak var BGImg: UIImageView!
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var UserInfo : String? = nil
    
    var time : Timer?
    var maxtime : Float = 0.0
    
    
    var isnewData : Bool = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.mainVC = self

       
        BGImg.layer.zPosition = -1
    
        InfoView.layer.cornerRadius = 15
        InfoView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        InfoView.layer.borderWidth = 2
        InfoView.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        
        SimilarTitle_Label.layer.cornerRadius = 15
        SimilarTitle_Label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        SimilarTitle_Label.clipsToBounds = true
        
        
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
        Rank1View.layer.cornerRadius = 0
        Rank2View.layer.borderWidth = 2
        Rank2View.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        Rank2View.layer.cornerRadius = 0
        Rank3View.layer.borderWidth = 2
        Rank3View.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        Rank3View.layer.cornerRadius = 0
        Rank4View.layer.borderWidth = 2
        Rank4View.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        Rank4View.layer.cornerRadius = 15
        Rank4View.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        RankTitle_Label.layer.cornerRadius = 15
        RankTitle_Label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        RankTitle_Label.clipsToBounds = true
        
        UserMBTI_Image.layer.cornerRadius = 10
        UserMBTI_Image.layer.borderWidth = 2
        UserMBTI_Image.layer.borderColor = UIColor.lightGray.cgColor
        UserMBTI_Image.clipsToBounds = true
        
        
        
        PrepareAnimation()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.value(forKey: "CatRanking1") != nil {
            
            
            UserInfo = (UserDefaults.standard.value(forKey: "CatRanking1") as! String)
            UserMBTI_Image.image = UIImage(named: UserInfo ?? "SampleCat" + ".png")
            UserMBTI_Image.isHidden = false
            NicknameLabel.text = (UserDefaults.standard.value(forKey: "Nickname") as! String)
            
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
            
            
       
            Rank1PercentProgress.progressTintColor? = UIColor(displayP3Red: 227/255, green: 183/255, blue: 160/255, alpha: 1)
            Rank1PercentProgress.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            
            Rank2PercentProgress.progressTintColor? = UIColor(displayP3Red: 237/255, green: 205/255, blue: 187/255, alpha: 1)
            Rank2PercentProgress.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            
            Rank3PercentProgress.progressTintColor? = UIColor(displayP3Red: 237/255, green: 205/255, blue: 187/255, alpha: 1)
            Rank3PercentProgress.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            
            Rank4PercentProgress.progressTintColor? = UIColor(displayP3Red: 237/255, green: 205/255, blue: 187/255, alpha: 1)
            Rank4PercentProgress.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            
            ShowAnimation()
            
        }
        else {
            
            UserMBTI_Image.image = nil
            NicknameLabel.text = ""
            
            Rank1PercentProgress.progress = 0.5
            Rank2PercentProgress.progress = 0.5
            Rank3PercentProgress.progress = 0.5
            Rank4PercentProgress.progress = 0.5
            
            Rank1PercentProgress.progressTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            Rank1PercentProgress.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            Rank2PercentProgress.progressTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            Rank2PercentProgress.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            Rank3PercentProgress.progressTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            Rank3PercentProgress.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            Rank4PercentProgress.progressTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            Rank4PercentProgress.trackTintColor? = UIColor(displayP3Red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            
            
            ShowAnimation()
        }
        
        if UserDefaults.standard.value(forKey: "CatRanking1") != nil {
            UserInfo = (UserDefaults.standard.value(forKey: "CatRanking1") as! String)
            UserMBTI_Image.image = UIImage(named: UserInfo ?? "SampleCat" + ".png")
            MyCatLabel.text = UserDefaults.standard.value(forKey: "CatRanking1") as? String
            
            let myper = (Float(UserDefaults.standard.value(forKey: "Ranking_Percent1") as? String ?? "0") ?? 0) * 100.0
            MyPersentLabel.text = "닮은 정도 : " + String(myper) + "%"
            
            
        }
        else {
            UserMBTI_Image.image = nil
            MyCatLabel.text = "결과가 없습니다."
            MyPersentLabel.text = ""
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        if isnewData == true {
            PrepareAnimation() 
        }
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
        
        let Rank1Percent = Float( UserDefaults.standard.value(forKey: "Ranking_Percent1") as? String ?? "0" )!
        let Rank2Percent = Float( UserDefaults.standard.value(forKey: "Ranking_Percent2") as? String ?? "0" )!
        let Rank3Percent = Float( UserDefaults.standard.value(forKey: "Ranking_Percent3") as? String ?? "0" )!
        let Rank4Percent = Float( UserDefaults.standard.value(forKey: "Ranking_Percent4") as? String ?? "0" )!
        
        maxtime += 0.01
        Rank1PercentProgress.setProgress((Rank1Percent * maxtime), animated: true)
        Rank2PercentProgress.setProgress((Rank2Percent * maxtime), animated: true)
        Rank3PercentProgress.setProgress((Rank3Percent * maxtime), animated: true)
        Rank4PercentProgress.setProgress((Rank4Percent * maxtime), animated: true)
        
        if maxtime >= 1.0 { time?.invalidate()}
        
    }

}

