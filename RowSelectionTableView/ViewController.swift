//
//  ViewController.swift
//  RowSelectionTableView
//
//  Created by YoNa on 2021/05/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var todoTableView: UITableView!
    
    //    let todos = ["walk" , "wash" , "buy car" , "homework"]
    var todos = [Todo(title: "Walk", isMarked: false),
                 Todo(title: "homework", isMarked: true),
                 Todo(title: "Buy", isMarked: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoTableView.dataSource = self
        todoTableView.delegate = self
        // 区切り線なし
        todoTableView.separatorStyle = .none
    }
    
    
}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        
        let todo = todos[indexPath.row]
        
        cell.taskLabel.text = todo.title
        cell.checkmarkImageView.image = todo.isMarked == true ? UIImage(named: "checkedicon") : UIImage(named: "checkicon")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? TodoTableViewCell else { return }
        
        var todo = todos[indexPath.row]
        todo.isMarked = !todo.isMarked
        
        todos.remove(at: indexPath.row)
        todos.insert(todo, at: indexPath.row)
        
        cell.checkmarkImageView.image = todo.isMarked == true ? UIImage(named: "checkedicon") : UIImage(named: "checkicon")
        print(indexPath.row)
    }
    
}


