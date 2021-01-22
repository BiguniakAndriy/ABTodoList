//
//  ColorPickerDetailCell.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 05.01.2021.
//

import UIKit

class ColorPickerDetailCell: UITableViewCell {
    
    let icon = UIImageView()
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
        contentView.addSubview(icon)
        contentView.addSubview(colorView)
        contentView.addSubview(colorButton)
        configControls()
    }
    
    // MARK: - Constraints
    fileprivate func setupConstraints(){
        icon.translatesAutoresizingMaskIntoConstraints = false
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        colorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.heightAnchor.constraint(equalToConstant: Constants.Size.iconSize),
            icon.widthAnchor.constraint(equalToConstant: Constants.Size.iconSize),
            icon.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.Paddings.hPadding),
            
            colorView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            colorView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            colorView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            colorView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.Paddings.hPadding),
            
            colorButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            colorButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            colorButton.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: Constants.Paddings.hPadding),
            colorButton.rightAnchor.constraint(equalTo: colorView.leftAnchor, constant: -Constants.Paddings.hPadding),
        ])
    }
    
    // MARK: Controls
    fileprivate func configControls(){
        icon.image = UIImage(systemName: "paintbrush.fill")
        icon.tintColor = .systemBlue
    
        colorButton.setTitleColor(.black, for: .normal)
        colorButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        colorButton.contentHorizontalAlignment = .left
        
        colorView.layer.borderWidth = 1
        colorView.layer.borderColor =  CGColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
}

