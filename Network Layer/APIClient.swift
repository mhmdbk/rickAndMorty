//
//  APIClient.swift
//  rickAndMorty
//
//  Created by Mohamad on 12/8/19.
//  Copyright © 2019 Mohamad barek. All rights reserved.
//

import Foundation
import Moya
class APIClient : NSObject {
    static let shared = APIClient()
    let provider = MoyaProvider<AppNetworkService>()
    
func getCharacters(withCompletionHandler completionHandler: @escaping (Result<Characters,Error>) -> ()) {
    provider.request(.getCharacters) { result in
        switch result {
        case let .success(moyaResponnse):
            let characters = try! JSONDecoder().decode(Characters.self, from: moyaResponnse.data)
            completionHandler(.success(characters))
            
        case .failure(let error):
            completionHandler(.failure(error))
            
        }
    }
}
}
