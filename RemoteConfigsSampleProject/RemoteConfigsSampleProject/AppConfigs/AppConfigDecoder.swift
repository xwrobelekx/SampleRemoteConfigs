//
//  AppConfigDecoder.swift
//  RemoteConfigsSampleProject
//
//  Created by Kamil Wrobel on 8/25/23.
//

import Foundation

protocol AppConfigDecoder {
    func container<Key>(keyedBy type: Key.Type) -> any AppConfigKeyedContainer<Key> where Key: CodingKey
}

protocol AppConfigKeyedContainer<Key> {
    associatedtype Key: CodingKey
    
    func decodeBool(forKey: Key) throws -> Bool
}
