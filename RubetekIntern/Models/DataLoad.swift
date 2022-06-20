//
//  DataLoad.swift
// RubetekIntern
//  Created by mac on 08.06.2022.
//
import UIKit
import RealmSwift

class DataLoad{
   
    
    
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
    


