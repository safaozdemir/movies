//
//  CollectionViewCell.swift
//  movies
//
//  Created by Muhammed Safa Ozdemir on 22.07.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with movie: MovieResult) {
            titleLabel.text = movie.title
    }
}
