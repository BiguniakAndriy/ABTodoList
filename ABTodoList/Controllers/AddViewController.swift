//
//  AddViewController.swift
//  ABTodoList
//
//  Created by Dima on 05.01.2021.
//

import UIKit

class AddViewController: UITableViewController {
    struct TodoItemData {
        var name : String?
        var date : Date = Date()
        var color : UIColor?
        var priority : Priority = .normal
    }

    fileprivate var itemData = TodoItemData()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        setupData()
    }
    
    // MARK: - UI
    fileprivate func setupUI() {
        tableView.register(TextFieldTableCell.self, forCellReuseIdentifier: "TextFieldTableCell")
        tableView.register(DatePickerTableCell.self, forCellReuseIdentifier: "DatePickerTableCell")
        tableView.register(ColorPickerTableCell.self, forCellReuseIdentifier: "ColorPickerTableCell")
        tableView.register(SetPriorityTableCell.self, forCellReuseIdentifier: "SetPriorityTableCell")
    }

    fileprivate func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .abError
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.onCancelButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.onSaveButton))
    }
    
    // MARK: - DATA
    fileprivate func setupData() {
        self.navigationItem.title = "New ToDo"
    }
    
    // MARK: - ACTIONS
    @objc fileprivate func onCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
    @objc fileprivate func onSaveButton() {
//        let item = TodoItemData(
//            name: itemData.name,
//            date: itemData.date,
//            color: <#T##UIColor?#>,
//            priority: <#T##Priority#>
//        )
        
        //
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func onNameTextFieldChanged(_ sender: UITextField) {
        self.itemData.name = sender.text
    }

    @objc fileprivate func onDatePickerChanged(_ sender: UIDatePicker) {
        print(sender.date)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 3
        default: return 0
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldTableCell", for: indexPath) as! TextFieldTableCell
            cell.textField.placeholder = "Name"
            cell.textField.addTarget(self, action: #selector(self.onNameTextFieldChanged(_:)), for: .editingChanged)
            return cell
        case 1:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DatePickerTableCell", for: indexPath) as! DatePickerTableCell
                cell.datePicker.addTarget(self, action: #selector(self.onDatePickerChanged(_:)), for: .valueChanged)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ColorPickerTableCell", for: indexPath) as! ColorPickerTableCell
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SetPriorityTableCell", for: indexPath) as! SetPriorityTableCell
                return cell
            default: break
            }
        default: break
        }
        
        return UITableViewCell()
    }
}
