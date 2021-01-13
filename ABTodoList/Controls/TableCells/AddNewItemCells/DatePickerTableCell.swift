//
//  DatePickerTableViewCell.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 05.01.2021.
//

import UIKit

class DatePickerTableCell: UITableViewCell {
    
    let datePicker = UIDatePicker()
    let label = UILabel()
    
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
        contentView.addSubview(label)
        contentView.addSubview(datePicker)
        configControls()
    }
    
    // MARK: - Constraints
    fileprivate func setupConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false

//        let datePickerLeftConstraint = label.rightAnchor.constraint(greaterThanOrEqualTo: datePicker.leftAnchor, constant: -Constants.Paddings.hPadding)
//        datePickerLeftConstraint.priority = UILayoutPriority(rawValue: 100)
        let datePickerRightConstraint = datePicker.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.Paddings.hPadding)
        datePickerRightConstraint.priority = UILayoutPriority(rawValue: 999)

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Paddings.hPadding),
            
            datePicker.centerYAnchor.constraint(equalTo: centerYAnchor),
//            datePickerLeftConstraint,
            datePickerRightConstraint
        ])
    }
    
    fileprivate func configControls(){
        label.text = "Date"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.calendar = .current
    }
}
