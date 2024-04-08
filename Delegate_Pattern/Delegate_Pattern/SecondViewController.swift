//
//  SecondViewController.swift
//  Delegate_Pattern
//
//  Created by 황성진 on 3/25/24.
//

import UIKit
import SnapKit

protocol ChangeUIDelegate {
    func changeUI()
}

class SecondViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Frist View"
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    lazy var viewcontent: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    lazy var viewButton: UIButton = {
        let button = UIButton()
        button.tintColor = .systemTeal
        button.setImage(UIImage(systemName: "star"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setView()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension SecondViewController {
    func setView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.viewcontent)
        self.view.addSubview(self.viewButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(50)
            make.left.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        viewcontent.snp.makeConstraints { make in
            
        }
        
        viewButton.snp.makeConstraints { make in
            
        }
    }
}
