//
//  Color Ext.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 08.12.2020.
//

import UIKit

extension UIImage {
    func fillColortOver(with color: UIColor) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let renderedImage = renderer.image { _ in
            color.set()
            self.withRenderingMode(.alwaysTemplate).draw(in: CGRect(origin: .zero, size: size))
        }
        return renderedImage
    }
}
