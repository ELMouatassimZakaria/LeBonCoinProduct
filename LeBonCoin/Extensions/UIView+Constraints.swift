//
//  UIView+Constraints.swift
//  LeBonCoin
//
//  Created by Zakaria El Moutassim on 16/02/2023.
//

import UIKit

extension UIView {
    
    func constrain(_ constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    @discardableResult
    func constraintsForEdgesWithSafeArea(to view: UIView, insets: UIEdgeInsets = UIEdgeInsets()) -> [NSLayoutConstraint] {
           return [
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: insets.left),
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -insets.right),
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -insets.bottom)
           ]
       }
    
    @discardableResult
    func constraintsForEdges(to view: UIView, insets: UIEdgeInsets = UIEdgeInsets()) -> [NSLayoutConstraint] {
           return [
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right),
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom)
           ]
       }
    
    @discardableResult
    func constraintsForLeadingTrailingEdges(to view: UIView, insets: UIEdgeInsets = UIEdgeInsets() ) -> [NSLayoutConstraint] {
           return [
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right)
           ]
       }
    
    func constraintsForLeadingAnchor(to view: UIView, insets: UIEdgeInsets) -> [NSLayoutConstraint] {
           return [
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: insets.left)
           ]
       }
    
    func constraintsForCenter(to view: UIView) -> [NSLayoutConstraint] {
          return [
              centerXAnchor.constraint(equalTo: view.centerXAnchor),
              centerYAnchor.constraint(equalTo: view.centerYAnchor)
          ]
      }
    
    func constraintsForYCenter(to view: UIView) -> [NSLayoutConstraint] {
          return [
              centerYAnchor.constraint(equalTo: view.centerYAnchor)
          ]
      }

      func constraintsFor(width: CGFloat, height: CGFloat) -> [NSLayoutConstraint] {
          return [
              widthAnchor.constraint(equalToConstant: width),
              heightAnchor.constraint(equalToConstant: height)
          ]
      }

}
