//
//  AddViewController.swift
//  ABTodoList
//
//  Created by Dima on 05.01.2021.
//

import UIKit

@available(iOS 14.0, *)
class AddViewController: UITableViewController {
    
    struct TodoItemData {
        var name : String?
        var date : Date = Date()
        var color : UIColor?
        var priority : Priority = .normal
        var isFilled: Bool {
            return (name != nil && !name!.isEmpty)
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
    var itemData = TodoItemData()
    
    fileprivate var addMode = true
    let colorPicker = UIColorPickerViewController()
    var recievedItem : TodoItem?
    var recievedIndexPath: IndexPath?
    weak var delegate: AddViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        setupNavigationBar()
        checkMode()
        setupUI()
        setupData()
    }
    
    // MARK: - UI
    fileprivate func setupUI() {
        tableView.register(TextFieldDetailCell.self, forCellReuseIdentifier: "TextFieldDetailCell")
        tableView.register(DatePickerDetailCell.self, forCellReuseIdentifier: "DatePickerDetailCell")
        tableView.register(ColorPickerDetailCell.self, forCellReuseIdentifier: "ColorPickerDetailCell")
        tableView.register(SetPriorityDetailCell.self, forCellReuseIdentifier: "SetPriorityDetailCell")
        tableView.register(CompleteDetailCell.self, forCellReuseIdentifier: "CompleteDetailCell")
        tableView.register(DeleteTableCell.self, forCellReuseIdentifier: "DeleteTableCell")
    }
    
    fileprivate func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .abError
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.onCancelButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.onSaveButton))
    }
    
    fileprivate func checkMode() {
        if recievedItem != nil {
            addMode = false
            //            self.navigationItem.rightBarButtonItem?.isEnabled = false
            
            itemData.name = recievedItem?.name
            itemData.date = recievedItem?.date ?? Date()
            itemData.color = recievedItem?.color
            itemData.priority = recievedItem?.priority ?? Priority.normal
            
            // кнопка save активується після того як будуть зроблені хоч якісь зміни
        } else {
            addMode = true
        }
    }
    
    // MARK: - DATA
    fileprivate func setupData() {
        self.navigationItem.title = addMode == true ? "New ToDo" : "Details"
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
    @objc fileprivate func onDateButton() {
        //        cell.button.isHidden = true
        //        cell.datePicker.isHidden = false
    }
    
    @objc fileprivate func onSelectButton(_ sender: UIButton) {
        if itemData.color != nil {
            colorPicker.selectedColor = itemData.color!
        } else { colorPicker.selectedColor = .black }
        colorPicker.delegate = self
        self.present(colorPicker, animated: true, completion: nil)
    }
    
    @objc fileprivate func onResetButton(_ sender: UIButton) {
        itemData.color = nil
        self.tableView.reloadData()
    }
    
    @objc fileprivate func onPriorirySliderChanged(_ sender: UISlider) {
        self.itemData.priority = Priority(rawValue: Int(sender.value)) ?? Priority.normal
        self.tableView.reloadData()
    }
    
    @objc fileprivate func onDeleteButton(){
        let alert = UIAlertController(title: "Deleting", message: "Are you sure you want to delete this Task?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive) { (action) in
            self.delegate?.addViewControllerDeleteItem(indexPath: self.recievedIndexPath!)
            self.navigationController?.popViewController(animated: true)
            })
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
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
        case 1: return addMode == true ? 3 : 5
        default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  indexPath.row == 2 ? 80 : 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldDetailCell", for: indexPath) as! TextFieldDetailCell
            if addMode == false {
                cell.textField.text = itemData.name
            } else {
                cell.textField.placeholder = "Name"
            }
            cell.textField.addTarget(self, action: #selector(self.onNameTextFieldChanged(_:)), for: .editingChanged)
            return cell
            
        case 1:
            switch indexPath.row {
            
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DatePickerDetailCell", for: indexPath) as! DatePickerDetailCell
                if addMode == false && itemData.date == nil {
                    cell.button.isHidden = false
                    cell.datePicker.isHidden = true
                    cell.button.addTarget(self, action: #selector(self.onDateButton), for: .touchUpInside)
                    cell.datePicker.addTarget(self, action: #selector(self.onDatePickerChanged(_:)), for: .valueChanged)
                } else {
                    cell.button.isHidden = true
                    cell.datePicker.isHidden = false
                    cell.datePicker.addTarget(self, action: #selector(self.onDatePickerChanged(_:)), for: .valueChanged)
                }
                
                return cell
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ColorPickerDetailCell", for: indexPath) as! ColorPickerDetailCell
                if itemData.color != nil  {
                    cell.colorButton.setTitle("Color - Tap to RESET", for: .normal)
                    cell.colorView.isHidden = false
                    cell.colorView.backgroundColor = itemData.color
                    cell.colorButton.addTarget(self, action: #selector(self.onResetButton(_:)), for: .touchUpInside)
                } else {
                    cell.colorButton.setTitle("Color - Tap to SELECT" , for: .normal)
                    cell.colorView.isHidden = true
                    cell.colorButton.addTarget(self, action: #selector(self.onSelectButton(_:)), for: .touchUpInside)
                }
                return cell
                
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SetPriorityDetailCell", for: indexPath) as! SetPriorityDetailCell
                cell.sliderDetail.text = "\(itemData.priority) "
                cell.slider.addTarget(self, action: #selector(self.onPriorirySliderChanged(_:)), for: .valueChanged)
                return cell
                
            case 3 :
                let cell = tableView.dequeueReusableCell(withIdentifier: "CompleteDetailCell", for: indexPath) as! CompleteDetailCell
                return cell
                
            case 4 :
                let cell = tableView.dequeueReusableCell(withIdentifier: "DeleteTableCell", for: indexPath) as! DeleteTableCell
                cell.deleteButton.addTarget(self, action: #selector(self.onDeleteButton), for: .touchUpInside)
                return cell
                
            default: break
            }
        default: break
        }
        
        return UITableViewCell()
    }
}

// MARK: - PROTOCOLS

// AddViewControllerDelegate
protocol AddViewControllerDelegate: class {
    func addViewControllerDismissedWithItem(_ item: TodoItem)
    func addViewControllerDeleteItem (indexPath: IndexPath)
}

// PickerViewDelegate
@available(iOS 14.0, *)
extension AddViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.itemData.color = viewController.selectedColor
        self.tableView.reloadRows(at: [IndexPath(row: 1, section: 1)], with: .automatic)
    }
}
