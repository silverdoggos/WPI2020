//
//  NetworkManager.swift
//  WPI2020
//
//  Created by Artem Shishkin on 22.04.2021.
//

import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()
        private let url = "http://89.175.186.76:5000"
//    private let url = "http://127.0.0.1:5000/"
    
    func getRoom(with image: UIImage, completion: @escaping (Result<[String: Bool], Error>) -> Void) {
        
        if let data = image.jpegData(compressionQuality: 1) {
            let filename = getDocumentsDirectory().appendingPathComponent("image.jpg")
            try? data.write(to: filename)
            
//            let fileName = "image.jpg"
            AF.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(data, withName: "target", fileName: filename.absoluteString, mimeType: "image/jpg")
            }, to: url, method: .post)
            .response { response in
                do {
                    switch response.result {
                    case let .success(data):
                        print(response.request?.httpBody)
                        if let dictionaries = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Bool] {
                            completion(.success(dictionaries))
                            return
                        }
                        completion(.failure(LocationError.init(text: "error with parser")))
                        
                    case let .failure(error):
                        print(response.request?.httpBody)
                        completion(.failure(error))
                    }
                } catch {
                    completion(.failure(LocationError.init(text: "error")))
                }
            }
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
