//
//  SegmentedControl.swift
// RubetekIntern
//  Created by mac on 20.06.2022.
//

import Foundation
import UIKit

class SegmentedControl: UIView {
    let stack = UIStackView()
    private var items = [Item]()
    
    public func update(titles: [String]){

        for view in stack.arrangedSubviews{
            view.removeFromSuperview()
        }
        items = []
        for title in titles {
            
            //stack.addArrangedSubview(createItem(title: title).view)
            let item = createItem(title: title)
            stack.addArrangedSubview(item.view)
            items.append(item)
        }
        
        items.first?.line.backgroundColor = .blue
  
    }
    init()
    {
        
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private struct Item{
        let view: UIView
        let line: UIView
    }
    private func setUp() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stack)
        //stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 4.0).isActive = true
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        

    }
    
    private func createItem(title: String)-> (Item){
        let viewBackground = UIView()
        viewBackground.backgroundColor = .clear
        viewBackground.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        viewBackground.addGestureRecognizer(tap)
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        viewBackground.addSubview(label)
        label.centerYAnchor.constraint(equalTo: viewBackground.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: viewBackground.centerXAnchor).isActive = true
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        viewBackground.addSubview(line)
        line.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor).isActive = true
        line.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor).isActive = true
        line.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        return Item(view: viewBackground, line: line)
    }
    
    @objc func onTap(gestureRecognizer: UITapGestureRecognizer ){
       
        for item in items{
            if gestureRecognizer.view == item.view{
                item.line.backgroundColor = .blue
            }
            else {
                item.line.backgroundColor = .clear
            }
        }
        
        
        
    }
    
    private func select(){
        
    }
    
    
}


