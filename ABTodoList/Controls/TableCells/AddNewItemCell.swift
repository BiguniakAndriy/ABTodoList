////
////  AddNewItemCell.swift
////  ABTodoList
////
////  Created by Andriy Biguniak on 10.12.2020.
////
//
//import UIKit
//
//class AddNewItemCell: UITableViewCell {
//    fileprivate let padding : CGFloat = 20
//
//    fileprivate let nameLabel = UILabel()
//    fileprivate let detailView = UIView()
//    fileprivate var texField = UITextField()
//    fileprivate let prioritySlider = UISlider()
//    fileprivate let datePicker = UIDatePicker()
//    fileprivate let colorPickerButton = UIButton()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubview(nameLabel)
//        addSubview(detailView)
//        setupConstraints()
//        self.selectionStyle = .none
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    fileprivate func setupConstraints(){
//        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
//        nameLabel.trailingAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        
//        detailView.translatesAutoresizingMaskIntoConstraints = false
//        detailView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        detailView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
//        detailView.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -50).isActive = true
//        detailView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
//    }
//    
//    fileprivate func configureTextField(){
//    texField.font = .systemFont(ofSize: 16, weight: .semibold)
//    texField.placeholder = "write name..."
//    texField.textColor = .black
//    texField.translatesAutoresizingMaskIntoConstraints = false
//    texField.topAnchor.constraint(equalTo: topAnchor).isActive = true
//    texField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//    texField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
//    texField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
//    }
//    
//    fileprivate func configureDatePicker(){
//        datePicker.datePickerMode = .dateAndTime
//        datePicker.translatesAutoresizingMaskIntoConstraints = false
//        datePicker.leadingAnchor.constraint(equalTo: detailView.leadingAnchor).isActive = true
//        datePicker.trailingAnchor.constraint(equalTo: detailView.trailingAnchor).isActive = true
//        datePicker.centerYAnchor.constraint(equalTo: detailView.centerYAnchor).isActive = true
//    }
//    
//    fileprivate func configureColorPickerButton() {
//        colorPickerButton.setTitle("Tap here to choose color...", for: .normal)
//        colorPickerButton.titleLabel?.font = colorPickerButton.titleLabel?.font.italic
//        colorPickerButton.titleLabel?.adjustsFontSizeToFitWidth = true
//        colorPickerButton.setTitleColor(.darkGray, for: .normal)
//        
//        colorPickerButton.translatesAutoresizingMaskIntoConstraints = false
//        colorPickerButton.leadingAnchor.constraint(equalTo: detailView.leadingAnchor).isActive = true
//        colorPickerButton.trailingAnchor.constraint(equalTo: detailView.trailingAnchor).isActive = true
//        colorPickerButton.topAnchor.constraint(equalTo: detailView.topAnchor).isActive = true
//        colorPickerButton.bottomAnchor.constraint(equalTo: detailView.bottomAnchor).isActive = true
//    }
//    
//    fileprivate func configurePrioritySlider() {
//        prioritySlider.maximumValue = 5
//        prioritySlider.minimumValue = 1
//
//        prioritySlider.translatesAutoresizingMaskIntoConstraints = false
//        prioritySlider.leadingAnchor.constraint(equalTo: detailView.leadingAnchor).isActive = true
//        prioritySlider.trailingAnchor.constraint(equalTo: detailView.trailingAnchor).isActive = true
//        prioritySlider.centerYAnchor.constraint(equalTo: detailView.centerYAnchor).isActive = true
//    }
//    
//    public func setAddNewItemCell(indexPath: IndexPath){
//        switch indexPath.row {
//        case 0:
//            nameLabel.isHidden = true
//            detailView.isHidden = true
//            addSubview(texField)
//            configureTextField()
//        case 1:
//            nameLabel.text = "Date:"
//            detailView.addSubview(datePicker)
//            configureDatePicker()
//        case 2:
//            nameLabel.text  = "Color:"
//            detailView.addSubview(colorPickerButton)
//            configureColorPickerButton()
//        default:
//            nameLabel.text  = "Priority:"
//            detailView.addSubview(prioritySlider)
//            configurePrioritySlider()
//        }
//    }
//    
//} // class end
