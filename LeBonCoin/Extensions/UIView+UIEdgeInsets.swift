//
//  UIView+UIEdgeInsets.swift
//  LeBonCoin
//
//  Created by Zakaria El Moutassim on 16/02/2023.
//

import UIKit

public extension UIEdgeInsets {
    init(all inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }

    static func only(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
}

