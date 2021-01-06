//
//  SetPriorityTableViewCell.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 05.01.2021.
//

import UIKit

class SetPriorityTableCell: UITableViewCell {

    fileprivate let label = UILabel()
    fileprivate var slider = UISlider()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
        setupConstraints()
        configControls()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    fileprivate func setupCell(){
        addSubview(label)
        addSubview(slider)
        configControls()
    }
    
    // MARK: - Constraints
    fileprivate func setupConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Paddings.hPadding).isActive = true
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        slider.leadingAnchor.constraint(equalTo: centerXAnchor).isActive = true
        slider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Paddings.hPadding).isActive = true
    }
    
    // MARK: Controls
    fileprivate func configControls(){
        label.text = "Priority"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        
        slider.value = 1
        slider.maximumValue = 5
        slider.minimumValue = 1
    }
}
