//
//  Suggestions  Suggestions  Suggestions  SuggestionsViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/02/08.
//

import UIKit
import Firebase
import FirebaseFirestore

class SuggestionsViewController: UIViewController {
    
    
    
    struct Suggestiondata {
        var Email : String = ""
        var Content : String = ""
        
        //firebase에서 db에 들어가는 데이터
        //클래스와 구조체가 들어갈 수 없다.
        //1. 넘버 타입을 바로 넣을수 있다
        //2. 스트링 타입을 바로 넣을수 있다.
        //3. Array
        //4. Dictionary
        //즉 구조체가 바로 들어가려면 dictionary 타입으로 바꿔줘야 함.
        
        func getDic() -> [String : String] {
            let dict = [
                "Email" : self.Email,
                "Content" : self.Content
            ]
            
            return dict
        }
    }
    
    
    
    @IBOutlet weak var EmailTitleLabel: UILabel!
    @IBOutlet weak var ContentTitleLabel: UILabel!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var ContentsTextField: UITextField!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var AcceptButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        BackButton.layer.borderWidth = 2
        BackButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        BackButton.layer.cornerRadius = 10
        BackButton.clipsToBounds = true
        
        AcceptButton.layer.cornerRadius = 15
        AcceptButton.clipsToBounds = true
        AcceptButton.layer.borderWidth = 2
        AcceptButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        
        EmailTitleLabel.clipsToBounds = true
        EmailTitleLabel.layer.cornerRadius = 15
        EmailTitleLabel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        ContentTitleLabel.clipsToBounds = true
        ContentTitleLabel.layer.cornerRadius = 15
        ContentTitleLabel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        EmailTextField.layer.borderWidth = 2
        EmailTextField.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        EmailTextField.layer.cornerRadius = 15
        EmailTextField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        EmailTextField.clipsToBounds = true
        
        ContentsTextField.layer.borderWidth = 2
        ContentsTextField.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        ContentsTextField.layer.cornerRadius = 15
        ContentsTextField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        ContentsTextField.clipsToBounds = true

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: EmailTextField.frame.height))
        EmailTextField.leftView = paddingView
        EmailTextField.leftViewMode = .always
        EmailTextField.rightView = paddingView
        EmailTextField.rightViewMode = .always
        
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: ContentsTextField.frame.height))
        ContentsTextField.leftView = paddingView2
        ContentsTextField.leftViewMode = .always
        ContentsTextField.rightView = paddingView2
        ContentsTextField.rightViewMode = .always
        ContentsTextField.contentVerticalAlignment = .top
        
    }
    
    @IBAction func onBtnAdd(_ sender: Any) {
        
        addSuggetion()
        
        
        
    }
    
    @IBAction func onBtnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func addSuggetion() {
        if let isEmail = EmailTextField.text, let isContent = ContentsTextField.text {
            
            var data = Suggestiondata()
            data.Email = isEmail
            data.Content = isContent
            //DB에 접근하려면 딕셔너리로 변환을 시켜줘야 한다,
            guard isEmail != "" || isContent != "" else {
                
                let alert = UIAlertController(title: "경고", message: "빈칸을 모두 채워주세요.", preferredStyle: .alert)
                let resultOK = UIAlertAction(title: "확인" , style: .default, handler: nil)

                alert.addAction(resultOK)
                present(alert, animated: true)
                return
            }
            let datadic = data.getDic()
            
            let db = Firestore.firestore()
            
            var ref : DocumentReference? = nil
            
            ref = db.collection("Suggestions").addDocument(data: datadic) {
                error in
                if error != nil {
                    print("error \(error!.localizedDescription)")
                    
                    let alert = UIAlertController(title: "경고", message: "오류! 관리자에게 문의하세요.\n songyg77dev@gmail.com ", preferredStyle: .alert)
                    let resultOK = UIAlertAction(title: "확인" , style: .default, handler: nil)

                    alert.addAction(resultOK)
                    self.present(alert, animated: true)
                }
                else {
                    print("도큐먼트 쓰기 성공")
                    print("도큐먼트 아이디 : \(ref!.documentID)")
                    
                    let alert = UIAlertController(title: "알림", message: "완료되었습니다.", preferredStyle: .alert)
                    let resultOK = UIAlertAction(title: "확인" , style: .default) {
                        (_) in
                        self.navigationController?.popViewController(animated: true)
                    }

                    alert.addAction(resultOK)
                    self.present(alert, animated: true)
                    
                    
                }
            }
        
        }
        
        else {
            
            let alert = UIAlertController(title: "경고", message: "빈칸을 모두 채워주세요.", preferredStyle: .alert)
            let resultOK = UIAlertAction(title: "확인" , style: .default, handler: nil)

            alert.addAction(resultOK)
            present(alert, animated: true)
            
        }
    }
    
    

}




