//
//  APIModel.swift
//  CMoneyInterview
//
//  Created by Peter on 2021/7/21.
//

import Foundation

class APIModel: NSObject {
    
    private(set) var dataResult: NasaData? = nil
    
    deinit {
        print("APIModel deinit")
    }
    
    func getData(_ urlStr: String, completionHandler: @escaping (Bool) -> Void) {
        dataResult = nil
        guard let url = URL(string: urlStr) else {
            completionHandler(false)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (oriData, response, error) in
            if let data = oriData, let dataResult = try? JSONDecoder().decode(NasaData.self, from: data), error == nil {
                self.dataResult = dataResult
                completionHandler(true)
            } else {
                completionHandler(false)
            }
        }.resume()
    }
}
