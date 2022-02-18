//
//  NoticeDetailViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/02/17.
//


//해야할일

//디자인, 오토레이아웃.

import UIKit

class NoticeDetailViewController: UIViewController {

    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var ContentTextView: UITextView!
    @IBOutlet weak var BackButton: UIButton!
    
    var content : String = ""
    var noticetitle : String = ""
    var date : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BackButton.layer.borderWidth = 2
        BackButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        BackButton.layer.cornerRadius = 10
        BackButton.clipsToBounds = true
        
        
        
        
        ContentTextView.layer.borderWidth = 2
        ContentTextView.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        ContentTextView.layer.cornerRadius = 15
        ContentTextView.clipsToBounds = true
        
        DateLabel.layer.borderWidth = 2
        DateLabel.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        DateLabel.layer.cornerRadius = 10
        DateLabel.clipsToBounds = true
        
        
        TitleLabel.text = noticetitle
        DateLabel.text = date
        
        let contenttext = content.replacingOccurrences(of: "\\n", with: "\n")
        ContentTextView.text = contenttext
        
    }
    

    @IBAction func onBtnBack(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
