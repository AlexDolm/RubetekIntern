//
//  ViewController.swift
//  RubetekIntern
//
//  Created by mac on 20.06.2022.
//

import UIKit
import RealmSwift
import SwiftUI
class ViewController: UIViewController {
    
    
    var doors2:[DataDoors]? = []
    var cameras:[CamerasLast]? = []
    let control = SegmentedControl()
    

 
    override func viewDidLoad() {
        super.viewDidLoad()
    
        DataDoors.ParseJSON(completion: { [self] result in
            doors2 = result
            print("последний вывод дверей")
            print(doors2)
        })
        
        
        CamerasLast.ParseJSON(completion: { [self] result in
            cameras = result
            print("последний вывод камеры")
            print(cameras)
        })

        
        
        addControl()
        addCollection()
        
        self.view.backgroundColor = .white
        title = "Мой дом"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    
    
    
    


    private func addCollection(){
        let layout = UICollectionViewLayout()
        let collection = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.register(ExCell.self, forCellWithReuseIdentifier: "cell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collection)
        collection.topAnchor.constraint(equalTo: control.bottomAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collection.backgroundColor = .red
        
    }

    
    private func addControl(){
       
        view.addSubview(control)
        control.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        control.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        control.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        control.update(titles: ["Камеры","Двери"])
    }
}





