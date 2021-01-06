//
//  ColorPickerTableViewCell.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 05.01.2021.
//

import UIKit

class ColorPickerTableCell: UITableViewCell {
    
    fileprivate let label = UILabel()
    fileprivate var button = UIButton(type: .system)
    fileprivate var selectedColor : UIColor? = nil
    
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
        addSubview(button)
        configControls()
    }
    
    // MARK: - Constraints
    fileprivate func setupConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Paddings.hPadding).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        button.leadingAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Paddings.hPadding).isActive = true
    }
    
    // MARK: Controls
    fileprivate func configControls(){
        label.text = "Color"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        
        if selectedColor == nil {
            button.setTitle("Tap to select", for: .normal)
            button.setTitleColor(.systemGray, for: .normal)
            button.titleLabel?.font = .italicSystemFont(ofSize: 18)
        } else {
            button.layer.borderWidth = 1
            button.layer.borderColor = CGColor.init(gray: 0.8, alpha: 1)
            button.backgroundColor = selectedColor
        }
    }
}

