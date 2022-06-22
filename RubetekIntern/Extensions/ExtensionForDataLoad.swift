//
//  ExtensionForDataLoad.swift
//  RubetekIntern
//
//  Created by mac on 22.06.2022.
//

import Foundation
import UIKit
extension ViewController{
    
    func doorsLoad(){
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
                else {
                    DispatchQueue.main.async {
                        self.alertError(title: "Ошибка", message: "Сервер временно недоступен. Проверьте подключение к сети.")
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
    
    func camerasLoad(){
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
                else{
                    DispatchQueue.main.async {
                        self.alertError(title: "Ошибка", message: "Сервер временно недоступен. Проверьте подключение к сети.")
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
