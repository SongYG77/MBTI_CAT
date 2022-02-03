//
//  FirstTestViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/17.
//

import UIKit
import DLRadioButton

class FirstTestViewController: UIViewController {
    
    @IBOutlet weak var TestText_View: UIView!
    
    @IBOutlet weak var AButton: DLRadioButton!
    
    @IBOutlet weak var weakAButton: DLRadioButton!
    
    @IBOutlet weak var MiddleButton: DLRadioButton!
    @IBOutlet weak var weakBButton: DLRadioButton!
    @IBOutlet weak var BButton: DLRadioButton!
    @IBOutlet weak var ProgressTestLabel: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var TestText_TV: UITextView!
    @IBOutlet weak var TestProgress: UIProgressView!
    @IBOutlet weak var TestTextCountLabel: UILabel!
    //@IBOutlet weak var NextButton: UIButton!
    
    
    let testText : Array<String> = [
        "\n\n 나는 평소에 여기저기 돌아다니는 것을 좋아한다.",
        "\n\n 여행, 산책, 운동을 즐겨하는 편이다.",
        "\n\n 나는 처음 보는 사람과 쉽게 친해지는 편이다.",
        "\n\n 나는 다른 사람에게 정을 많이 준다.",
        "\n\n 나는 새로운 환경에 쉽게 적응하고 편해진다.",
        "\n\n 처음 접하는 것에 대해 거부감이 없다.",
        "\n\n 나는 혼자 놀아도 재미있게 놀 수 있다.",
        "\n\n 나는 주변에서 머리가 좋다는 말을 종종 듣는다.",
        "\n\n 나는 규칙적인 식단, 운동 등 자기관리가 철저하다.",
        "\n\n 나는 주변에서 말이 많다는 말을 자주 듣는다.",
        "\n\n 나는 다양한 것에 궁금증을 종종 느낀다.",
        "\n\n 나는 종종 다른사람들에게 장난을 친다.",
    ]
    
    
    var countresult : Int = 0
    var flagResult : Array<Float> = []
    
    var selectresultValue : Float = -1
    
    var progresstestcount = 0
    
    var all_test_count : Int = 0
    
    
    override func viewDidLoad() {
        
        countresult = 0
        selectresultValue = -1
        progresstestcount = 0
        
        all_test_count = testText.count
        
        TestProgress.transform = TestProgress.transform.scaledBy(x: 1, y: 3)
        
        TestText_View.layer.borderWidth = 2
        TestText_View.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        TestText_View.layer.cornerRadius = 15
        TestText_View.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        TestText_View.clipsToBounds = true
        
        
        TestTextCountLabel.clipsToBounds = true
        TestTextCountLabel.layer.cornerRadius = 15
        TestTextCountLabel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        // 위쪽 둥근 값
        // 하단은 minxmax maxxmax
        super.viewDidLoad()
        
        NextButton.layer.borderWidth = 2
        NextButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        NextButton.layer.cornerRadius = 10
        NextButton.clipsToBounds = true
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        TestProgress.setProgress(Float(progresstestcount + 1) / 12, animated: true)  
        TestTextCountLabel.text = String(progresstestcount + 1) + "번"
        
        if progresstestcount + 1 == all_test_count {
            // print("프로그래스" ,progresstestcount)
            self.NextButton.setTitle("결과 확인", for: .normal)
        }
        AButton.isSelected = false
        BButton.isSelected = false
        weakAButton.isSelected = false
        weakBButton.isSelected = false
        MiddleButton.isSelected = false
        
        
        TestText_TV.text = testText[progresstestcount]
        
        
        ProgressTestLabel.text = String(progresstestcount + 1) + "/" + String(all_test_count)
        
    }

    
    
    @IBAction func onBtnNext(_ sender: UIButton) {
        
        
        
        guard selectresultValue != -1 else {
            print("다 입력되지 않음.")
            return
        }
        
        print(selectresultValue)
        
        flagResult.append( selectresultValue )
        
        
        
        selectresultValue = -1
        progresstestcount += 1
        
        if progresstestcount == all_test_count {
            
            let ResultVC = self.storyboard?.instantiateViewController(identifier: "TestResultVC") as! TestResultViewController
            
            ResultVC.TestResultARR = flagResult
            
            self.navigationController?.pushViewController(ResultVC, animated: true)
            
            
            
        }
        else {
            
            viewWillAppear(true)
            
        }
        
    }
    
    @IBAction func onBtnA(_ sender: DLRadioButton) {
        print("A")
        selectresultValue = 4
        
    }
    
   
    
    @IBAction func onBtnWeakA(_ sender: DLRadioButton) {
        
        print("weakA")
        selectresultValue = 3
    }
    
    @IBAction func onBtnM(_ sender: DLRadioButton) {
        
        print("Middle")
        selectresultValue = 2
        
    }
    
    @IBAction func onBtnWeakB(_ sender: DLRadioButton) {
        
        print("weakB")
        selectresultValue = 1
    }
    
    
    @IBAction func onBtnB(_ sender: DLRadioButton) {
        
        print("B")
        selectresultValue = 0
        
    }
    
    
   
    
    
    
}



