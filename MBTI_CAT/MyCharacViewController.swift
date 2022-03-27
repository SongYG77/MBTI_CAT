//
//  MyPageViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/13.
//
//  마이페이지
//
//  할일



import UIKit
import Firebase
import FirebaseFirestore
import NVActivityIndicatorView

class MyCharacController: UIViewController {

    @IBOutlet weak var MyInfoView: UIView!
    
    @IBOutlet weak var MyCatImg: UIImageView!
    @IBOutlet weak var MyCat_Label: UILabel!
    @IBOutlet weak var CatChar_Label: UILabel!
    @IBOutlet weak var Persent_Label: UILabel!
    
    @IBOutlet weak var MyResultButton: UIButton!
    @IBOutlet weak var FiveCharButton: UIButton!
    @IBOutlet weak var ResetButton: UIButton!
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    lazy var loadingBgView: UIView = {
            let bgView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        bgView.backgroundColor = UIColor.black
        bgView.alpha = 0.5

        return bgView
    }()
    
    
    
    lazy var activityIndicator: NVActivityIndicatorView = {
            // ✅ activity indicator 설정
            let activityIndicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40),
                                                            type: .ballBeat,
                                                            color: .brown,
                                                            padding: .zero)
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false

            return activityIndicator
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        MyInfoView.layer.cornerRadius = 15
        MyInfoView.clipsToBounds = true
        MyInfoView.layer.borderWidth = 2
        MyInfoView.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        
        
        MyResultButton.layer.cornerRadius = 15
        MyResultButton.clipsToBounds = true
        MyResultButton.layer.borderWidth = 2
        MyResultButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        
        FiveCharButton.layer.cornerRadius = 15
        FiveCharButton.clipsToBounds = true
        FiveCharButton.layer.borderWidth = 2
        FiveCharButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        
        ResetButton.layer.cornerRadius = 15
        ResetButton.clipsToBounds = true
        ResetButton.layer.borderWidth = 2
        ResetButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        
        MyCatImg.layer.cornerRadius = 10
        MyCatImg.layer.borderWidth = 2
        MyCatImg.layer.borderColor = UIColor.lightGray.cgColor
        MyCatImg.clipsToBounds = true
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.value(forKey: "CatRanking1") != nil {
            let UserInfo : String? = (UserDefaults.standard.value(forKey: "CatRanking1") as! String)
            MyCatImg.image = UIImage(named: UserInfo ?? "SampleCat" + ".png")
            MyCat_Label.text = UserDefaults.standard.value(forKey: "CatRanking1") as? String
            
            let myper = (Float(UserDefaults.standard.value(forKey: "Ranking_Percent1") as? String ?? "0") ?? 0) * 100.0
            Persent_Label.text = "닮은 정도 : " + String(myper) + "%"
            CatChar_Label.text = (UserDefaults.standard.value(forKey: "Nickname") as! String)
            
            
        }
        else {
            MyCatImg.image = nil
            MyCat_Label.text = "결과가 없습니다."
            Persent_Label.text = ""
            CatChar_Label.text = ""
        }
    }

    @IBAction func onBtnResult(_ sender: UIButton) {
        
        if UserDefaults.standard.value(forKey: "CatRanking1") != nil {
            let UserInfo : String? = (UserDefaults.standard.value(forKey: "CatRanking1") as! String)
            
            let NextVC = self.storyboard?.instantiateViewController(identifier: "DetailContentsVC") as! DetailContentsViewController
            
            NextVC.CatKinds = UserInfo!
            
            self.navigationController?.pushViewController(NextVC, animated: true)
            
        }
        else {
            let alert = UIAlertController(title: "알림", message: "결과가 없습니다!", preferredStyle: .alert)
            let resultOK = UIAlertAction(title: "확인" , style: .default, handler: nil)

            alert.addAction(resultOK)
            present(alert, animated: true)
            
        }
       
        
    }
    
    @IBAction func onBtnFiveChar(_ sender: UIButton) {
        let alert = UIAlertController(title: "알림", message: "준비중입니다.", preferredStyle: .alert)
        let resultOK = UIAlertAction(title: "확인" , style: .default, handler: nil)

        alert.addAction(resultOK)
        present(alert, animated: true)
    }
    
    
    
    @IBAction func onBtnReset(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "주의!", message: "사용자 정보가 초기화됩니다.", preferredStyle: .alert)
                let resetAltyes = UIAlertAction(title: "네", style: .destructive){
                    (_) in

                    UserDefaults.standard.removeObject(forKey: "CatRanking1")
                    UserDefaults.standard.removeObject(forKey: "CatRanking2")
                    UserDefaults.standard.removeObject(forKey: "CatRanking3")
                    UserDefaults.standard.removeObject(forKey: "CatRanking4")
                    UserDefaults.standard.removeObject(forKey: "Ranking_Percent1")
                    UserDefaults.standard.removeObject(forKey: "Ranking_Percent2")
                    UserDefaults.standard.removeObject(forKey: "Ranking_Percent3")
                    UserDefaults.standard.removeObject(forKey: "Ranking_Percent4")

                }
                let resetAltno = UIAlertAction(title: "아니오" , style: .cancel, handler: nil)

                alert.addAction(resetAltyes)
                alert.addAction(resetAltno)

                present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func onBtnDevInfo(_ sender: UIButton) {
        
        let NextVC = self.storyboard?.instantiateViewController(identifier: "DevInfoVC") as! DevInfoViewController
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @IBAction func onBtnSuggestions(_ sender: UIButton) {
        
        let NextVC = self.storyboard?.instantiateViewController(identifier: "SuggestionsVC") as! SuggestionsViewController
        
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    
    @IBAction func onBtnNotice(_ sender: UIButton) {
        
        
        
        let NextVC = self.storyboard?.instantiateViewController(identifier: "NoticeVC") as! NoticeViewController
        
        let db = Firestore.firestore()
        
        
        var NoticeAll : [[String]] = []
//        var NoticeTitleArr : [String] = []
//        var NoticeDateArr : [String] = []
//        var NoticeContentArr : [String] = []
        var tempArr : [String] = []
        
        
        self.setActivityIndicator()
       
        db.collection("Notice").whereField("Id", isEqualTo: "Notice").getDocuments() {
            //후행 클로저
            (querySnapshot, error) in
            
            if error != nil {
                print("에러 \(error!.localizedDescription)")
                let alert = UIAlertController(title: "경고", message: "오류! 관리자에게 문의하세요.\n songyg77dev@gmail.com ", preferredStyle: .alert)
                let resultOK = UIAlertAction(title: "확인" , style: .default, handler: nil)
                
                alert.addAction(resultOK)
                self.present(alert, animated: true)
                
            }
            else {
                
                for documents in querySnapshot!.documents {
                    
                    
                    let dataDic = documents.data() as NSDictionary
                    let title = dataDic["Title"] as? String ?? ""
                    let date = dataDic["Date"] as? String ?? ""
                    let content = dataDic["Contents"] as? String ?? ""
                    
                    
//                    NoticeTitleArr.append(title)
//                    NoticeDateArr.append(date)
//                    NoticeContentArr.append(content)
                    
                    tempArr = []
                    tempArr.append(date)
                    tempArr.append(title)
                    tempArr.append(content)
                    
                    NoticeAll.append(tempArr)
                    
                }
                
                
            }
            
            print("get data end")
            
//            NextVC.NoticeTitleArr = NoticeTitleArr
//            NextVC.NoticeDateArr = NoticeDateArr
//            NextVC.NoticeContentArr = NoticeContentArr
            
            
            let NoticeAllSort = NoticeAll.sorted(by: { $0[0] > $1[0] })
            print(NoticeAllSort)
            
            NextVC.NoticeAll = NoticeAllSort
            self.activityIndicator.stopAnimating()
            self.loadingBgView.removeFromSuperview()
            
            self.navigationController?.pushViewController(NextVC, animated: true)
        }
        
        
        
        
    }
    
    private func setActivityIndicator() {
            // 불투명 뷰 추가
            view.addSubview(loadingBgView)
            // activity indicator 추가
            loadingBgView.addSubview(activityIndicator)

            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])

            // 애니메이션 시작
            activityIndicator.startAnimating()
    }
    
    
}
