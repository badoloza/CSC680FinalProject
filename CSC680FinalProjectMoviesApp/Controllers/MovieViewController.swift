//
//  MovieViewController.swift
//  CSC680FinalProjectMoviesApp
//
//  Created by e on 12/25/22.
//

import UIKit
import AlamofireImage

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var movieArray: [Movie] = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        NetworkService.sharedNetworkService.getJson(movie_url: API.now_playing.absoluteString) {(result: MovieModel?) in
            if let results = result {
                for res in results.results {
                    let movies = Movie(backdropPath: res.backdropPath, overview: res.overview, posterPath: res.posterPath, title: res.title, id: res.id)
                    self.movieArray.append(movies)
                    self.tableView.reloadData()
                }
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieViewControllerCell") as! MovieViewControllerCell
        let movie = movieArray[indexPath.row]
        let movieTitle = movie.title
        let movieOverview = movie.overview
        let moviePosterPath = movie.posterPath
        let posterUrl = URL(string: "https://image.tmdb.org/t/p/w185\(moviePosterPath)")!
        cell.titleLabel.text = movieTitle
        cell.overviewLabel.text = movieOverview
        cell.imageLabel.af.setImage(withURL: posterUrl)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        
        let movie = movieArray[indexPath!.row]
        
        // passing the info of selected cell to our movie details view controller
        let movieDetailsViewcontroller = segue.destination as! MovieDetailsViewController
        movieDetailsViewcontroller.movieTitle = movie.title
        movieDetailsViewcontroller.overviewTitle = movie.overview
        let moviePosterPath = movie.posterPath
        let posterUrl = URL(string: "https://image.tmdb.org/t/p/w185\(moviePosterPath)")!
        movieDetailsViewcontroller.posterPath = posterUrl
        let backdropPath = movie.backdropPath
        let backdropPathUrl = URL(string: "https://image.tmdb.org/t/p/w185\(backdropPath)")!
        movieDetailsViewcontroller.backdropPath = backdropPathUrl
        
    }
    
}
