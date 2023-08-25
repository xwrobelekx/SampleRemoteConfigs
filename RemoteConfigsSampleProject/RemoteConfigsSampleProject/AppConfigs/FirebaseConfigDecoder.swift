//
//  FirebaseConfigDecoder.swift
//  RemoteConfigsSampleProject
//
//  Created by Kamil Wrobel on 8/25/23.
//

import FirebaseRemoteConfig
import Foundation

struct FirebaseConfigDecoder: AppConfigDecoder {
    let remoteConfig: RemoteConfig
    let source: RemoteConfigSource
    
    func container<Key>(keyedBy type: Key.Type) -> any AppConfigKeyedContainer<Key> where Key : CodingKey {
        FirebaseConfigKeyContainer(remoteConfig: remoteConfig,
                                 source: source,
                                 keyedBy: type)
    }
}

struct FirebaseConfigKeyContainer<Key> where Key: CodingKey {
    private let remoteConfig: RemoteConfig
    private let source: RemoteConfigSource
    
    fileprivate init(remoteConfig: RemoteConfig,
                    source: RemoteConfigSource,
                    keyedBy type: Key.Type) {
        self.remoteConfig = remoteConfig
        self.source = source
    }
}

extension FirebaseConfigKeyContainer: AppConfigKeyedContainer {
    
    struct Error: Swift.Error, CustomStringConvertible {
        let reason: Reason
        let key: Key
        
        enum Reason: String {
            case keyNotFound
            case decodingFailure
        }
        
        var description: String {
            "reason: \(reason.rawValue), key: \(key.stringValue)"
        }
    }
    
    func decodeBool(forKey key: Key) throws -> Bool {
        guard containsKey(key) else {
            throw Error(reason: .keyNotFound, key: key)
        }
        
        return remoteConfig.configValue(forKey: key.stringValue, source: source).boolValue
    }
}

private extension FirebaseConfigKeyContainer {
    func containsKey(_ key: Key) -> Bool {
        remoteConfig.allKeys(from: source).contains(where: { $0 == key.stringValue })
    }
}
