//
//  NetworkConstants.swift
//  movies
//
//  Created by Muhammed Safa Ozdemir on 21.07.2024.
//

import Foundation

protocol EndPoinProtocol {
    var baseUrl: String {get}
    var genreUrl: String {get}
    var apiKey: String {get}
    
    func movieUrl() -> String
    func request() -> URLRequest
}

enum EndPoint{
    case popular
    case topRated
    case upComing
}

extension EndPoint: EndPoinProtocol{
    
    var baseUrl: String {
        return "https://api.themoviedb.org/3/movie/"
    }
    
    var genreUrl: String {
        switch self{
        case.popular:
            return "popular"
        case.topRated:
            return "top_rated"
        case.upComing:
            return "upcoming"
        }
    }
    
    var apiKey: String {
        return "?api_key="
    }
    
    func movieUrl() -> String {
        return "\(baseUrl)\(genreUrl)\(apiKey)"
    }
    
    func request() -> URLRequest {
        guard let apiUrl = URLComponents(string: movieUrl())else{
            fatalError("url!!")
        }
        
        guard let url = apiUrl.url  else{
            fatalError("url!!")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return request
    }
    
}
