//
//  MovieDetailsViewController.swift
//  CSC680FinalProjectMoviesApp
//
//  Created by e on 12/26/22.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var posterLabel: UIImageView!
    
    @IBOutlet weak var backdropLabel: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movieTitle: String!
    var overviewTitle: String!
    var posterPath: URL!
    var backdropPath: URL!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpOutlets()

    }
    
    func setUpOutlets() {
        titleLabel.text = movieTitle
        overviewLabel.text = overviewTitle
        posterLabel.af.setImage(withURL: posterPath)
        backdropLabel.af.setImage(withURL: backdropPath)
    }
}
