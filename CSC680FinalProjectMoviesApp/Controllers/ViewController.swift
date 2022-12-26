//
//  ViewController.swift
//  CSC680FinalProjectMoviesApp
//
//  Created by e on 12/24/22.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
     var movieArray: [Movie] = [Movie]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        print("hello")
        // Do any additional setup after loading the view.
        NetworkService.sharedNetworkService.getJson(movie_url: API.now_playing.absoluteString) { (result: MovieModel?) in
            if let results = result {
                for res in results.results {
                    print(res.title)
                    let myMovie = Movie(backdropPath: res.backdropPath, overview: res.overview, posterPath: res.posterPath, title: res.title, id: res.id)
                    self.movieArray.append(myMovie)
                    self.tableView.reloadData()
                }
                print(self.movieArray.count)
            }
        
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("movie array count: \(movieArray.count)")
        
        return movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let movie = movieArray[indexPath.row]
        let movieTitle = movie.title
        let movieOverview = movie.overview
        let poster_path = movie.posterPath
        let posterUrl = URL(string: "https://image.tmdb.org/t/p/w185\(poster_path)")!
        cell.titleLabel.text = movieTitle
        cell.overviewLabel.text = movieOverview
        // using alamofire from cocoapads for making image retrieval a lot easier
        cell.posterLabel.af.setImage(withURL: posterUrl)
//        let cell = UITableViewCell()
//        let row = indexPath.row
//        cell.textLabel?.text = movieArray[row].title
        return cell
    }


}

