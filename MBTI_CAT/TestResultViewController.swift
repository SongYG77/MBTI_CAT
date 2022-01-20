//
//  TestResultViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/19.
//

import UIKit

class TestResultViewController: UIViewController {

    @IBOutlet weak var ResultLabel: UILabel!
    
    
    var TestResultARR : Array<Float> = []
    var count : Int = 0
    var splitnum : Int = 0
    var SumResultArr : Array<Float> = [0,0,0,0]
    var User_Result : String = ""
    
    
    
    override func viewDidLoad() {
        
        splitnum = TestResultARR.count / 4
        
        for i in 0...TestResultARR.count - 1 {
            switch(i/splitnum) {
            case 0:
                SumResultArr[0] += TestResultARR[i]
            case 1:
                SumResultArr[1] += TestResultARR[i]
            case 2:
                SumResultArr[2] += TestResultARR[i]
            case 3:
                SumResultArr[3] += TestResultARR[i]
            default:
                print("Error")
                print(i/splitnum)
            }
            
        }
        
        for i in 0...SumResultArr.count - 1 {
            SumResultArr[i] = SumResultArr[i] / Float(splitnum)
        }
        
        print(SumResultArr)
        User_Result =  Get_Result(SumResultArr)
        
        ResultLabel.text = User_Result
        super.viewDidLoad()

    }
    

    @IBAction func onBtnStoreResult(_ sender: UIButton) {
        
        UserDefaults.standard.set(User_Result, forKey: "UserRes")
        UserDefaults.standard.set(String(SumResultArr[0]), forKey: "EI_Data")
        UserDefaults.standard.set(String(SumResultArr[1]), forKey: "NS_Data")
        UserDefaults.standard.set(String(SumResultArr[2]), forKey: "FT_Data")
        UserDefaults.standard.set(String(SumResultArr[3]), forKey: "PJ_Data")
        
        print("결과가 저장되었습니다.")
    }
    
    
    
    func Get_Result(_ result : Array<Float> ) -> String {
        
        let EI_Data = result[0]
        let NS_Data = result[1]
        let FT_Data = result[2]
        let PJ_Data = result[3]
        
        var ResultStr : String = ""
        
        if EI_Data > 0.5 {
            ResultStr += "E"
        }
        else {
            ResultStr += "I"
        }
        
        if NS_Data > 0.5 {
            ResultStr += "N"
        }
        else {
            ResultStr += "S"
        }
        
        if FT_Data > 0.5 {
            ResultStr += "F"
        }
        else {
            ResultStr += "T"
        }

        if PJ_Data > 0.5 {
            ResultStr += "P"
        }
        else {
            ResultStr += "J"
        }
        
        return ResultStr
    }

}
