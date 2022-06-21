//
//  ViewController.swift
//  RubetekIntern
//
//  Created by mac on 20.06.2022.
//

import UIKit
import RealmSwift
class ViewController: UIViewController {

    var doors = Doors()
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        doorsLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        let control = SegmentedControl()
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
                    title = String(self.doors.data[0].name)
                    print(self.doors.data[3].snapshot)
                                    try! self.realm.write{
                                        self.realm.add(doors)
                                    }
                }
            }
        }
        
        }
        else{
            doors = realm.objects(Doors.self)[0]
        }
        
        print("ВСЕГО \(realm.objects(Doors.self).count)")
        print("всего \(doors.data[0].name)")
        print("конец")
    }
    
    
    

}

