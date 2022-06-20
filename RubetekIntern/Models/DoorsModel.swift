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

}

class DataDoors: Object, Decodable  {
    @objc dynamic var name: String = ""
    @objc dynamic var room: String? = nil
    @objc dynamic var snapshot: String? = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var favorites: Bool = false
    
    
}
