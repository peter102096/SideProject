//
//  UIElement.swift
//  CMoneyInterview
//
//  Created by Peter on 2021/7/21.
//

import Foundation
import UIKit

extension UIViewController {
    fileprivate class func fromStoryBoardHelper<T>(storyBoardName: String, storyBoardID: String) -> T
    {
        let storyBoard = UIStoryboard(name: storyBoardName, bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: storyBoardID) as! T
        return controller
    }
    
    static func fromStoryBoard() -> Self {
        let id = String(describing: self)
        return fromStoryBoardHelper(storyBoardName: "Main", storyBoardID: id)
    }
    
    func push(vc:UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pop(toRoot: Bool) {
        if toRoot {
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func popTo(_ vc: AnyClass) {
        navigationController?.popToViewController(ofClass: vc.self)
    }
}
extension UINavigationController {
  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
    }
  }
}

extension UICollectionViewCell {
    static func identifier() -> String {
        return String(describing: self)
    }
}

extension UICollectionView {
    func setItemsInRow(items: Int) {
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            let contentInset = self.contentInset
            let itemsInRow: CGFloat = CGFloat(items);
            let innerSpace = layout.minimumInteritemSpacing * (itemsInRow - 1.0)
            let insetSpace = contentInset.left + contentInset.right + layout.sectionInset.left + layout.sectionInset.right
            let width = floor((frame.width - insetSpace - innerSpace) / itemsInRow)
            print("setItemsInRow width : \(width)")
            layout.itemSize = CGSize(width: width, height: (width * (3/4)))
        }
    }
}
