//
//  SetPriorityDetailCell.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 05.01.2021.
//

import UIKit

class SetPriorityDetailCell: UITableViewCell {

    let icon = UIImageView()
    let label = UILabel()
    var slider = UISlider()
    var sliderDetail = UILabel()
    let stackView = UIStackView()
    
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
        contentView.addSubview(label)
        contentView.addSubview(sliderDetail)
        contentView.addSubview(slider)
        configControls()
    }
    
    // MARK: - Constraints
    fileprivate func setupConstraints(){
        icon.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        sliderDetail.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.heightAnchor.constraint(equalToConstant: Constants.Size.iconSize),
            icon.widthAnchor.constraint(equalToConstant: Constants.Size.iconSize),
            icon.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.Paddings.hPadding),
            
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: Constants.Paddings.hPadding),
            
            slider.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 15),
            slider.leftAnchor.constraint(equalTo: contentView.centerXAnchor),
            slider.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.Paddings.hPadding),
            
            sliderDetail.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -15),
            sliderDetail.centerXAnchor.constraint(equalTo: slider.centerXAnchor),
        ])
    }
    
    // MARK: Controls
    fileprivate func configControls(){
        icon.image = UIImage(systemName: "exclamationmark.octagon")
        icon.tintColor = .systemBlue
        
        label.text = "Priority"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        
        slider.value = 3
        slider.maximumValue = 5
        slider.minimumValue = 1
        
        sliderDetail.font = .systemFont(ofSize: 18, weight: .regular)
        sliderDetail.textColor = .systemGray
    }
}
