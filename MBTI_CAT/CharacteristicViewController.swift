//
//  CharacteristicViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/13.
//
// 데이터 추가할 예정 자료조사는 이후에.
//  특징 뷰

import UIKit

class CharacteristicViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    

    
    //MARK: - 버튼들
    @IBAction func onBtnBelinese(_ sender: UIButton) {
        
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Belinese"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
        
    }
    

}
