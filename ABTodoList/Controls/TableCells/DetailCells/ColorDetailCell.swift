////
////  ColorDetailCell.swift
////  ABTodoList
////
////  Created by Andriy Biguniak on 13.01.2021.
////
//
//import UIKit
//
//class ColorDetailCell: UITableViewCell {
//
//    let icon = UIImageView()
//    let label = UILabel()
//    let detailView = UIView()
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        setupUX()
//        configLabel()
//        setupConstraints()
//    }
//    
//    fileprivate func setupUX(){
//        contentView.addSubview(icon)
//        contentView.addSubview(label)
//        contentView.addSubview(detailView)
//    }
//    
//    fileprivate func configLabel(){
//        label.font = .systemFont(ofSize: 16, weight: .regular)
//        label.textAlignment = .left
//        label.textColor = .darkGray
//    }
//    
//    fileprivate func setupConstraints() {
//        icon.translatesAutoresizingMaskIntoConstraints = false
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
//        detailView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            icon.heightAnchor.constraint(equalToConstant: Constants.Size.iconSize),
//            icon.widthAnchor.constraint(equalToConstant: Constants.Size.iconSize),
//            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Paddings.hPadding),
//            
//            detailView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            detailView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),
//            detailView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),
//            detailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Paddings.hPadding),
//
//            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: Constants.Paddings.hPadding),
//            label.trailingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: -Constants.Paddings.hPadding),
//        ])
//    }
//    
//    public func setDetailCell (item: TodoItem) {
//        icon.image = UIImage(systemName: "paintbrush.fill")
//        label.text = "Color:"
//        detailView.backgroundColor = item.color ?? .black
//        detailView.layer.borderWidth = 1
//        detailView.layer.borderColor = CGColor(red: 0/255, green: 0.255, blue: 0/255, alpha: 1)
//        }
//    }
