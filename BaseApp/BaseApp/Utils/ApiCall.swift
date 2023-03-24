//
//  ApiCall.swift
//  TmAuction
//
//  Created by Shirin on 1/25/23.
//

import Foundation
import Alamofire

class Network {
    
    class func perform<T:Decodable, Parameter: Encodable> (
        url: String,
        method: HTTPMethod = .get,
        params: Parameter,
        encoder: ParameterEncoder = URLEncodedFormParameterEncoder.default,
        headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "authorization": AccUserDefaults.token
        ],
        completionHandler: @escaping (Response<T>?)->() ){
           AF.request(url,
                      method: method,
                      parameters: params,
                      encoder: encoder,
                      headers: headers)
           .responseDecodable(of: Response<T>.self) { resp in

               debugPrint(resp)
               
            guard let value = resp.value else {
                completionHandler(nil)
                return
            }

               
            completionHandler(value)
        }
    }
    
    
    class func upload<T:Decodable>(url: String,
                                   method: HTTPMethod = .post,
                                   params: [String: String?],
                                   files: [UploadFile],
                                   headers: HTTPHeaders = [
                                       "Content-Type": "application/json",
                                       "authorization": AccUserDefaults.token
                                   ],
                                   completionHandler: @escaping (Response<T>?)->() ) {
        
        AF.upload(multipartFormData: { formData in
            print(files)
            print(params)
            
            files.forEach { file in
                formData.append(file.data ?? Data(),
                                withName: file.uploadName,
                                fileName: file.filename)
            }

            params.forEach { (key, value) in
                guard let value = value else { return }
                formData.append(value.data(using: String.Encoding.utf8)!,
                                withName: key)
            }

        }, to: url, method: method, headers: headers) {$0.timeoutInterval = 120 }

            .responseDecodable(of: Response<T>.self) { resp in
            
            debugPrint(resp)
            
            guard let value = resp.value else {
                completionHandler(nil)
                return
            }

                
            completionHandler(value)
        }
    }
}
