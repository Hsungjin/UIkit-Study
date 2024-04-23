//
//  ViewController.swift
//  Magic_8_Ball
//
//  Created by 황성진 on 4/23/24.
//

import UIKit

class ViewController: UIViewController {

    let ballArray = ["ball1.png", "ball2.png", "ball3.png", "ball4.png", "ball5.png"]


    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func askButtonPressed(_ sender: UIButton) {
        imageView.image = UIImage(named: ballArray.randomElement()!)
    }
    
}

