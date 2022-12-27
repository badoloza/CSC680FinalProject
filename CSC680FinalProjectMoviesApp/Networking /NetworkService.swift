//
//  NetworkService.swift
//  CSC680FinalProjectMoviesApp
//
//  Created by e on 12/24/22.
//

import Foundation

// network service struct that will make http requests
struct NetworkService {
    var session: URLSession = URLSession.shared
    static let sharedNetworkService = NetworkService()
    
    // function takes any object for closure, just need to specify the type of object
    // makes function reusable for any request
    func getJson<T: Decodable>(movie_url: String, onCompletion: @escaping (T?) -> ()) {
        print("hello")
        // making sure url is good to go
        guard let url_string = URL(string: movie_url ) else {
            return
        }
        print("----------")
        print(url_string)
        // now we need to make the request
        let request = URLRequest(url: url_string)
        print("----------")
        print(request)
        // now we need to start the networking task
        // we either get the data, http response error, or another error
        let task = session.dataTask(with: request) {(data, response, error) in
            // going to check for error
            if let error = error {
                print(error.localizedDescription)
        }
            if let response = response {
                print("response error")
            }
            
            // checking if we have data
            guard let data = data else {
                print("no data")
                onCompletion(nil)
                return
            }
            
            // if we get here, we do have data
            // once we have json data, we have to decode it
            let decoder = JSONDecoder()
            // now going to decode the json data we received
            // using DispatchQueue so i dont block main threah
            DispatchQueue.main.async {
                print(data)
                guard let decodedJSON = try? decoder.decode(T?.self, from: data) else {
                    print("error in decoded json")
                    return
                }
                onCompletion(decodedJSON)
            }
            
            // printing the decoded json
            // print(decodedJSON)
            
            // after getting the results we want, i want to create movie objects with
            // all information
            // lets iterate thru our json results
            
//            print("--------------------------------")
//            for result in decodedJSON.results {
//                // creating movie object for each movie with all info
//                Movie(backdropPath: result.backdropPath, overview: result.overview, posterPath: result.posterPath, title: result.title, id: result.id)
//                // now we want to append this info in our movie model array
//                print("----------------------------")
//                print(result.title)
//
//                // i want to append these movie objects in an array
//                // and access info that way
//                titleArray.append(result.title)
//            }
            
        }
        
        task.resume()

    }
}
