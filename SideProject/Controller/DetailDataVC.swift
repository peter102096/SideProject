//
//  DetailDataVC.swift
//  CMoneyInterview
//
//  Created by Peter on 2021/7/21.
//

import UIKit

class DetailDataVC: UIViewController {

    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var detailImgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var copyrightLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    var nasaDataResult: NasaDatum? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailDataVC viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if nasaDataResult != nil {
            loadingView.startAnimating()
            yearLabel.text = nasaDataResult!.date
            detailImgView.image = nil
            titleLabel.text = nasaDataResult!.title
            copyrightLabel.text = nasaDataResult!.copyright
            descriptionTextView.text = nasaDataResult!.nasaDatumDescription
            DownloadModel.shared.downloadImage(nasaDataResult!.hdurl) {
                [unowned self] isSuccess, image in
                DispatchQueue.main.async {
                    loadingView.stopAnimating()
                    if isSuccess, image != nil {
                        detailImgView.image = image
                    }
                }
            }
        }
    }
}
