//
//  CamerasModel.swift
//  RubetekIntern
//
//  Created by mac on 21.06.2022.
//

import Foundation
import FileProvider
import RealmSwift

class Cameras: Object, Decodable {

    @objc dynamic var success: Bool = false
    @objc dynamic var data: DataCameras? = nil

}

class DataCameras: Object, Decodable  {
    //@objc dynamic var room: [String] = []
    dynamic var room = List<String>()
    var cameras = List<CamerasLast>()
}

class CamerasLast: Object, Decodable  {
    @objc dynamic var name: String = ""
    @objc dynamic var snapshot: String = ""
    @objc dynamic var room: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var favorites: Bool = false
    @objc dynamic var rec: Bool = false
}


