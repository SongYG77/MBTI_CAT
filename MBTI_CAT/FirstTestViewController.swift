//
//  FirstTestViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/17.
//

import UIKit


class FirstTestViewController: UIViewController {
    
    @IBOutlet weak var Test1TV: UITextView!
    @IBOutlet weak var Result1SC: UISegmentedControl!
    @IBOutlet weak var Result2SC: UISegmentedControl!
    
    let testText : Array<String> = [
        "A. 테스트1"
    ]
    
    var countresult : Int = 0
    var flagResult : Array<Int> = [0,0]
    
    override func viewDidLoad() {
        
        
        Test1TV.text = testText[0]
        
        super.viewDidLoad()
    }
    

    
    
    @IBAction func onBtnNext(_ sender: UIButton) {
        
        for i in 0...1{
            if flagResult[i] == 0 {
                print("다 체크")
            }
            
        }
        
        print(countresult)
    }
    
    @IBAction func onSCResult1(_ sender: UISegmentedControl) {
        if flagResult[0] == 0 {
            if sender.selectedSegmentIndex == 0 {
                countresult += 1
                flagResult[0] = 1
                
            }
            else {
                flagResult[0] = 1
            }
            
        }
        else {
            if sender.selectedSegmentIndex == 0 {
                countresult += 1
            }
            else {
                countresult -= 1
            }
            
        }
        
    }
    
    
    @IBAction func onSCResult2(_ sender: UISegmentedControl) {
        
        if flagResult[1] == 0 {
            if sender.selectedSegmentIndex == 0 {
                countresult += 1
                flagResult[1] = 1
                
            }
            else {
                flagResult[1] = 1
            }
            
        }
        else {
            if sender.selectedSegmentIndex == 0 {
                countresult += 1
            }
            else {
                countresult -= 1
            }
            
        }
    }
    
    
    
}
