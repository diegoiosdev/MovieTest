//
//  API.swift
//  MovieTest
//
//  Created by Diego Fernando on 08/01/22.
//

import Foundation
import Alamofire

protocol APIProtocol {
    func getMovieDetails(with movieId: Int, completion: @escaping (_ response: MovieDetailsModel?) -> Void)
    func getMovieSimilar(with movieId: Int, completion: @escaping (_ response: MovieSimilarModel?) -> Void)
    func getImage(imagePath: String?, completion: @escaping (Data?) -> Void)
}

class API: APIProtocol {
    
    // MARK: - Properties
    
    private let apiKey = "63f10dfc04e6be54efa73d31ab0343bf"
    private let baseURL = "https://api.themoviedb.org/3"
    private let baseImageURL = "https://image.tmdb.org/t/p/w500"
    
    // MARK: - Functions
    
    func getMovieDetails(with movieId: Int, completion: @escaping (_ response: MovieDetailsModel?) -> Void) {
        
        guard let url = URL(string: "\(baseURL)/movie/\(movieId)?api_key=\(apiKey)") else { return }
        
        AF.request(url, method: .get, requestModifier: { $0.timeoutInterval = 10 }).responseJSON { response in
            
            switch response.result {
            case .success:
                
                guard let statusCode = response.response?.statusCode else {
                    completion(nil)
                    return
                }
                
                if statusCode != 200 && statusCode != 201 && statusCode != 204 {
                    completion(nil)
                    return
                }
                
                do {
                
                    guard let data = response.data else {
                        completion(nil)
                        return
                    }
                    
                    let response = try JSONDecoder().decode(MovieDetailsModel.self, from: data)
                    completion(response)
                } catch let error {
                    print("Ocorreu um erro: \(error.localizedDescription)")
                }
                
            case .failure(let error):
                completion(nil)
                print("Ocorreu um erro: \(error.localizedDescription)")
            }
        }
    }
    
    func getMovieSimilar(with movieId: Int, completion: @escaping (_ response: MovieSimilarModel?) -> Void) {
        
        guard let url = URL(string: "\(baseURL)/movie/\(movieId)/similar?api_key=\(apiKey)&page=1") else { return }
        
        AF.request(url, method: .get, requestModifier: { $0.timeoutInterval = 10 }).responseJSON { response in
            
            switch response.result {
            case .success:
                
                guard let statusCode = response.response?.statusCode else {
                    completion(nil)
                    return
                }
                
                if statusCode != 200 && statusCode != 201 && statusCode != 204 {
                    completion(nil)
                    return
                }
                
                do {
                
                    guard let data = response.data else {
                        completion(nil)
                        return
                    }
                    
                    let response = try JSONDecoder().decode(MovieSimilarModel.self, from: data)
                    completion(response)
                } catch let error {
                    print("Ocorreu um erro: \(error.localizedDescription)")
                }
                
            case .failure(let error):
                completion(nil)
                print("Ocorreu um erro: \(error.localizedDescription)")
            }
        }
    }
    
    func getImage(imagePath: String?, completion: @escaping (Data?) -> Void) {
        
        guard let imagePath = imagePath,
              let url = URL(string: "\(baseImageURL)\(imagePath)") else { return }
        
        AF.request(url, method: .get).responseData { data in
            
            guard let data = data.data else { return }
            completion(data)
        }
    }
}
