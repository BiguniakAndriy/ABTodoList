//
//  DetailToDoCell.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 28.11.2020.
//

import UIKit

class DetailToDoCell: UITableViewCell {

    fileprivate let icon = UIImageView()
    fileprivate var label = UILabel()
    fileprivate var detailLabel = UILabel()
    fileprivate var detailView = UIView()
    fileprivate let iconSize : CGFloat = 30
    fileprivate let padding : CGFloat = 20
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(icon)
        addSubview(label)
        addSubview(detailView)
        detailView.addSubview(detailLabel)
        configIcon()
        configDetail()
        configLabel()
    }
    
    private func configIcon(){
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant: iconSize).isActive = true
        icon.widthAnchor.constraint(equalToConstant: iconSize).isActive = true
        icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
    }
    
    private func configDetail(){
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true
        detailView.widthAnchor.constraint(greaterThanOrEqualTo: detailView.heightAnchor, multiplier: 1).isActive = true
        detailView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        
        detailLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        detailLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        detailLabel.textAlignment = .right
        detailLabel.textColor = .black
    
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor).isActive = true
    }
    
    private func configLabel(){
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.textColor = .darkGray
    
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: padding).isActive = true
        label.trailingAnchor.constraint(equalTo: detailLabel.leadingAnchor, constant: -padding).isActive = true
    }
    
    public func setDetailCell (item: TodoItem, indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            icon.image = UIImage(systemName: "calendar")
            label.text = "Date:"
            detailLabel.text = item.date.getDateInString()
        case 1:
            icon.image = UIImage(systemName: "paintbrush.fill")
            label.text = "Color:"
            detailLabel.isHidden = true
            detailView.backgroundColor = item.color ?? .black
            detailView.layer.borderWidth = 1
            detailView.layer.borderColor = CGColor(red: 0/255, green: 0.255, blue: 0/255, alpha: 1)
        case 2:
            icon.image = UIImage(systemName: "exclamationmark.octagon")
            label.text = "Priority:"
            switch item.priority {
            case .lowest:
            detailLabel.text = "Lowest"
            case .low:
            detailLabel.text = "Low"
            case .normal:
            detailLabel.text = "Normal"
            case .high:
            detailLabel.text = "High"
            default:
                detailLabel.text = "Highest"}
        default:
            icon.image = UIImage(systemName: "checkmark.square")
            label.text = "Complete:"
            detailLabel.text = item.complete == true ? "True" : "False"
        }
    }
}


extension UIColor {
    var name: String? {
        switch self {
        case UIColor.black: return "black"
        case UIColor.darkGray: return "darkGray"
        case UIColor.lightGray: return "lightGray"
        case UIColor.white: return "white"
        case UIColor.gray: return "gray"
        case UIColor.red: return "red"
        case UIColor.green: return "green"
        case UIColor.blue: return "blue"
        case UIColor.cyan: return "cyan"
        case UIColor.yellow: return "yellow"
        case UIColor.magenta: return "magenta"
        case UIColor.orange: return "orange"
        case UIColor.purple: return "purple"
        case UIColor.brown: return "brown"
        default: return nil
        }
    }
}

