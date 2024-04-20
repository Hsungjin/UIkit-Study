//
//  RankViewController.swift
//  TouchSchoolUIkitVer
//
//  Created by 황성진 on 12/5/23.
//

import UIKit

class RankViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var myScrollView: UIScrollView!
    
    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.layer.opacity = 0.3
        myView.cornerRadius = 10
        
        myScrollView.delegate = self
        
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 30))
        label.text = "1. 아산고등학교"
        view2.addSubview(label)
        
        // ContentView의 크기를 설정하여 스크롤 가능한 영역을 정의
        view2.frame.size = CGSize(width: view.frame.width, height: 500)
        myScrollView.contentSize = view2.frame.size
    }
    
    // UIScrollViewDelegate 메서드 구현 (옵션)
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 스크롤이 발생할 때 호출되는 메서드
    }
    
}
