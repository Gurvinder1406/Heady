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
    
    func getJsonArray(urlString: String, completion: @escaping (_ isSuccess: Bool, _ reason: String ,_ array: NSArray?) -> Void) {
        
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
                    do {
                        let parsedData: NSArray! = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray ?? NSArray()
                        print("Parsed Data -> \(parsedData!), count -> parsed data count -> \(parsedData.count)")
                        completion(true, "", parsedData)
                    } catch {
                        print(error)
                        completion(false, "\(error.localizedDescription)", nil)
                    }
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

    
    func getJsonObject(urlString: String, completion: @escaping (_ isSuccess: Bool, _ reason: String ,_ dictionary: NSDictionary?) -> Void) {
        
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
                    do {
                        let parsedData: NSDictionary! = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary ?? NSDictionary()
                        print("Parsed Data -> \(parsedData!)")
                        completion(true, "", parsedData)
                    } catch {
                        print(error)
                        completion(false, "\(error.localizedDescription)", nil)
                    }
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
