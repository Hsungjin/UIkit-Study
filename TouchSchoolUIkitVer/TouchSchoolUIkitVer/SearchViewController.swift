//
//  SearchViewController.swift
//  TouchSchoolUIkitVer
//
//  Created by 황성진 on 12/4/23.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.searchTextField.textColor = UIColor.white
        searchBar.searchTextField.font = UIFont(name: "Giants-Bold", size: 17.0)
//        searchBar.barTintColor = UIColor.clear
        searchBar.searchTextField.backgroundColor =  UIColor.gray.withAlphaComponent(0.5)
//        searchBar.searchTextField.alpha = 0.5
    }

}
