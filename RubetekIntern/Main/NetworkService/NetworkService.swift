//
//  NetworkService.swift
//  RubetekIntern
//
//  Created by mac on 22.06.2022.
//

import Foundation

class NetworkService{
    
    func doorsLoad(url: String, completion: @escaping (Doors?) -> Void)
    {
        var object: Doors?
        let doors = Doors()
        
            let URl = URL(string: url)!
        
            doors.JSONLoad(URL:URl){ result in
                object = result
                completion(object)

        }
            
            
    }
    
    
}
