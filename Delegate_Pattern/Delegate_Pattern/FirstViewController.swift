//
//  FirstViewController.swift
//  Delegate_Pattern
//
//  Created by 황성진 on 3/25/24.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
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

extension FirstViewController: ChangeUIDelegate {
    func changeUI() {
        self.viewcontent.text = "UI가 변경되었습니다"
        self.view.backgroundColor = .systemTeal
    }
}
