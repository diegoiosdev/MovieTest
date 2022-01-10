//
//  MovieScreenViewController.swift
//  MovieTest
//
//  Created by Diego Fernando on 09/01/22.
//

import UIKit
import RxSwift
import RxCocoa

class MovieScreenViewController: UIViewController {
    
    // MARK: - Properties
    
    
    private var tableView = UITableView()
    
    var viewModel: MovieTestViewModelProtocol?
    private var imageDetails: MovieDetailsModel?
    private var imageSimilar: MovieSimilarModel?
    private let disposed = DisposeBag()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        bindUI()
        bindConstraints()
        registerCells()
        viewModel?.getMovie(with: 180)
    }
    
    // MARK: - Private Functions
    
    private func bindConstraints() {
     
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func registerCells() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ImageCell.self, forCellReuseIdentifier: "ImageCell")
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: "DescriptionCell")
    }
    
    private func bindUI() {
        
        viewModel?.movieDetails.asObservable().skip(1).subscribe(onNext: { [weak self] result in
            
            guard let strongSelf = self else { return }
            
            strongSelf.imageDetails = result
            strongSelf.tableView.reloadData()
        }).disposed(by: disposed)
        
        viewModel?.movieSimilar.asObservable().skip(1).subscribe(onNext: { [weak self] result in
            
            guard let strongSelf = self else { return }
            
            strongSelf.imageSimilar = result
            strongSelf.tableView.reloadData()
        }).disposed(by: disposed)
    }
    
}

// MARK: - DataSource - Delegate

extension MovieScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            
            guard let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as? ImageCell else {
                return defaultCell
            }
            
            imageCell.viewModel = viewModel
            imageCell.setupUI(imagePath: imageDetails?.backdropPath)
            return imageCell
        case 1:
            
            guard let descriptionCell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell") as? DescriptionCell else {
                return defaultCell
            }
            
            descriptionCell.setupUI(imagePath: "", likesText: imageDetails?.voteCount)
            return descriptionCell
        case 2:
            break
        default:
            return defaultCell
        }
        
        return defaultCell
    }
}
