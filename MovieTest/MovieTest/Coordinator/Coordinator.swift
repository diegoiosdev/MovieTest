//
//  Coordinator.swift
//  MovieTest
//
//  Created by Diego Fernando on 08/01/22.
//

import UIKit

public class Coordinator {
    
    // MARK: - Properties
    
    weak private var currentNavigationController: UINavigationController!
    
    // MARK: - Initializer
    
    public init() {}
    
    //MARK: - Functions
    
    @discardableResult
    public func start(navigationController: UINavigationController) -> UINavigationController {
        
        let api = API()
        let useCase = MovieTestUseCase(with: api)
        
        let viewController = MovieScreenViewController()
        viewController.viewModel = MovieTestViewModel(with: useCase)
        
        currentNavigationController = navigationController
        currentNavigationController.pushViewController(viewController, animated: true)
        
        return currentNavigationController
    }
}
