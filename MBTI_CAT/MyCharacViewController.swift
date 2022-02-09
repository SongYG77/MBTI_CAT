//
//  MyPageViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/13.
//
//  마이페이지
//
//  할일
//  버튼 연동
//  버튼 디자인 구성
//  오토레이아웃 적용.


import UIKit

class MyCharacController: UIViewController {

    
    @IBOutlet weak var MyResultButton: UIButton!
    @IBOutlet weak var FiveCharButton: UIButton!
    @IBOutlet weak var ResetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MyResultButton.layer.cornerRadius = 15
        MyResultButton.clipsToBounds = true
        MyResultButton.layer.borderWidth = 2
        MyResultButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        
        FiveCharButton.layer.cornerRadius = 15
        FiveCharButton.clipsToBounds = true
        FiveCharButton.layer.borderWidth = 2
        FiveCharButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        
        ResetButton.layer.cornerRadius = 15
        ResetButton.clipsToBounds = true
        ResetButton.layer.borderWidth = 2
        ResetButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        
    }
    

    @IBAction func onBtnResult(_ sender: UIButton) {
        
    }
    
    @IBAction func onBtnFiveChar(_ sender: UIButton) {
        
    }
    
    
    
    @IBAction func onBtnReset(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "주의!", message: "사용자 정보가 초기화됩니다.", preferredStyle: .alert)
                let resetAltyes = UIAlertAction(title: "네", style: .destructive){
                    (_) in

                    UserDefaults.standard.removeObject(forKey: "CatRanking1")
                    UserDefaults.standard.removeObject(forKey: "CatRanking2")
                    UserDefaults.standard.removeObject(forKey: "CatRanking3")
                    UserDefaults.standard.removeObject(forKey: "CatRanking4")
                    UserDefaults.standard.removeObject(forKey: "Ranking_Percent1")
                    UserDefaults.standard.removeObject(forKey: "Ranking_Percent2")
                    UserDefaults.standard.removeObject(forKey: "Ranking_Percent3")
                    UserDefaults.standard.removeObject(forKey: "Ranking_Percent4")

                }
                let resetAltno = UIAlertAction(title: "아니오" , style: .cancel, handler: nil)

                alert.addAction(resetAltyes)
                alert.addAction(resetAltno)

                present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func onBtnDevInfo(_ sender: UIButton) {
        
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DevInfoVC") as! DevInfoViewController
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnSuggestions(_ sender: UIButton) {
        
        let NextVC = self.storyboard?.instantiateViewController(identifier: "SuggestionsVC") as! SuggestionsViewController
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    
}
