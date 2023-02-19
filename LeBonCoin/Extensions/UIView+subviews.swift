//
//  UIView+subviews.swift
//  LeBonCoin
//
//  Created by Zakaria El Moutassim on 17/02/2023.
//

import UIKit

extension UIView {
    public func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}
