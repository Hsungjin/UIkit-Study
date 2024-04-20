//
//  ViewController.swift
//  NotificationCenter_Example
//
//  Created by 황성진 on 4/9/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var writeField: UITextField!
    @IBOutlet weak var showField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 노티피케이션 발송
    func notificate(writeText: String) {
        NotificationCenter.default.post(name: Notification.Name("writeText"), object: nil, userInfo: ["myWriting": writeText])
    }
    
    @objc func receiveNoti(notification: Notification) {
        guard let writeText = notification.userInfo?["myWriting"] as? String else { return }
        showField.text = writeText
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        // Notification Name 설정
        NotificationCenter.default.addObserver(self, selector: #selector(receiveNoti), name: Notification.Name("writeText"), object: nil)
        guard let writeText = writeField.text else { return }
        notificate(writeText: writeText)
        NotificationCenter.default.removeObserver(self)
    }
    
}

