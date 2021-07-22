//
//  DataListVC.swift
//  CMoneyInterview
//
//  Created by Peter on 2021/7/21.
//

import UIKit

class DataListVC: UIViewController {

    @IBOutlet weak var dataListCollectionView: UICollectionView!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    var model = APIModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DataListVC viewDidLoad")
        dataListCollectionView.delegate = self
        dataListCollectionView.dataSource = self
        loadingView.startAnimating()
        model.getData("https://raw.githubusercontent.com/cmmobile/NasaDataSet/main/apod.json") {
            [unowned self] isSuccessed in
            DispatchQueue.main.async {
                dataListCollectionView.setItemsInRow(items: 4)
                loadingView.stopAnimating()
                if isSuccessed, model.dataResult != nil {
                    dataListCollectionView.reloadData()
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("DataListVC viewDidAppear")
        print("Width : \(UIScreen.main.bounds.size.width)")
    }
    

}

extension DataListVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt")
        if model.dataResult == nil {
            return
        }
        if model.dataResult!.count > indexPath.row {
            let vc = DetailDataVC.fromStoryBoard()
            vc.nasaDataResult = model.dataResult![indexPath.row]
            push(vc: vc)
        }
    }
}

extension DataListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if model.dataResult != nil {
            return model.dataResult!.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DataCell.identifier(), for: indexPath) as! DataCell
        if model.dataResult == nil {
            return cell
        }
        if model.dataResult!.count > indexPath.row {
            cell.setUp(model.dataResult![indexPath.row])
        }
        return cell
    }
    
    
}
