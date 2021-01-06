//
//  DatePickerTableViewCell.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 05.01.2021.
//

import UIKit

class DatePickerTableCell: UITableViewCell {
    
    fileprivate let datePicker = UIDatePicker()
    fileprivate let label = UILabel()
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
        addSubview(label)
        addSubview(datePicker)
        configControls()
    }
    
    
    // MARK: - Constraints
    fileprivate func setupConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Paddings.hPadding).isActive = true
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Paddings.hPadding).isActive = true
        
            // priority does not working
//        datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Paddings.hPadding).priority = UILayoutPriority(999)
//        datePicker.leadingAnchor.constraint(greaterThanOrEqualTo: label.trailingAnchor, constant: Constants.Paddings.hPadding).isActive = true
//        datePicker.leadingAnchor.constraint(greaterThanOrEqualTo: label.trailingAnchor, constant: Constants.Paddings.hPadding).priority = UILayoutPriority(500)
    }
    
    fileprivate func configControls(){
        label.text = "Date"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.calendar = .current
    }
}
