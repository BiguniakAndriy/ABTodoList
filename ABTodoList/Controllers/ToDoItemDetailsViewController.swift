//
//  ToDoItemDetailsViewController.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 28.11.2020.
//

import UIKit

class ToDoItemDetailsViewController: UIViewController {
    var item: TodoItem!
    var recievedIndexPath: IndexPath?
    weak var delegate: ToDoItemDetailsViewControllerDelegate?
    
    let labelView = UIView()
    let imageForName = UIImageView()
    let nameLabel = UILabel()
    let tableView = UITableView()
    
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
        tableView.register(DateDetailCell.self, forCellReuseIdentifier: "DateDetailCell")
        tableView.register(ColorDetailCell.self, forCellReuseIdentifier: "ColorDetailCell")
        tableView.register(PriorityDetailCell.self, forCellReuseIdentifier: "PriorityDetailCell")
        tableView.register(CompleteDetailCell.self, forCellReuseIdentifier: "CompleteDetailCell")
        tableView.register(DeleteDetailCell.self, forCellReuseIdentifier: "DeleteDetailCell")
        tableView.layer.cornerRadius = 12
        tableView.clipsToBounds = true
        tableView.allowsSelection = false
    }
    
    // MARK: - ACTIONS
    @objc fileprivate func deleteButtonTapped(){
        let alert = UIAlertController(title: "Deleting", message: "Are you sure you want to delete this Task?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive) { (action) in
                self.delegate?.toDoItemViewControllerDismissedWithDeletedItem(indexPath: self.recievedIndexPath!)
                self.navigationController?.popViewController(animated: true)
        })
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
} // class end


    // MARK: - TABLE VIEW Delegate and Datasourse
extension ToDoItemDetailsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DateDetailCell") as! DateDetailCell
            cell.setDetailCell(item: item)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ColorDetailCell") as! ColorDetailCell
            cell.setDetailCell(item: item)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PriorityDetailCell") as! PriorityDetailCell
            cell.setDetailCell(item: item)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompleteDetailCell") as! CompleteDetailCell
            cell.setDetailCell(item: item)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeleteDetailCell") as! DeleteDetailCell
            cell.deleteButton.addTarget(self, action: #selector(self.deleteButtonTapped), for: .touchUpInside)
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

    // MARK: - PROTOCOL
protocol ToDoItemDetailsViewControllerDelegate : class {
    func toDoItemViewControllerDismissedWithDeletedItem (indexPath: IndexPath)
}


