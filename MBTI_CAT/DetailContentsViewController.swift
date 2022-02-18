//
//  DetailContentsViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/24.
//

// 특징 자세히 보기,
// 데이터를 어떻게 넘길지도 생각해야함
import UIKit

class DetailContentsViewController: UIViewController {
    
    
    @IBOutlet weak var CatNameTitle_Label: UILabel!
    @IBOutlet weak var CatImg_Image: UIImageView!
    @IBOutlet weak var CatShort_TV: UITextView!
    
    @IBOutlet weak var CatPersTitle_Label: UILabel!
    @IBOutlet weak var CatPersText_TV: UITextView!
    
    
    
    @IBOutlet weak var CharaticTitle_Label: UILabel!
    @IBOutlet weak var CharaticText_TV: UITextView!
    
    @IBOutlet weak var BackButton1: UIButton!
    @IBOutlet weak var BackButton2: UIButton!
    
    
    var CatKinds : String = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        CatImg_Image.image = UIImage(named: "SampleCat.png")

        
        CatNameTitle_Label.clipsToBounds = true
        CatNameTitle_Label.layer.cornerRadius = 15
        CatNameTitle_Label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        CatImg_Image.layer.borderWidth = 2
        CatImg_Image.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        CatImg_Image.layer.cornerRadius = 0
        CatImg_Image.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        CatImg_Image.clipsToBounds = true
        
        CatShort_TV.layer.borderWidth = 2
        CatShort_TV.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        CatShort_TV.layer.cornerRadius = 15
        CatShort_TV.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        CatShort_TV.clipsToBounds = true
        
        CatPersTitle_Label.clipsToBounds = true
        CatPersTitle_Label.layer.cornerRadius = 15
        CatPersTitle_Label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        CatPersText_TV.layer.borderWidth = 2
        CatPersText_TV.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        CatPersText_TV.layer.cornerRadius = 15
        CatPersText_TV.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        CatPersText_TV.clipsToBounds = true
        
        CharaticTitle_Label.clipsToBounds = true
        CharaticTitle_Label.layer.cornerRadius = 15
        CharaticTitle_Label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        CharaticText_TV.layer.borderWidth = 2
        CharaticText_TV.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        CharaticText_TV.layer.cornerRadius = 15
        CharaticText_TV.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        CharaticText_TV.clipsToBounds = true
        
        BackButton2.layer.borderWidth = 2
        BackButton2.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        BackButton2.layer.cornerRadius = 10
        BackButton2.clipsToBounds = true
        
        BackButton1.layer.borderWidth = 2
        BackButton1.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        BackButton1.layer.cornerRadius = 15
        BackButton1.clipsToBounds = true
        
        print(CatKinds)
    }
    

    
   
   
    
    @IBAction func onBtnGoBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
