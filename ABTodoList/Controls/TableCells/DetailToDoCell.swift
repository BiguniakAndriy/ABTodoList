//
//  DetailToDoCell.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 28.11.2020.
//

import UIKit

class DetailToDoCell: UITableViewCell {
    
    fileprivate let iconSize : CGFloat = 30
    fileprivate let padding : CGFloat = 20
    
    let icon = UIImageView()
    var label = UILabel()
    var detailLabel = UILabel()
    var detailView = UIView()
    let deleteButton = UIButton()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUX()
        configDetail()
        configLabel()
        setDeleteButton()
        setupConstraints()
    }
    
    fileprivate func setupUX(){
        addSubview(icon)
        addSubview(label)
        addSubview(detailView)
        addSubview(deleteButton)
        detailView.addSubview(detailLabel)
    }
    
    fileprivate func configDetail(){
        detailLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        detailLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        detailLabel.textAlignment = .right
        detailLabel.textColor = .black
    }
    
    fileprivate func configLabel(){
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.textColor = .darkGray
    }
    
    fileprivate func setDeleteButton(){
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.setTitleColor(.systemRed, for: .normal)
        deleteButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
    }
    
    fileprivate func setupConstraints() {
        icon.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.heightAnchor.constraint(equalToConstant: iconSize),
            icon.widthAnchor.constraint(equalToConstant: iconSize),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            
            detailLabel.centerYAnchor.constraint(equalTo: detailView.centerYAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor),
            
            detailView.centerYAnchor.constraint(equalTo: centerYAnchor),
            detailView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            detailView.widthAnchor.constraint(greaterThanOrEqualTo: detailView.heightAnchor, multiplier: 1),
            detailView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),

            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: padding),
            label.trailingAnchor.constraint(equalTo: detailLabel.leadingAnchor, constant: -padding),
            
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            deleteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    public func setDetailCell (item: TodoItem, indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            deleteButton.isHidden = true
            icon.image = UIImage(systemName: "calendar")
            label.text = "Date:"
            detailLabel.text = item.date.getDateInString()
        case 1:
            deleteButton.isHidden = true
            detailLabel.isHidden = true
            icon.image = UIImage(systemName: "paintbrush.fill")
            label.text = "Color:"
            detailView.backgroundColor = item.color ?? .black
            detailView.layer.borderWidth = 1
            detailView.layer.borderColor = CGColor(red: 0/255, green: 0.255, blue: 0/255, alpha: 1)
        case 2:
            deleteButton.isHidden = true
            icon.image = UIImage(systemName: "exclamationmark.octagon")
            label.text = "Priority:"
            switch item.priority {
            case .lowest:
            detailLabel.text = "Lowest"
            case .low:
            detailLabel.text = "Low"
            case .normal:
            detailLabel.text = "Normal"
            case .high:
            detailLabel.text = "High"
            default:
                detailLabel.text = "Highest"}
        case 3:
            deleteButton.isHidden = true
            icon.image = UIImage(systemName: "checkmark.square")
            label.text = "Complete:"
            detailLabel.text = item.complete == true ? "True" : "False"
        case 4:
            icon.isHidden = true
            label.isHidden = true
            detailLabel.isHidden = true
            deleteButton.isHidden = false
        default:
            break
        }
    }
}

