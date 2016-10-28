//
//  APIHelper.swift
//  AC3.2-Unit3MidunitAssessment
//
//  Created by Tom Seymour on 10/28/16.
//  Copyright © 2016 C4Q-3.2. All rights reserved.
//

import Foundation

class APIHelper {
    
    static let manager = APIHelper()
    private init() {}
    
    let searchWord = "banana"
    
    let endPoint = "https://api.spotify.com/v1/search?q=man&type=album&limit=50"
    
    func getData(endPoint: String, callback: @escaping (Data?)->Void) {
        guard let myURL = URL(string: endPoint) else { return }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: myURL) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Encountered error durring session:   \(error)")
            }
            guard let validData = data else { return }
            callback(validData)
            }.resume()
    }
    
    func downloadImage(urlString: String, callback: @escaping (Data) -> () ) {
        guard let imageURL = URL(string: urlString) else { return }
        let session = URLSession.shared
        session.dataTask(with: imageURL) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Error encountered!: \(error!)")
            }
            guard let imageData = data else { return }
            callback(imageData)
            
            }.resume()
    }
    
}

