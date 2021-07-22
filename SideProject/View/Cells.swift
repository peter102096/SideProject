//
//  Cells.swift
//  CMoneyInterview
//
//  Created by Peter on 2021/7/21.
//

import UIKit

class DataCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbailImgView: UIImageView!
    
    @IBOutlet weak var titleLB: UILabel!
    
    func setUp(_ data: NasaDatum) {
        titleLB.text = data.title
        thumbailImgView.image = nil
        DownloadModel.shared.downloadImage(data.url) {[weak self] isSuccess, image in
            if isSuccess, image != nil {
                DispatchQueue.main.async {
                    self?.thumbailImgView.image = image
                }
            }
        }
    }
}
