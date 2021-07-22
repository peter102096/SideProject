//
//  DownloadImageModel.swift
//  CMoneyInterview
//
//  Created by Peter on 2021/7/22.
//

import UIKit

class DownloadModel: NSObject {
    
    static let shared: DownloadModel = DownloadModel()
    
    deinit {
        print("DownloadImageModel deinit")
    }
    
    func downloadImage(_ urlStr: String, completionHandler: @escaping (Bool, UIImage?) -> Void) {
        guard let url = URL(string: urlStr) else {
            completionHandler(false, nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (oriData, response, error) in
            if error == nil, let data = oriData, let image = UIImage(data: data) {
                completionHandler(true, image)
            } else {
                completionHandler(false, nil)
            }
        }.resume()
    }
}
