//
//  ToDoItemDetailsViewController.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 28.11.2020.
//

import UIKit

class ToDoItemDetailsViewController: UIViewController {
    var item: TodoItem!
    
    var labelView = UIView()
    var imageForName = UIImageView()
    var nameLabel = UILabel()
    var tableView = UITableView()
    var deleteButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray5
        
        setupData()
        setupUX()
        setupControls()
        setupConstraints()
    }
    
    // MARK: - Data
    fileprivate func setupData(){
        self.title = "Details"
    }
    
    // MARK: - Actions
    @objc fileprivate func deleteItem() {
    
    }
    
    // MARK: - UX
    fileprivate func setupUX(){
        view.addSubview(imageForName)
        view.addSubview(nameLabel)
        view.addSubview(tableView)
    }
    
    //MARK: - Controls
    fileprivate func setupControls(){
        configImageForName()
        configNameLabel()
        configureTableView()
//        configDeleteButton()
    }
    
    fileprivate func configImageForName(){
        imageForName.image = UIImage(systemName: "wallet.pass.fill")
        imageForName.tintColor = item.color ?? .black
    }
    
    fileprivate func configNameLabel(){
        nameLabel.text = self.item.name
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 30, weight: .medium)
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    fileprivate func setupConstraints(){
        imageForName.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageForName.heightAnchor.constraint(equalToConstant: 70 ),
            imageForName.widthAnchor.constraint(equalTo: imageForName.heightAnchor),
            imageForName.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imageForName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Paddings.hPadding),
            
            nameLabel.topAnchor.constraint(equalTo: imageForName.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: imageForName.trailingAnchor, constant: Constants.Paddings.hPadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.Paddings.hPadding),
            nameLabel.bottomAnchor.constraint(equalTo: imageForName.bottomAnchor),
            
            tableView.heightAnchor.constraint(equalToConstant: 250),
            tableView.topAnchor.constraint(equalTo: imageForName.bottomAnchor, constant: Constants.Paddings.hPadding),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Paddings.hPadding),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Paddings.hPadding)
        ])
    }
    
    fileprivate func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DetailToDoCell.self, forCellReuseIdentifier: "DetailToDoCell")
        tableView.layer.cornerRadius = 12
        tableView.clipsToBounds = true
    }
    
    // MARK: - Actions
    
    @objc func deleteButtonTapped(){
        deleteButton.isSelected = false
        deleteButton.backgroundColor = .systemBlue
    }
    
    
} // class end

extension ToDoItemDetailsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailToDoCell") as! DetailToDoCell
        cell.setDetailCell(item: item, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 4:
            deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        default:
            return
        }
    }
    
}


