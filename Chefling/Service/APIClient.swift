//
//  APIClient.swift
//  Chefling
//
//  Created by Akhila Haridas on 14/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import RxSwift
import Alamofire

class APIClient {
    
    static let sharedInstance = APIClient()
    
    func getResponse() -> Observable<Response> {
        return Observable.create { observer -> Disposable in
            
            AF.request("https://phptest101.herokuapp.com/index.php")
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            // if no error provided by alamofire return .notFound error instead.
                            // .notFound should never happen here?
                           // observer.onError(response.error ?? GetFriendsFailureReason.notFound)
                            return
                        }
                        do {
                            let responseJson = try JSONDecoder().decode(Response.self, from: data)
                            observer.onNext(responseJson)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode
                           // let reason = GetFriendsFailureReason(rawValue: statusCode)
                        {
                            observer.onError(error)
                        }
                        observer.onError(error)
                    }
            }
            
            return Disposables.create()
        }
    }
}
