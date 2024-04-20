//
//  ViewController.swift
//  Dicee
//
//  Created by 황성진 on 4/20/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstDice.image = UIImage(named: "DiceOne")
        secondDice.image = UIImage(named: "DiceOne")
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        let arr = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
        
        firstDice.image = UIImage(named: arr.randomElement()!)
        secondDice.image = UIImage(named: arr.randomElement()!)
    }
    
}

