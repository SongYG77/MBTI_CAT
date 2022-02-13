//
//  NoticeViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/02/10.
//

// 해야할 일
// 파이어베이스에서 데이터를 가져와 테이블에 보여주기
// 오토 레이아웃 잡기


import UIKit
import Firebase
import FirebaseFirestore

class NoticeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    

    
    @IBOutlet weak var NoticeTableView: UITableView!
    @IBOutlet weak var BackButton: UIButton!
    
    var titles : [String] = [ "테스트1", "테스트2" ]
    var date : Array<String> = [ "2022-02-02", "2022-02-03"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NoticeTableView.delegate = self
        NoticeTableView.dataSource = self
        
        BackButton.layer.borderWidth = 2
        BackButton.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        BackButton.layer.cornerRadius = 10
        BackButton.clipsToBounds = true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.NoticeTableView.dequeueReusableCell(withIdentifier: "ANoticeTableViewCell", for: indexPath) as! ANoticeTableViewCell
        
        cell.NoticeTitleLabel.text = titles[indexPath.row]
        cell.DateLabel.text = date[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    
    @IBAction func onBtnBack(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
  

}
