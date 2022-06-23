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
    static let url = "http://cars.cprogroup.ru/api/rubetek/doors/"
    
    func URLReturn() -> String{
        return DataDoors.url
    }
    
    func JSONLoad(URL: URL, completion: @escaping ([DataDoors]?) -> Void)
    {
        var doors: [DataDoors]?
        URLSession.shared.dataTask(with: URL) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let ddoors = try JSONDecoder().decode(Doors.self, from: data).data
                doors = Array(ddoors)
            } catch  {
                print(error)
                doors = nil
            }
            completion(doors)
            }.resume()
    }
    
        func ParseJSON() -> [DataDoors]?{
            let network = NetworkService()
            let realm = try! Realm()
            var object: [DataDoors]? = []
    
            if realm.objects(DataDoors.self).count == 0 {
    
                network.doorsLoad(url: URLReturn()) { object in
                    if object != nil{
                        print("готово \(object)")
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
                //тут сделать чтение по строкам с for
                print("готово d \(realm.objects(DataDoors.self).count)")
                print("готово d2 \(realm.objects(DataDoors.self)[0])")
                print("готово d2 \(realm.objects(DataDoors.self))")
                for door in 0...realm.objects(DataDoors.self).count-1 {
                    object?.append(realm.objects(DataDoors.self)[door])
                    
                }
                
                
                print("готово \(object)")
    
            }
            return object
        }

}




class Doors: Decodable {
    var data = List<DataDoors>()
}

//class Doors: Object, Decodable {
//    var data = List<DataDoors>()
//}




