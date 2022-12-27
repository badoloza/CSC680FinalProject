//
//  UpcomingMovieDetailsViewController.swift
//  CSC680FinalProjectMoviesApp
//
//  Created by e on 12/26/22.
//

import UIKit

class UpcomingMovieDetailsViewController: UIViewController {
    @IBOutlet weak var imageLabel: UIImageView!
    
    @IBOutlet weak var backdropLabel: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movieTitle: String!
    var movieOverview: String!
    var moviePosterPath: URL!
    var movieBackDropPath: URL!
    
    override func viewDidLoad() {
        // changing name of back button
        let backButton = UIBarButtonItem()
        backButton.title = "Upcoming Movies"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        super.viewDidLoad()
        
        setUpOutlets()
    }
    
    func setUpOutlets(){
        titleLabel.text = movieTitle
        overviewLabel.text = movieOverview
        imageLabel.af.setImage(withURL: moviePosterPath)
        backdropLabel.af.setImage(withURL: movieBackDropPath)
    }
}
