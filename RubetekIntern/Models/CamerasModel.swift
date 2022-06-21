//
//  CamerasModel.swift
//  RubetekIntern
//
//  Created by mac on 21.06.2022.
//

import Foundation
import FileProvider
import RealmSwift




class DataCameras: Object, Decodable  {
    dynamic var room = List<String>()
    var cameras = List<CamerasLast>()
}

class CamerasLast: Object, Decodable  {
    @objc dynamic var name: String = ""
    @objc dynamic var snapshot: String = ""
    var room: String?
    @objc dynamic var id: Int = 0
    @objc dynamic var favorites: Bool = false
    @objc dynamic var rec: Bool = false
}

class Cameras: Object, Decodable {

    @objc dynamic var success: Bool = false
    @objc dynamic var data: DataCameras? = nil

    func JSONLoad(URL: URL, completion: @escaping (Cameras?) -> Void)
    {
        var cameras: Cameras?
        URLSession.shared.dataTask(with: URL) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                cameras = try JSONDecoder().decode(Cameras.self, from: data)
            } catch  {
                print(error)
                cameras = nil
            }
            completion(cameras)
            }.resume()
    }

}




