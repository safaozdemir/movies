//
//  ViewController.swift
//  movies
//
//  Created by Muhammed Safa Ozdemir on 14.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var homeViewModel: HomeViewModel?
    var categories = ["Popular", "Up Coming", "Top Rated"]
    var popularArr = [MovieResult]()
    var upComingArr = [MovieResult]()
    var topRatedArr = [MovieResult]()
    
    override func viewDidLoad() {
            super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let networkService = Network()
        homeViewModel = HomeViewModel(service: networkService, delegate: self)
        homeViewModel?.delegate = self
        homeViewModel?.load()
        
        tableView.rowHeight = 150.0
        }
        
}

extension ViewController: HomeViewModelDelegate{
    func handleOutput(_ output: HomeViewModelOutputs) {
        switch output {
        case .popular(let arrayPopular):
            self.popularArr = arrayPopular
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print(arrayPopular)
        case .upComing(let arrayUpComing):
            self.upComingArr = arrayUpComing
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .topRated(let arrayTopRated):
            self.topRatedArr = arrayTopRated
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .error(let error):
            print(error)
        }
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! tableViewCell
        switch indexPath.section {
                case 0:
                    cell.movies = popularArr
                case 1:
                    cell.movies = upComingArr
                case 2:
                    cell.movies = topRatedArr
                default:
                    break
                }
                
                cell.collectionView.reloadData()
        return cell
    }
}
