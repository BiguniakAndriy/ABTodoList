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

        let datePickerLeftConstraint = label.rightAnchor.constraint(greaterThanOrEqualTo: datePicker.leftAnchor, constant: -Constants.Paddings.hPadding)
        datePickerLeftConstraint.priority = UILayoutPriority(rawValue: 100)

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Paddings.hPadding),
            datePickerLeftConstraint,
            
            datePicker.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            datePicker.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.Paddings.hPadding)
        ])
    }
    
    fileprivate func configControls(){
        label.text = "Date"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.calendar = .current
        datePicker.backgroundColor = .yellow
    }
}
