//
//  DatePickerDetailCell.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 05.01.2021.
//

import UIKit

class DatePickerDetailCell: UITableViewCell {
    
    let icon = UIImageView()
    let datePicker = UIDatePicker()
    let label = UILabel()
    let button = UIButton(type: .system)
    
    fileprivate var date = Date()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    fileprivate func setupCell(){
        contentView.addSubview(icon)
        contentView.addSubview(label)
        contentView.addSubview(datePicker)
        contentView.addSubview(button)
        configControls()
    }
    
    // MARK: - Constraints
    fileprivate func setupConstraints(){
        icon.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let datePickerRightConstraint = datePicker.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.Paddings.hPadding)
        datePickerRightConstraint.priority = UILayoutPriority(rawValue: 999)
        
        let buttonRightConstraint = button.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.Paddings.hPadding)
        buttonRightConstraint.priority = UILayoutPriority(rawValue: 999)
        
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.heightAnchor.constraint(equalToConstant: Constants.Size.iconSize),
            icon.widthAnchor.constraint(equalToConstant: Constants.Size.iconSize),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Paddings.hPadding),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: Constants.Paddings.hPadding),
            
            datePicker.centerYAnchor.constraint(equalTo: centerYAnchor),
            datePickerRightConstraint,
            
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            datePickerRightConstraint
        ])
    }
    
    fileprivate func configControls(){
        icon.image = UIImage(systemName: "calendar")
        icon.tintColor = .systemBlue
        
        label.text = "Date"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.calendar = .current
        
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.text = "Set Date"
    }
}
