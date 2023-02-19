//
//  DetailsViewController.swift
//  LeBonCoin
//
//  Created by Zakaria El Moutassim on 14/02/2023.
//

import UIKit

class DetailsViewController: ViewController {
    
    var viewModel: DetailsViewModel!
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.bounces = false
        return view
    }()
    
    lazy var scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.alignment = .fill
        return view
    }()
    
    lazy var imageProduct: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
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
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .justified
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = .black
        textView.isEditable = false
        
        return textView
    }()
    
    lazy var titleProduct: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var priceProdcut: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = .orange
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        return label
    }()
    
    lazy var categoryProduct: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    lazy var subview: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var subImageView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStackViewContainer)
        subImageView.addSubviews(imageProduct, isUrgentLabel,priceProdcut)
        subview.addSubviews(titleProduct, categoryProduct, textView)
        
        // ScrollView Constraint
        let margins = view.layoutMarginsGuide
        let scrollViewConstraint = [
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: margins.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ]
        scrollView.constrain(scrollViewConstraint)
        
        // StackView Constraint
        let stackViewConstraint = scrollStackViewContainer.constraintsForEdges(to: scrollView)
        scrollStackViewContainer.constrain(stackViewConstraint)
        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        configureContainerView()
    }
    
    private func configureContainerView() {
        [subImageView, subview].forEach { scrollStackViewContainer.addArrangedSubview($0) }
        
        //ImageProduct
        let imageDetailConstraint = imageProduct.constraintsForEdges(to: subImageView)
        imageProduct.constrain(imageDetailConstraint)
        imageProduct.widthAnchor.constraint(equalTo: subImageView.widthAnchor).isActive = true
        imageProduct.loadImageWithUrl(urlString: viewModel.imageUrl,
                                      PlaceHolderImage: placeHolderImage)
        
        //IsUrgentProdcut Constraint
        let isUrgentLeadingConstraint = isUrgentLabel.constraintsForLeadingAnchor(to: imageProduct, insets: .only(left: 0))
        isUrgentLabel.constrain(isUrgentLeadingConstraint)
        isUrgentLabel.isHidden = viewModel.isUrgent ? false : true
        
        //PriceProduct
        let priceProductConstraint = [
            priceProdcut.heightAnchor.constraint(equalToConstant:30),
            priceProdcut.trailingAnchor.constraint(equalTo:subImageView.trailingAnchor, constant:-10),
            priceProdcut.bottomAnchor.constraint(equalTo:subImageView.bottomAnchor, constant: -10)
        ]
        priceProdcut.constrain(priceProductConstraint)
        priceProdcut.text = viewModel.price
        
        // TitleProduct
        let titleProductConstraint = [
            titleProduct.topAnchor.constraint(equalTo: subview.topAnchor, constant: 10),
            titleProduct.leadingAnchor.constraint(equalTo: subview.leadingAnchor, constant: 10),
            titleProduct.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: -10)
        ]
        titleProduct.constrain(titleProductConstraint)
        titleProduct.text = viewModel.titleProduct
        
        // CategoryProduct
        let categoryProductConstraint = [
            categoryProduct.topAnchor.constraint(equalTo: self.titleProduct.bottomAnchor, constant: 10),
            categoryProduct.leadingAnchor.constraint(equalTo: self.subview.leadingAnchor, constant: 10)
        ]
        categoryProduct.constrain(categoryProductConstraint)
        categoryProduct.text = viewModel.category
        
        // DescriptionProduct
        let descProductConstraint = [
            textView.topAnchor.constraint(equalTo: self.categoryProduct.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: self.subview.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: self.subview.trailingAnchor, constant: -10),
            textView.bottomAnchor.constraint(equalTo: self.subview.bottomAnchor, constant: 10)
        ]
        textView.constrain(descProductConstraint)
        textView.text = viewModel.productDescription
    }
}

