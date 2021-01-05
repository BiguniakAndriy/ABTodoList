//
//  ToDoItemDetailsViewController.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 28.11.2020.
//

import UIKit

class ToDoItemDetailsViewController: UIViewController {
    var item: TodoItem!
    
    fileprivate var labelView = UIView()
    fileprivate var imageForName = UIImageView()
    fileprivate var nameLabel = UILabel()
    fileprivate var tableView = UITableView()
    fileprivate let outPadding : CGFloat = 20
    fileprivate let inPadding : CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        view.backgroundColor = .systemGray5
        view.addSubview(imageForName)
        view.addSubview(nameLabel)
        view.addSubview(tableView)
        configImageForName()
        configNameLabel()
        configureTableView()
    }

    
    fileprivate func configImageForName(){
        imageForName.image = UIImage(systemName: "wallet.pass.fill")
        imageForName.tintColor = item.color ?? .black
        
        imageForName.translatesAutoresizingMaskIntoConstraints = false
        imageForName.heightAnchor.constraint(equalToConstant: 70 ).isActive = true
        imageForName.widthAnchor.constraint(equalTo: imageForName.heightAnchor).isActive = true
        imageForName.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        imageForName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outPadding).isActive = true
    }
    
    fileprivate func configNameLabel(){
        nameLabel.text = self.item.name
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 30, weight: .medium)
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: imageForName.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: imageForName.trailingAnchor, constant: inPadding).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outPadding).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: imageForName.bottomAnchor).isActive = true
    }
    
    fileprivate func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DetailToDoCell.self, forCellReuseIdentifier: "DetailToDoCell")
        tableView.layer.cornerRadius = 12
        tableView.clipsToBounds = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        tableView.topAnchor.constraint(equalTo: imageForName.bottomAnchor, constant: outPadding).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outPadding).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outPadding).isActive = true
    }
    
} // class end


extension ToDoItemDetailsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailToDoCell") as! DetailToDoCell
        cell.setDetailCell(item: item, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
