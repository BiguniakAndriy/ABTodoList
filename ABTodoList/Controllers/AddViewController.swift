//
//  AddViewController.swift
//  ABTodoList
//
//  Created by Dima on 05.01.2021.
//

import UIKit

@available(iOS 14.0, *)
class AddViewController: UITableViewController {
    
    let colorPicker = UIColorPickerViewController()
    
    struct TodoItemData {
        var name : String?
        var date : Date = Date()
        var color : UIColor?
        var priority : Priority = .normal
        var isFilled: Bool {
            return
                (name != nil && !name!.isEmpty)
        }
        
        func validateErrors() -> [String]? {
            if isFilled { return nil }
            
            var errors = [String]()
            
            if name == nil || name!.isEmpty {
                errors.append("Please provide ToDo Item name!")
            }
            
            return errors
        }
    }

    fileprivate var itemData = TodoItemData()

    weak var delegate: AddViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
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
        if let errors = itemData.validateErrors() {
            showErrorAlert(message: errors.first)
            return
        }
        
        let item = TodoItem(name: itemData.name!,
                            date: itemData.date,
                            color: itemData.color,
                            priority: itemData.priority,
                            complete: false)
        
        self.dismiss(animated: true, completion: {
            self.delegate?.addViewControllerDismissedWithItem(item)
        })
    }
    
    @objc fileprivate func onNameTextFieldChanged(_ sender: UITextField) {
        self.itemData.name = sender.text
    }

    @objc fileprivate func onDatePickerChanged(_ sender: UIDatePicker) {
        itemData.date = sender.date
    }
    
    @objc fileprivate func onSelectColorButton(_ sender: UIButton) {
        if itemData.color != nil {
            colorPicker.selectedColor = itemData.color!
        } else { colorPicker.selectedColor = .black }
            colorPicker.delegate = self
            self.present(colorPicker, animated: true, completion: nil)
    }
    
    @objc fileprivate func onPriorirySliderChanged(_ sender: UISlider) {
        self.itemData.priority = Priority(rawValue: Int(sender.value)) ?? Priority.normal
        print("slider works, value - \(sender.value)")
    }

    // MARK: - HELPERS
    fileprivate func showErrorAlert(message: String?) {
        let _message = message ?? "Something went wrong"
        print(_message)
        //_message
        //
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
                if itemData.color != nil  {
                    cell.button.setTitle("", for: .normal)
                    cell.button.backgroundColor = itemData.color
                    cell.button.layer.borderWidth = 1
                    cell.button.layer.borderColor = CGColor.init(gray: 0.8, alpha: 1)
                }
                cell.button.addTarget(self, action: #selector(self.onSelectColorButton(_:)), for: .touchUpInside)
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SetPriorityTableCell", for: indexPath) as! SetPriorityTableCell
                cell.slider.addTarget(self, action: #selector(self.onPriorirySliderChanged(_:)), for: .valueChanged)
                return cell
            default: break
            }
        default: break
        }
        
        return UITableViewCell()
    }
}

// MARK: - PROTOCOL
protocol AddViewControllerDelegate: class {
    func addViewControllerDismissedWithItem(_ item: TodoItem)
}

// MARK: - UIColorPickerViewControllerDelegate
@available(iOS 14.0, *)
extension AddViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.itemData.color = viewController.selectedColor
        self.tableView.reloadRows(at: [IndexPath(row: 1, section: 1)], with: .automatic)
    }
}
