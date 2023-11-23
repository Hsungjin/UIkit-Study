//
//  ViewController.swift
//  TodoList-CoreData
//
//  Created by 황성진 on 11/23/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // CoreData의 저장소에서 레코드를 가져오거나 생성, 업데이트 삭제(CRUD)의 역할을 하는 viewContext를 사용하기 위한 선언
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var models = [ToDoListitem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ToDo List With CoreData"
        view.addSubview(tableView)
        getAllItems()
        tableView.delegate = self
        tableView.dataSource = self
        // 전체화면으로 설정
        tableView.frame = view.bounds
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Item", message: "Enter new item", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Sumbit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            self?.createItem(name: text)
        }))
        
        present(alert, animated: true)
    }
    
    // tableView 의 행의 개수를 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    // row에 데이터를 출력하기 위한 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "할일 : \(model.name!) \n\(model.createdAt!)"
        return cell
    }
    
    // 해당 row 가 선택됐을때 실행되는 함수
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = models[indexPath.row]
        
        // Edit 버튼을 Alert 방식으로
        let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
        
        // 해당 Alert에는 Cancle, Edit, Delete 가 존재
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            
            let alert = UIAlertController(title: "Edit Item", message: "Edit your item", preferredStyle: .alert)
            
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = item.name
            alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: { [weak self] _ in
                guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else {
                    return
                }
                self?.updateItem(item: item, newName: newName)
            }))
            
            self.present(alert, animated: true)
            
        }))
        
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self]_ in
            self?.deleteItem(item: item)
        }))
        
        present(sheet, animated: true)
    }
    
    
    // CoreData
    // 저장된 모든값을 가져오는 함수
    func getAllItems() {
        do {
            models = try context.fetch(ToDoListitem.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print(error)
        }
    
    }

    // todolist 를 추가하는 함수
    func createItem(name: String) {
        let newItem = ToDoListitem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print(error)
        }
    }
    
    // 추가된 list를 삭제하는 함수
    func deleteItem(item: ToDoListitem) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print(error)
        }
    }
    
    // list를 변경해 최신화 해주는 함수
    func updateItem(item: ToDoListitem, newName: String) {
        item.name = newName
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print(error)
        }
    }

}

