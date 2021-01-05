//
//  TextFieldTableCell.swift
//  ABTodoList
//
//  Created by Dima on 05.01.2021.
//

import UIKit

class TextFieldTableCell: UITableViewCell {
    let textField: UITextField = {
        let field = UITextField()
        field.font = .systemFont(ofSize: 16)
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.keyboardType = .default
        field.returnKeyType = .next
        field.textColor = .black
        return field
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //MARK: - UI
    fileprivate func setupViews() {
        contentView.addSubview(textField)

        self.setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: contentView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.Paddings.hPadding),
            textField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.Paddings.hPadding),
        ])
    }
}

