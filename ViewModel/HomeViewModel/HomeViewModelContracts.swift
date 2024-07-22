//
//  HomeViewModelContracts.swift
//  movies
//
//  Created by Muhammed Safa Ozdemir on 21.07.2024.
//

import Foundation

protocol HomeViewModelProtocol{
    var delegate: HomeViewModelDelegate { get set }
    func load()
}

enum HomeViewModelOutputs{
    case popular([MovieResult])
    case upComing([MovieResult])
    case topRated([MovieResult])
    case error(Error)
}

protocol HomeViewModelDelegate{
    func handleOutput(_ output: HomeViewModelOutputs)
}
