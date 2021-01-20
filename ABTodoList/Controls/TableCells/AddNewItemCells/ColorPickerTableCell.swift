//
//  ColorPickerTableViewCell.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 05.01.2021.
//

import UIKit

class ColorPickerTableCell: UITableViewCell {
    
    let label = UILabel()
    let button = UIButton(type: .system)
    
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
        contentView.addSubview(label)
        contentView.addSubview(button)
        configControls()
    }
    
    // MARK: - Constraints
    fileprivate func setupConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Paddings.hPadding),
            
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            button.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Paddings.hPadding)
        ])
    }
    
    // MARK: Controls
    fileprivate func configControls(){
        label.text = "Color"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        
        button.setTitle("Tap to select", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.titleLabel?.font = .italicSystemFont(ofSize: 18)
    }
}

