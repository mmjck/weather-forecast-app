//
//  HourlyFiorecastCollectionViewCell.swift
//  Weather Forecast App
//
//  Created by Jackson Matheus on 01/11/23.
//

import UIKit

class HourlyFiorecastCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HourlyFiorecastCollectionViewCell"
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourLabel,
                                                       iconImageView ,
                                                       temperatureLabel
                                                      ])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8,
                                                                     leading: 8,
                                                                     bottom: 8,
                                                                     trailing: 8)
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 20
        stackView.layer.borderColor = UIColor.contrastColor?.cgColor
        return stackView
    }()
    
    
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.text = "13:00"
        label.textAlignment = .center
        label.textColor = UIColor.contrastColor
        return label
    }()
    
    
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "13 *C"
        label.textAlignment = .center
        label.textColor = UIColor.contrastColor
        return label
    }()
    
    
    
    private lazy var iconImageView : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sunIcon")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupView(){
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        self.contentView.addSubview(stackView)
    }
    
    private func setConstraints(){
        stackView.setConstraintsToParent(contentView)        
        NSLayoutConstraint.activate([
           iconImageView.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
}
