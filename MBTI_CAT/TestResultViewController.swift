//
//  TestResultViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/19.
//

//  이후 작업
//  결과 저장 아래 상세 보기 버튼 추가
//  버튼 누를 시 묘종별 네비게이션으로 이동후 내 결과로 나온 묘종 선택하여 네비게이션 이동
//  해당 기능은 더 찾아봐야함.
//  화면 ui 변경
//  내 결과에 맞는 사진 넣을 예정
//  오토 레이아웃 잡아야함.


import UIKit

class TestResultViewController: UIViewController {

    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var RankingTV1: UITextView!
    @IBOutlet weak var RankingTV2: UITextView!
    @IBOutlet weak var RankingTV3: UITextView!
    @IBOutlet weak var RankingTV4: UITextView!
    @IBOutlet weak var ResultCatImg_Image: UIImageView!
    
    @IBOutlet weak var StoreButton: UIButton!
    @IBOutlet weak var DetailButton: UIButton!
    
    @IBOutlet weak var RankTitleLabel: UILabel!
    @IBOutlet weak var RankFrameView: UIView!
    
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var TestResultARR : Array<Float> = [] // 이전 화면에서 받아오는 결과값
    var maxresult : Array<Float> = [0,0,0,0]
    var MyCatRanking : Array<String> = ["","","",""]
    var percentRanking : Array<Float> = [0,0,0,0]
    var splitnum : Int = 0
    var Resultcountvalue = 0
    
    var temp_getresultarr : Array<String> = []
    
    var SumResultArr : Array<Float> = [0,0,0,0,0,0,0,0] // 결과값 정제해서 넣을
    
    var User_Result : String = ""

    var CatResultDic : Dictionary<String,String> = [
        
        "Belinese"      :   "1 1 0 0 1 0 1 1", //    발리니즈
        "Bombay"        :   "1 1 1 0 0 0 0 1", //    봄베이
        "Egyptian Mau"  :   "1 0 0 1 0 0 0 1", //    이집션마우
        "Cymric"        :   "1 0 1 0 1 0 0 0", //    킴릭
        "American Curl" :   "1 1 0 0 0 0 0 1", //    아메리칸컬
        "Abyssinian"    :   "1 1 0 0 0 0 0 0", //    아비시안
        "Bengal"        :   "1 1 0 0 1 1 0 0", //    뱅갈
        "Ragdoll"       :   "0 1 1 0 0 0 0 0", //    렉돌
        "Maine Coon"    :   "0 1 1 1 0 0 1 0", //    메인쿤
        "Exotic"        :   "0 0 1 0 0 0 0 0", //    엑조틱
        "American Short":   "1 1 0 1 1 0 0 1", //    아메리칸숏
        "Persian"       :   "0 1 1 0 0 0 0 0", //    페르시안
        "Burmilla"      :   "0 1 0 0 0 0 0 0", //    버밀라
        "Norwegian forest": "0 1 0 1 0 1 0 0", //    노르웨이숲
        "British Short" :   "0 1 1 1 0 0 0 0", //    브리티시 숏
        "Himalayan"     :   "0 1 1 0 0 0 0 0", //    히말라얀
        "Scottish Fold" :   "0 1 0 0 0 0 0 0", //    스코티시 폴드
        "Siamese"       :   "0 1 0 0 1 0 0 0", //    샴
        "Turkish angora":   "1 0 0 0 0 0 0 0", //    터키시 앙고라
        "Cornish Rex"   :   "1 0 0 0 0 1 0 0", //    코니시 렉스
        "Japanese Bobtail": "1 0 0 0 1 0 0 0", //    재패지즈 밥테일
        "Javanese"      :   "1 0 0 0 0 0 1 0", //    자바니즈
        "Burmese"       :   "0 0 1 0 0 0 0 1", //    버미즈
        "Chantilly"     :   "0 0 0 0 0 0 1 0", //    샹틀리
        "Birman"        :   "0 0 0 0 0 0 0 1", //    버만
    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SumResultArr[0] = TestResultARR[0] + TestResultARR[1] / 2
        SumResultArr[1] = TestResultARR[2] + TestResultARR[3] / 2
        SumResultArr[2] = TestResultARR[4] + TestResultARR[5] / 2
        SumResultArr[3] = TestResultARR[6]
        SumResultArr[4] = TestResultARR[7]
        SumResultArr[5] = TestResultARR[8]
        SumResultArr[6] = TestResultARR[9]
        SumResultArr[7] = TestResultARR[10] + TestResultARR[11] / 2
        
        Get_Result(SumResultArr)
        ResultLabel.text = User_Result
        RankingTV1.text = "1. " + MyCatRanking[0] + " : " + String(percentRanking[0] * 100) + "%\n"
        RankingTV2.text = "2. " + MyCatRanking[1] + " : " + String(percentRanking[1] * 100) + "%\n"
        RankingTV3.text = "3. " + MyCatRanking[2] + " : " + String(percentRanking[2] * 100) + "%\n"
        RankingTV4.text = "4. " + MyCatRanking[3] + " : " + String(percentRanking[3] * 100) + "%\n"
        
        ResultCatImg_Image.image = UIImage(named: "SampleCat.png")
        
        RankTitleLabel.clipsToBounds = true
        RankTitleLabel.layer.cornerRadius = 15
        RankTitleLabel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        ResultLabel.clipsToBounds = true
        ResultLabel.layer.cornerRadius = 15
        ResultLabel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        ResultCatImg_Image.layer.borderWidth = 2
        ResultCatImg_Image.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        ResultCatImg_Image.layer.cornerRadius = 15
        ResultCatImg_Image.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        ResultCatImg_Image.clipsToBounds = true
        
        RankFrameView.layer.borderWidth = 2
        RankFrameView.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        RankFrameView.layer.cornerRadius = 15
        RankFrameView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        RankFrameView.clipsToBounds = true
        
        StoreButton.layer.cornerRadius = 15
        StoreButton.clipsToBounds = true
        StoreButton.layer.borderWidth = 2
        StoreButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        
        DetailButton.layer.cornerRadius = 15
        DetailButton.clipsToBounds = true
        DetailButton.layer.borderWidth = 2
        DetailButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
    }
    

    @IBAction func onBtnStoreResult(_ sender: UIButton) {
        
        let mainVC = storyboard?.instantiateViewController(identifier: "FirstMainVC") as! MainViewController
        
        UserDefaults.standard.setValue(MyCatRanking[0], forKey: "CatRanking1")
        UserDefaults.standard.setValue(MyCatRanking[1], forKey: "CatRanking2")
        UserDefaults.standard.setValue(MyCatRanking[2], forKey: "CatRanking3")
        UserDefaults.standard.setValue(MyCatRanking[3], forKey: "CatRanking4")
        
        UserDefaults.standard.setValue(String(format: "%.2f", percentRanking[0]), forKey: "Ranking_Percent1")
        UserDefaults.standard.setValue(String(format: "%.2f",percentRanking[1]), forKey: "Ranking_Percent2")
        UserDefaults.standard.setValue(String(format: "%.2f",percentRanking[2]), forKey: "Ranking_Percent3")
        UserDefaults.standard.setValue(String(format: "%.2f",percentRanking[3]), forKey: "Ranking_Percent4")
        
        mainVC.isnewData = true
        
        
        print("결과가 저장되었습니다.")
    }
    
    
    
    func Get_Result(_ result : Array<Float> ) -> Void {
     
        var count : Float = 0
        
        print(result)
        for row in CatResultDic {
            
            let (key,value) = row
            count = 0
            
            temp_getresultarr = value.components(separatedBy: " ")
            for i in 0...result.count - 1 {
                
                if temp_getresultarr[i] == "1" {
                    count += result[i]
                }
                else {
                    count += (4 - result[i])
                }
                
            }
            
            if count > maxresult[0] {
                maxresult[0] = count
                User_Result = key
                
                MyCatRanking[0] = key
                percentRanking[0] = count/32
            }
            else if count > maxresult[1] {
                
                maxresult[1] = count
                MyCatRanking[1] = key
                percentRanking[1] = count/32
                
            }
            else if count > maxresult[2] {
                
                maxresult[2] = count
                MyCatRanking[2] = key
                percentRanking[2] = count/32
            }
            else if count > maxresult[3] {
                
                maxresult[3] = count
                MyCatRanking[3] = key
                percentRanking[3] = count/32
            }
            
            
        }
        
    }
    
    
    
    

}
