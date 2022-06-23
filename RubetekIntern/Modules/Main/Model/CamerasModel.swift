//
//  CamerasModel.swift
//  RubetekIntern
//
//  Created by mac on 21.06.2022.
//

import Foundation
import FileProvider
import RealmSwift






class CamerasLast: Object, Decodable  {
    @objc dynamic var name: String = ""
    @objc dynamic var snapshot: String = ""
    var room: String?
    @objc dynamic var id: Int = 0
    @objc dynamic var favorites: Bool = false
    @objc dynamic var rec: Bool = false
    
    static let url = "http://cars.cprogroup.ru/api/rubetek/cameras/"
    
    static func URLReturn() -> String{
        return CamerasLast.url
    }
    
    static func JSONLoad(URL: URL, completion: @escaping ([CamerasLast]?) -> Void)
    {
        var cameras: [CamerasLast]?
        URLSession.shared.dataTask(with: URL) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let ccameras = try? JSONDecoder().decode(Cameras.self, from: data).data?.cameras
                cameras = Array(ccameras!)
                
            } catch  {
                print(error)
                cameras = nil
            }
            completion(cameras)
            }.resume()
    }
    
    static func ParseJSON(completion: @escaping ([CamerasLast]?) -> Void){
        let network = NetworkService()
        let realm = try! Realm()
        var object: [CamerasLast]?

        if realm.objects(CamerasLast.self).count == 0 {

            network.camerasLoad(url: CamerasLast.URLReturn()) { object in
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
            completion(object)

        }
        else{
            //тут сделать чтение по строкам с for
            print("готово d \(realm.objects(CamerasLast.self).count)")
            print("готово d2 \(realm.objects(CamerasLast.self)[0])")
            print("готово d2 \(realm.objects(CamerasLast.self))")
            for camera in 0...realm.objects(CamerasLast.self).count-1 {
                object?.append(realm.objects(CamerasLast.self)[camera])
                
            }
            
            
            print("готово \(object)")
            completion(object)
        }
        
    }
    
    
    
}
class DataCameras: Decodable  {
    var cameras = List<CamerasLast>()
}

    //поменять на ненулевое
class Cameras: Decodable {
    var data: DataCameras? = nil
}





///_______________________
/// //
//  CamerasModel.swift
//  RubetekIntern
//
//  Created by mac on 21.06.2022.
//
//
//import Foundation
//import FileProvider
//import RealmSwift
//
//
//
//
//class DataCameras: Object, Decodable  {
//    dynamic var room = List<String>()
//    var cameras = List<CamerasLast>()
//}
//
//class CamerasLast: Object, Decodable  {
//    @objc dynamic var name: String = ""
//    @objc dynamic var snapshot: String = ""
//    var room: String?
//    @objc dynamic var id: Int = 0
//    @objc dynamic var favorites: Bool = false
//    @objc dynamic var rec: Bool = false
//}
//
//class Cameras: Object, Decodable {
//
//
//
//    @objc dynamic var success: Bool = false
//    @objc dynamic var data: DataCameras? = nil
//
//    func JSONLoad(URL: URL, completion: @escaping (Cameras?) -> Void)
//    {
//        var cameras: Cameras?
//        URLSession.shared.dataTask(with: URL) { data, response, error in
//            guard let data = data else {
//                return
//            }
//            do {
//                cameras = try JSONDecoder().decode(Cameras.self, from: data)
//            } catch  {
//                print(error)
//                cameras = nil
//            }
//            completion(cameras)
//            }.resume()
//    }
//
//}
//
//
//
//
//
