//
//  PriorityDetailCell.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 13.01.2021.
//

import UIKit

class PriorityDetailCell: UITableViewCell {

    let icon = UIImageView()
    let label = UILabel()
    let detailLabel = UILabel()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUX()
        configDetail()
        configLabel()
        setupConstraints()
    }
    
    fileprivate func setupUX(){
        contentView.addSubview(icon)
        contentView.addSubview(label)
        contentView.addSubview(detailLabel)
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
    
    fileprivate func setupConstraints() {
        icon.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.heightAnchor.constraint(equalToConstant: Constants.Size.iconSize),
            icon.widthAnchor.constraint(equalToConstant: Constants.Size.iconSize),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Paddings.hPadding),
            
            detailLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            detailLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Paddings.hPadding),

            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: Constants.Paddings.hPadding),
            label.trailingAnchor.constraint(equalTo: detailLabel.leadingAnchor, constant: -Constants.Paddings.hPadding),
        ])
    }
    
    public func setDetailCell (item: TodoItem) {
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
        }
    }

