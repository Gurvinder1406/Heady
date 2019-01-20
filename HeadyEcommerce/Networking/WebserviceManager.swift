//
//  WebserviceManager.swift
//  HeadyEcommerce
//
//  Created by Gurvinder Singh  on 13/01/19.
//  Copyright © 2019 Heady. All rights reserved.
//


import UIKit

class WebserviceManager: NSObject {

    static let webserviceInstance = WebserviceManager()
    
    override init() {
        super.init()
    }

    
    func getData(urlString: String, completion: @escaping (_ isSuccess: Bool, _ reason: String ,_ data: Data?) -> Void) {
        
        if let url = URL(string: urlString) {
            let apiRequest = NSMutableURLRequest(url: url)
            apiRequest.httpMethod = "GET"
            apiRequest.setValue("gzip", forHTTPHeaderField: "Accept-Encoding")
            let getDataTask = URLSession.shared.dataTask(with: apiRequest as URLRequest)
            {
                (data, urlResponse, error) in
                
                if error != nil {
                    print("Error -> \(error!.localizedDescription)")
                    completion(false, "\(error!.localizedDescription)", nil)
                } else if data == nil {
                    print("Data not Found !")
                    completion(false, "Data not Found !", nil)
                } else if (urlResponse as? HTTPURLResponse)?.statusCode == 200 {
                    completion(true, "", data)
                } else {
                    print("Invalid Response Code !")
                    completion(false, "Invalid Response Code !", nil)
                }
            }
            getDataTask.resume()
        } else {
            completion(false, "Invalid URL", nil)
            print("Invalid URL")
        }
    }

    
}
