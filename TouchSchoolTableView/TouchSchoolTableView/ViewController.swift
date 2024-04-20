//
//  ViewController.swift
//  TouchSchoolTableView
//
//  Created by 황성진 on 12/14/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFirstCell", for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "아산고등학교"
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "아산중학교"
        } else if indexPath.row == 2 {
            cell.textLabel?.text = "권곡초등학교"
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("0 입니다.")
        } else {
            print(indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
