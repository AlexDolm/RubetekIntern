//
//  NetworkService.swift
//  RubetekIntern
//
//  Created by mac on 22.06.2022.
//

import Foundation

enum Response{
    case doors([DataDoors])
    case cameras([CamerasLast])
}

class NetworkService{
    
    func allLoad(url: String, type: String, completion: @escaping (Response?) -> Void)
    {
        if type == "DataDoors"{
            var object: [DataDoors]?
                let URl = URL(string: url)!
            DataDoors.JSONLoad(URL:URl){ result in
                    object = result
                completion(Response.doors(object!))
            }
        }
        else {
            var object: [CamerasLast]?
                let URl = URL(string: url)!
            CamerasLast.JSONLoad(URL:URl){ result in
                    object = result
                completion(Response.cameras(object!))
            }
        }
    }
    
    
    
}
