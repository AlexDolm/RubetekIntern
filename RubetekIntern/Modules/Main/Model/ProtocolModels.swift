//
//  ProtocolModels.swift
//  RubetekIntern
//
//  Created by mac on 22.06.2022.
//

import Foundation

protocol Network{
    static func JSONLoad<T: Equatable>(URL: URL, type: T.Type, completion: @escaping (T?) -> Void)
    static func URLReturn() -> String
}
