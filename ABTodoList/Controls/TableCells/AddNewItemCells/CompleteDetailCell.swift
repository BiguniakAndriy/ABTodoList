//
//  CompleteDetailCell.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 13.01.2021.
//

import UIKit

class CompleteDetailCell: UITableViewCell {
    
    let icon = UIImageView()
    let label = UILabel()
    let detailLabel = UILabel()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUX()
        configControls()
        setupConstraints()
    }
    
    fileprivate func setupUX(){
        contentView.addSubview(icon)
        contentView.addSubview(label)
        contentView.addSubview(detailLabel)
    }
    
    fileprivate func configControls() {
        icon.image = UIImage(systemName: "checkmark.square")

        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Complete:"
        
        detailLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        detailLabel.font = .systemFont(ofSize: 18, weight: .regular)
        detailLabel.textAlignment = .right
        detailLabel.textColor = .systemGray
        detailLabel.text = "False"
    }
    
    fileprivate func setupConstraints() {
        icon.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.heightAnchor.constraint(equalToConstant: Constants.Size.iconSize),
            icon.widthAnchor.constraint(equalToConstant: Constants.Size.iconSize),
            icon.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.Paddings.hPadding),
            
            detailLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            detailLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),
            detailLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.Paddings.hPadding),
            
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: Constants.Paddings.hPadding),
            label.rightAnchor.constraint(equalTo: detailLabel.leftAnchor, constant: -Constants.Paddings.hPadding),
        ])
    }
}


