//
//  DevInfoViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/02/07.
//

import UIKit

class DevInfoViewController: UIViewController {

    @IBOutlet weak var MadeByLabel: UILabel!
    @IBOutlet weak var InfoView: UIView!
    @IBOutlet weak var BackButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MadeByLabel.clipsToBounds = true
        MadeByLabel.layer.cornerRadius = 15
        MadeByLabel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        BackButton.layer.borderWidth = 2
        BackButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        BackButton.layer.cornerRadius = 10
        BackButton.clipsToBounds = true
        
        InfoView.layer.borderWidth = 2
        InfoView.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        InfoView.layer.cornerRadius = 15
        InfoView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        InfoView.clipsToBounds = true
        
        print("Test")
    }
    

    @IBAction func onBtnBack(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
