//
//  UpcomingMoviesViewController.swift
//  CSC680FinalProjectMoviesApp
//
//  Created by e on 12/26/22.
//

import UIKit
import AlamofireImage

class UpcomingMoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieArray: [Movie] = [Movie]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NetworkService.sharedNetworkService.getJson(movie_url: API.upcoming_movies.absoluteString) {(result: MovieModel?) in
            if let results = result {
                for res in results.results {
                    let movie = Movie(backdropPath: res.backdropPath, overview: res.overview, posterPath: res.posterPath, title: res.title, id: res.id)
                    self.movieArray.append(movie)
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingMoviesViewControllerCell") as! UpcomingMoviesViewControllerCell
        let movie = movieArray[indexPath.row]
        let movieTitle = movie.title
        let movieOverview = movie.overview
        let moviePosterPath = movie.posterPath
        let moviePosterPathUrl = URL(string: "https://image.tmdb.org/t/p/w185\(moviePosterPath)")!
        cell.titleLabel.text = movieTitle
        cell.overviewLabel.text = movieOverview
        cell.imageLabel.af.setImage(withURL: moviePosterPathUrl)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        
        let movie = movieArray[indexPath!.row]
        
        // passing the info of selected cell to our movie details view controller
        let upcomingMovieDetailsViewcontroller = segue.destination as! UpcomingMovieDetailsViewController
        
        upcomingMovieDetailsViewcontroller.movieTitle = movie.title
        upcomingMovieDetailsViewcontroller.movieOverview = movie.overview
        let moviePosterPath = movie.posterPath
        let posterUrl = URL(string: "https://image.tmdb.org/t/p/w185\(moviePosterPath)")!
        upcomingMovieDetailsViewcontroller.moviePosterPath = posterUrl
        let backdropPath = movie.backdropPath
        let backdropPathUrl = URL(string: "https://image.tmdb.org/t/p/w185\(backdropPath)")!
        upcomingMovieDetailsViewcontroller.movieBackDropPath = backdropPathUrl
        
    }
    
}
