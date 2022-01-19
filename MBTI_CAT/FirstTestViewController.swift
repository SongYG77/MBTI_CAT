//
//  FirstTestViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/17.
//

import UIKit
import DLRadioButton

class FirstTestViewController: UIViewController {
    
    @IBOutlet weak var Test1A_TV: UILabel!
    @IBOutlet weak var Test1B_TV: UILabel!
    
    @IBOutlet weak var AButton: DLRadioButton!
    
    @IBOutlet weak var weakAButton: DLRadioButton!
    
    @IBOutlet weak var weakBButton: DLRadioButton!
    @IBOutlet weak var BButton: DLRadioButton!
    @IBOutlet weak var ProgressTestLabel: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    
    
    let testTextA : Array<String> = [
        "A. E",
        "A. E",
        "A. E",
        "A. E",
        "A. N",
        "A. N",
        "A. N",
        "A. N",
        "A. F",
        "A. F",
        "A. F",
        "A. F",
        "A. P",
        "A. P",
        "A. P",
        "A. P"
    ]
    let testTextB : Array<String> = [
        "B. I",
        "B. I",
        "B. I",
        "B. I",
        "B. S",
        "B. S",
        "B. S",
        "B. S",
        "B. T",
        "B. T",
        "B. T",
        "B. T",
        "B. J",
        "B. J",
        "B. J",
        "B. J",
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
        
        all_test_count = testTextA.count
        
       
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       
        
        if progresstestcount + 1 == all_test_count {
            // print("프로그래스" ,progresstestcount)
            self.NextButton.setTitle("결과 확인", for: .normal)
        }
        AButton.isSelected = false
        BButton.isSelected = false
        weakAButton.isSelected = false
        weakBButton.isSelected = false
        
        
        Test1A_TV.text = testTextA[progresstestcount]
        Test1B_TV.text = testTextB[progresstestcount]
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
        selectresultValue = 1
        
    }
    
   
    
    @IBAction func onBtnWeakA(_ sender: DLRadioButton) {
        
        print("weakA")
        selectresultValue = 0.7
    }
    
    @IBAction func onBtnWeakB(_ sender: DLRadioButton) {
        
        print("weakB")
        selectresultValue = 0.3
    }
    
    
    @IBAction func onBtnB(_ sender: DLRadioButton) {
        
        print("B")
        selectresultValue = 0
        
    }
    
    
    
    
    
}


// 이후 작업할 일
// 진행도가 9개씩 끊길 예정, 그래서 그 9개 마다 EI 판별인지 SN 판별인지 등등.
// 그래서 최종 완료 누를때 결과가 연산되게 할 예정, 그래고 그 결과를 저장할지 말지에 대해서 역시 만들 예정.

// 그럴려면 next와 prev 누를 때 어떤 함수가 들어갈지.
// 그리고 눌렀을 때 이전 결과값을 불러오고, 화면 새로 고침에 대해서도 구현.

// dl radio에서 셀렉트를 다 풀 수 있나 확인도 해봐야함.(안되면 그냥.. 이어나갈 예정.


