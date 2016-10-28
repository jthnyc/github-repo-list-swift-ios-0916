//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    
    class func getRepositories(with completion: @escaping ([[String:AnyObject]]) -> Void){
        
        let urlString = "https://api.github.com/repositories?client_id=\(Secrets.clientID)&client_secret=\(Secrets.clientSecret)"
        
        let url = URL(string: urlString)
        
        // most basic type of session, goes to website and give back response
        let session = URLSession.shared
        
        if let unwrappedUrl = url {
        
            // create task to do something with session: make a data task, but use completion handler
            let task = session.dataTask(with: unwrappedUrl) { (data, response, error) in
                if let unwrappedData = data {
                    
                    do {
                        let responseJSONArray = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [[String:Any]]
                            completion(responseJSONArray as [[String : AnyObject]])
                    }catch{
                        print("error")
                    }
            }
                
            }
            
            // tell it to actually do the task: to start/resume
            task.resume()
       
        }
    
    }

}

/* Lecture Notes
 1. take URL and create a variable
 2. create a session
 3. make it do something: data task -- let task = session.dataTask(with: url) { (data, response, error) in
 
 3 things: data, response, error
 - getting data from internet (1s and 0s) JSON serialization takes that data and makes it a JSON object
 - but SWIFT doesn't process JSON object, so need to contain it as a dictionary
 
 var responseJSON = JSONSerialization.jsonObject(with: data, options: [])
 
 do, try, catch: do this thing, if it has any error, try to catch it
 
 remember to tell it to actually do the task: task.resume()
 */


