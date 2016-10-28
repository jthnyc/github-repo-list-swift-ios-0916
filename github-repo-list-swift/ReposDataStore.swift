//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    var repositories: [GithubRepository] = []
    
    static let sharedInstance = ReposDataStore()
    
    func getRepositoriesFromAPI(repo: @escaping ()->()) {
        
        self.repositories.removeAll()
        
        GithubAPIClient.getRepositories { (responseJSONArray) in
            
            for responseJSON in responseJSONArray{
                
             let item = GithubRepository.init(dictionary: responseJSON)
                self.repositories.append(item)
        
                
                
            }
            
            
            repo()
            
        }
        
    }
    
}
