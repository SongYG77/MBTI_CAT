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
    
    
    let testTextA : Array<String> = [
        "A. 테스트1"
    ]
    let testTextB : Array<String> = [
        "B. 테스트1"
    ]
    
    var countresult : Int = 0
    var flagResult : Array<Int> = [-1,-1]
    var selectresultValue : Float = -1
    var progresstestcount = 0
    
    
    override func viewDidLoad() {
        
        
        Test1A_TV.text = testTextA[progresstestcount]
        Test1B_TV.text = testTextB[progresstestcount]
        ProgressTestLabel.text = String(progresstestcount + 1) + "/36"
        
        super.viewDidLoad()
    }
    

    
    
    @IBAction func onBtnNext(_ sender: UIButton) {
        
        countresult = 9
        
        guard selectresultValue != -1 else {
            print("다 입력되지 않음.")
            return
        }
        
        for i in flagResult{
            countresult -= i
        }
        print(countresult)
        
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


