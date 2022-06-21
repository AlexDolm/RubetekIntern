//
//  ExCell.swift
//  RubetekIntern
//
//  Created by mac on 21.06.2022.
//

import Foundation
import UIKit
class ExCell: UICollectionViewCell {
    
    let label = UILabel()
    let image = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(by model: DataDoors){
        label.text = model.name
       // image.image = model.snapshot
        
    }
    func setUp(){
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        
        image.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(image)
    
        label.translatesAutoresizingMaskIntoConstraints = false
       
        
        let contaner = UIView()
        contaner.addSubview(label)
        label.topAnchor.constraint(equalTo: contaner.topAnchor, constant: 10).isActive = true
        label.bottomAnchor.constraint(equalTo: contaner.bottomAnchor, constant: -10).isActive = true
        label.leadingAnchor.constraint(equalTo: contaner.leadingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: contaner.trailingAnchor, constant: -10).isActive = true
        stackView.addArrangedSubview(contaner)
        
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
    }
}
