//
//  ToDoItemTableCell.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 07.12.2020.
//

import UIKit

class ToDoItemTableCell: UITableViewCell {
    let kPadding: CGFloat = 15
    
    let doneButton: UIButtonWithAction = {
        let button = UIButtonWithAction(type: .system)
        button.tintColor = .purple
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 2
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //MARK: - UI
    fileprivate func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(doneButton)
        contentView.addSubview(nameLabel)
        contentView.addSubview(timeLabel)
        self.setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timeLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        NSLayoutConstraint.activate([
            doneButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kPadding),
            doneButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            doneButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            doneButton.widthAnchor.constraint(equalTo: doneButton.heightAnchor),
        
            nameLabel.leftAnchor.constraint(equalTo: doneButton.rightAnchor, constant: kPadding),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameLabel.rightAnchor.constraint(equalTo: timeLabel.leftAnchor, constant: -kPadding),

            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            timeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kPadding),
        ])
    }

}

