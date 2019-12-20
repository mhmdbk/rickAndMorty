//
//  AppNetworkService.swift
//  rickAndMorty
//
//  Created by Mohamad on 12/8/19.
//  Copyright © 2019 Mohamad barek. All rights reserved.
//

import Foundation
import Moya
public enum AppNetworkService {
    case getCharacters
}

extension AppNetworkService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://rickandmortyapi.com/api/")!
    }
    
    public var path: String {
        switch self {
        case .getCharacters:
            return "character/"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getCharacters:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getCharacters :
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        default: return nil
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
    
 }
