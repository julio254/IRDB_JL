//
//  DataController.swift
//  IRDB_JL
//
//  Created by Julio Lopez on 10/27/20.
//

import UIKit

class DataController: NSObject {
    let JSONURL = "https://api.jsonbin.io/b/5eb061a247a2266b1472bcf9/1"
    
    var dataModel: MediaDataModel?
    
    func getJSONData(completion: @escaping (_ dataModel: MediaDataModel) -> ()) {
        let jsonURL = URL(string: JSONURL)
        
        let dataTask = URLSession.shared.dataTask(with: jsonURL!) {
            (data, response, error) in
            
            guard let thisData = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let thisMediaData = try decoder.decode(MediaDataModel.self, from: thisData)
                
                self.dataModel = thisMediaData
                print(thisMediaData.franchise[0].entries[0].summary)
                
                // call back the completionHandler and let them know we are done
                DispatchQueue.main.async {
                    // Reassigning back to the main thread
                    completion(self.dataModel!)
                }
            }
            catch let err {
                print("ERROR WAS: ", err)
            }
        }
        dataTask.resume()
    }
}
