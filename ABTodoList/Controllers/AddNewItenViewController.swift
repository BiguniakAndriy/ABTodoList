//
//  AddNewItenViewController.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 09.12.2020.
//

import UIKit

class AddNewItemViewController : UIViewController {
    struct Paddings {
        static let out : CGFloat = 20
        static let inside : CGFloat = 10
    }
    
    static let kPaddingOut : CGFloat = 20
    static let kPaddingIn : CGFloat = 10

    fileprivate let outPadding : CGFloat = 20
    fileprivate let inPadding : CGFloat = 10
    fileprivate let buttonWidth : CGFloat = 80
    
    fileprivate let tableView = UITableView()
    fileprivate var saveButton = UIButton(type: .system)
    fileprivate var cancelButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()
        setupUI()
        setupConstraints()
        setupData()
    }
    
    fileprivate func buildUI() {
        view.addSubview(tableView)
        view.addSubview(cancelButton)
        view.addSubview(saveButton)
    }
    
    fileprivate func setupUI() {
        view.backgroundColor = .systemGray6
        
        setupTable()
        configureButton(button: cancelButton, name: "Cancel")
        configureButton(button: saveButton, name: "Save")
    }
    
    fileprivate func setupData() {
        self.title = "Add new ToDoItem"
    }
    
    fileprivate func setupTable(){
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AddNewItemCell.self, forCellReuseIdentifier: "AddNewItemCell")
        tableView.layer.cornerRadius = 12
        tableView.clipsToBounds = true
    }
    
    fileprivate func setupConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Paddings.hPadding).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outPadding).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        cancelButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: outPadding*2).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outPadding*2).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true

        saveButton.topAnchor.constraint(equalTo: cancelButton.topAnchor).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outPadding*2).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    }
    
    fileprivate func configureButton(button: UIButton, name: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = name == "Save" ? .systemBlue : .systemPink
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.layer.cornerRadius = buttonWidth / 2
        button.clipsToBounds = true
        button.setTitle(name, for: .normal)
        button.setTitleColor(.white, for: .normal)
//        return button
    }
} // class end


extension AddNewItemViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddNewItemCell") as! AddNewItemCell
        cell.setAddNewItemCell(indexPath: indexPath)
       return cell
    }
    
    
}
