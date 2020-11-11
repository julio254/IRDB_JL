//
//  DataController.swift
//  IRDB_JL
//
//  Created by Julio Lopez on 10/27/20.
//

import UIKit

class DataController: NSObject {
    let JSONURL = "https://api.jsonbin.io/b/5faa2c8148818715939e8975"
    
    var dataModel: DCiMediaModel?
    
    func getJSONData(completion: @escaping (_ dataModel: DCiMediaModel) -> ()) {
        let jsonURL = URL(string: JSONURL)
        let dataTask = URLSession.shared.dataTask(with: jsonURL!) {
            (data, response, error) in
            
            guard let thisData = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let thisDCIData = try decoder.decode(DCiMediaModel.self, from: thisData)
                
                self.dataModel = thisDCIData
                print(thisDCIData.dciGroup[0].groupEntries[0].groupSummary)
            }
            catch let err {
                print("ERROR WAS: ", err)
            }
            DispatchQueue.main.async {
                // Reassigning back to the main thread
                completion(self.dataModel!)
            }
        }
        dataTask.resume()
    }
}
