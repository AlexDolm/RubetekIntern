//
//  DoorsModel.swift
//  RubetekIntern
//
//  Created by mac on 20.06.2022.
//

import Foundation
import FileProvider
import RealmSwift

class Doors: Object, Decodable {
    
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

}

class DataDoors: Object, Decodable  {
    @objc dynamic var name: String = ""
    @objc dynamic var room: String? = nil
    @objc dynamic var snapshot: String? = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var favorites: Bool = false
    
    
}
