//
//  ProductViewCell.swift
//  LeBonCoin
//
//  Created by Zakaria El Moutassim on 14/02/2023.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        String(describing: Self.self)
    }
}

public class ProductViewCell: UITableViewCell {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    lazy var productImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var titleProduct: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var isUrgentLabel: UILabel = {
        let label = UILabel()
        label.text = isUrgent
        label.textColor = .white
        label.backgroundColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.isHidden = true
        return label
    }()
    
    lazy var priceProdcut: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    lazy var categoryProduct: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        containerView.addSubviews(titleProduct, priceProdcut, categoryProduct)
        productImageView.addSubview(isUrgentLabel)
        contentView.addSubviews(containerView, productImageView)
        setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        // ImageView Constraint
        let imageWidthHeightConstraint = productImageView.constraintsFor(width: 100, height: 80)
        let imageCenterYConstraint = productImageView.constraintsForYCenter(to: containerView)
        let imageLeadingConstraint = productImageView.constraintsForLeadingAnchor(to: contentView, insets: .only(left: 10))
        productImageView.constrain(imageWidthHeightConstraint + imageCenterYConstraint + imageLeadingConstraint)
        
        // isUrgentProdcut Constraint
        let isUrgentLeadingConstraint = isUrgentLabel.constraintsForLeadingAnchor(to: productImageView, insets: .only(left: 0))
        isUrgentLabel.constrain(isUrgentLeadingConstraint)
        
        //ContainerView Constaint
        let containerViewConstraint = [
            containerView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant:10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:-10),
            containerView.heightAnchor.constraint(equalToConstant: 95)
        ]
        containerView.constrain(containerViewConstraint)
        
        // TitleProdcut Constraint
        let titleProductConstraint = [
            titleProduct.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            titleProduct.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleProduct.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40)
        ]
        titleProduct.constrain(titleProductConstraint)
        
        //CategoryProduct Constraint
        let categoryProductConstraint = [
            categoryProduct.topAnchor.constraint(equalTo: titleProduct.bottomAnchor, constant: 10),
            categoryProduct.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        ]
        categoryProduct.constrain(categoryProductConstraint)
        
        // PriceProdcut Constraint
        let priceProdcutConstraint = [
            priceProdcut.topAnchor.constraint(equalTo: categoryProduct.bottomAnchor, constant: 10),
            priceProdcut.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            priceProdcut.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            priceProdcut.heightAnchor.constraint(equalToConstant: 11)
        ]
        priceProdcut.constrain(priceProdcutConstraint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(product: Product, categoryPdt: String) {
        priceProdcut.text = "\(product.price) €‎"
        categoryProduct.text = categoryPdt
        titleProduct.text = product.title
        isUrgentLabel.isHidden = product.isUrgent ? false : true
        productImageView.loadImageWithUrl(urlString: product.imagesURL.small ?? "", PlaceHolderImage: placeHolderImage)
    }
}

