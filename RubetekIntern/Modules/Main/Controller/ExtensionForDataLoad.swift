//
//  ExtensionForDataLoad.swift
//  RubetekIntern
//
//  Created by mac on 22.06.2022.
//

import Foundation
import UIKit
extension ViewController{
    
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
