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

    var doors = Doors()
    var cameras = Cameras()
    let realm = try! Realm()
    let control = SegmentedControl()

 
    override func viewDidLoad() {
        super.viewDidLoad()
       doorsLoad()
       camerasLoad()
        
       
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
        
        
    }

    
    private func addControl(){
       
        view.addSubview(control)
        control.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        control.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        control.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        control.update(titles: ["Камеры","Двери"])
    }
    

    
    
    
    
    private func doorsLoad(){
        if realm.objects(Doors.self).count == 0 {
        let URl = URL(string: "http://cars.cprogroup.ru/api/rubetek/doors/")!

            doors.JSONLoad(URL:URl){ result in
                self.doors = result!

            if self.doors != nil{
                DispatchQueue.main.async { [self] in
                    //title = String(self.doors.data[0].name)
                    print(self.doors.data[3].snapshot)
                                    try! self.realm.write{
                                        self.realm.add(doors)
                                    }
                    print("zякорь")
                }
            }
        }

        }
        else{
            doors = realm.objects(Doors.self)[0]
        }

        print("ВСЕГО дверей \(realm.objects(Doors.self).count)")
        print("всего дверей\(doors.data.count)")
        print("конец дверей")
    }
    
    private func camerasLoad(){
        if realm.objects(Cameras.self).count == 0 {
        let URl = URL(string: "http://cars.cprogroup.ru/api/rubetek/cameras/")!

            cameras.JSONLoad(URL:URl){ result in
                self.cameras = result!

            if self.cameras != nil{
                DispatchQueue.main.async { [self] in
                    //title = String(self.cameras.success)
                    print(self.cameras.data?.cameras[0].name)
                                    try! self.realm.write{
                                        self.realm.add(cameras)
                                    }
                    print("zякорь")
                }
            }
        }

        }
        else{
            cameras = realm.objects(Cameras.self)[0]
            
        }

        print("ВСЕГО \(realm.objects(Cameras.self).count)")
       //print("всего \(cameras.data?.cameras[0].name)")
        print("конец")
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ExCell
        //cell?.update(by: <#T##DataDoors#>)
        return cell!
    }
    
    
    
}



