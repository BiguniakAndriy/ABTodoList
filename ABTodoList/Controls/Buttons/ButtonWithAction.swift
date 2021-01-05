//
//  ButtonWithAction.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 08.12.2020.
//

import UIKit

class UIButtonWithAction: UIButton {
    var targetAction: (() -> Void)? {
        didSet {
            self.addTarget(self, action: #selector(self.actionSelector), for: .touchUpInside)
        }
    }
    
    @objc func actionSelector() {
        self.targetAction?()
    }
}

