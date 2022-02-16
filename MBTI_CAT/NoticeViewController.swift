//
//  NoticeViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/02/10.
//

// 해야할 일
// 파이어베이스에서 데이터를 가져와 테이블에 보여주기
// 라이프사이클 문제 : 현재 데이터를 불러오기전에 셀 개수를 정함.


import UIKit
import Firebase
import FirebaseFirestore

class NoticeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    

    
    @IBOutlet weak var NoticeTableView: UITableView!
    @IBOutlet weak var BackButton: UIButton!
    
    var titles : [String] = [ "테스트1", "테스트2" ]
    var date : Array<String> = [ "2022-02-02", "2022-02-03"]
    
    struct NoticeStruct {
        var Title : String = ""
        var Date : String = ""
        var Content : String = ""
    }
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var NoticeArr : [NoticeStruct] = []
    
    let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        NoticeTableView.delegate = self
        NoticeTableView.dataSource = self
        
        BackButton.layer.borderWidth = 2
        BackButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        BackButton.layer.cornerRadius = 10
        BackButton.clipsToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(NoticeArr.count)
        return NoticeArr.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.NoticeTableView.dequeueReusableCell(withIdentifier: "ANoticeTableViewCell", for: indexPath) as! ANoticeTableViewCell
        
        cell.NoticeTitleLabel.text = NoticeArr[indexPath.row].Title
        cell.DateLabel.text = NoticeArr[indexPath.row].Date
        cell.selectionStyle = .none
        return cell
    }
    
    
    // 셀 높이.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    
    //데이터 가져오기
    func getData() {
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
                    print("\(documents.documentID) => \(documents.data())")
                    
                    let dataDic = documents.data() as NSDictionary
                    let title = dataDic["Title"] as? String ?? ""
                    let date = dataDic["Date"] as? String ?? ""
                    let content = dataDic["Contents"] as? String ?? ""
                        
                    var data = NoticeStruct()
                    data.Title = title
                    data.Date = date
                    data.Content = content
                        
                    self.NoticeArr.append(data)
                }
                    
                
            }
            
            print("get data end")
           
        }
        NoticeTableView.reloadData()
        
    }
    
    
    
    
    @IBAction func onBtnBack(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
  

}
