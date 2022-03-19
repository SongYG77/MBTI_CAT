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
    
    @IBAction func onBtnNorwegianforest(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Norwegian forest"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    
    
    @IBAction func onBtnMaineCoon(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Maine Coon"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnBombay(_ sender: UIButton) {
        
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Bombay"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnEgyptianMau(_ sender: UIButton) {
        
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Egyptian Mau"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnCymric(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Cymric"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnAmericanCurl(_ sender: UIButton) {
        
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "American Curl"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnAbyssinian(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Abyssinian"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnBengal(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Bengal"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnRagdoll(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Ragdoll"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnExotic(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Exotic"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    
    @IBAction func onBtnAmericanShort(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "American Short"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    
    @IBAction func onBtnPersian(_ sender: UIButton) {
        
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Persian"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnBurmilla(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Burmilla"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnBritishShort(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "British Short"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnHimalayan(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Himalayan"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnScottishFold(_ sender: UIButton) {
        
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Scottish Fold"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnSiamese(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Siamese"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnTurkishangora(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Turkish angora"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnCornishRex(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Cornish Rex"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnJapaneseBobtail(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Japanese Bobtail"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnJavanese(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Javanese"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
        
    }
    
    @IBAction func onBtnBurmese(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Burmese"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
   
    @IBAction func onBtnChantilly(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Chantilly"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnBirman(_ sender: UIButton) {
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
        
        NextVC.CatKinds = "Birman"
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
}
