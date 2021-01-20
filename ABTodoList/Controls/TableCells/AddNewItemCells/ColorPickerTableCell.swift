//
//  ColorPickerTableViewCell.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 05.01.2021.
//

import UIKit

class ColorPickerTableCell: UITableViewCell {
    
    let colorView = UIView()
    let colorButton = UIButton(type: .system)
    
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
        contentView.addSubview(colorView)
        contentView.addSubview(colorButton)
        configControls()
    }
    
    // MARK: - Constraints
    fileprivate func setupConstraints(){
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            colorView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            colorView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            colorView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            colorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Paddings.hPadding),
            
            colorButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            colorButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            colorButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Paddings.hPadding),
            colorButton.trailingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: -Constants.Paddings.hPadding),
        ])
    }
    
    // MARK: Controls
    fileprivate func configControls(){
        colorButton.setTitleColor(.black, for: .normal)
        colorButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        colorButton.contentHorizontalAlignment = .left
        
        colorView.layer.borderWidth = 1
        colorView.layer.borderColor = CGColor.init(gray: 0.8, alpha: 1)
    }
}

