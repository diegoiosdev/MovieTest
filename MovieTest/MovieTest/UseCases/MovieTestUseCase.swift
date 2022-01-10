//
//  MovieTestUseCase.swift
//  MovieTest
//
//  Created by Diego Fernando on 08/01/22.
//

import Foundation

protocol MovieTestUseCaseProtocol {
    func getMovieDetailsAndSimilar(_ movieId: Int, completion: @escaping (_ details: MovieDetailsModel?, _ similar: MovieSimilarModel?) -> Void)
    
}

class MovieTestUseCase: MovieTestUseCaseProtocol {
    
    // MARK: - Properties
    
    private var api: APIProtocol
    
    // MARK: - Initializer
    
    init(with api: APIProtocol) {
        self.api = api
    }
    
    // MARK: - Functions
    
    func getMovieDetailsAndSimilar(_ movieId: Int, completion: @escaping (_ details: MovieDetailsModel?, _ similar: MovieSimilarModel?) -> Void) {
        
        api.getMovieDetails(with: movieId) { [weak self] details in
            
            guard let strongSelf = self else { return }
            
            strongSelf.api.getMovieSimilar(with: movieId) { similar in
                
                completion(details, similar)
            }
        }
    }
    
    func getImage(with imagePath: String?, completion: @escaping (Data?) -> Void) {
        
        api.getImage(imagePath: imagePath, completion: completion)
    }
}
