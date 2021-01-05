//
//  TodoItem.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 27.11.2020.
//

import Foundation
import UIKit


struct TodoItem {
    var name : String
    var date : Date = Date()
    var color : UIColor?
    var priority : Priority = .normal
    var complete : Bool = false
}
