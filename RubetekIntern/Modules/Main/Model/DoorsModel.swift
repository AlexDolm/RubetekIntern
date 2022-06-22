//
//  DoorsModel.swift
//  RubetekIntern
//
//  Created by mac on 20.06.2022.
//

import Foundation
import FileProvider
import RealmSwift


class DataDoors: Object, Decodable  {
    @objc dynamic var name: String = ""
    @objc dynamic var room: String? = nil
    @objc dynamic var snapshot: String? = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var favorites: Bool = false
    
    
}
class Doors: Object, Decodable, Network {
    
    static let url = "http://cars.cprogroup.ru/api/rubetek/doors/"
    @objc dynamic var success: Bool = false
    var data = List<DataDoors>()
    
    
    func JSONLoad(URL: URL, completion: @escaping (Doors?) -> Void)
    {
        var doors: Doors?
        URLSession.shared.dataTask(with: URL) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                doors = try JSONDecoder().decode(Doors.self, from: data)
            } catch  {
                print(error)
                doors = nil
            }
            completion(doors)
            }.resume()
    }
    
    func URLReturn() -> String{
        return Doors.url
    }
    
    func ParseJSON(){
        let network = NetworkService()
        let realm = try! Realm()
        var object: Doors?
        let doors = Doors()
        
        if realm.objects(Doors.self).count == 0 {
            
            network.doorsLoad(url: URLReturn()) { object in
                if object != nil{
                    DispatchQueue.main.async { [self] in
                    try! realm.write{
                        realm.add(object!)
                            }
                        }
                }
                else {
                                DispatchQueue.main.async {
            //                        alertError(title: "Ошибка", message: "Сервер временно недоступен. Проверьте подключение к сети.")
                                }
                            }
            }     
                    
        }
        else{
            object = realm.objects(Doors.self)[0]

        }
        
    }
    
    
    
    
    
    

}


