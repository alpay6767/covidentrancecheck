//
//  FilialenFinderTab.swift
//  Covid Entrance Check
//
//  Created by Alpay Kücük on 21.03.20.
//  Copyright © 2020 Alpay Kücük. All rights reserved.
//

import Foundation
import UIKit
import AZDialogView


class FilialenFinderTab: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var filialenid: UITextField!
    @IBOutlet weak var filialen_cv: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filialen_cv.delegate = self
        filialen_cv.dataSource = self
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.bounds.width, height: view.bounds.height * 0.08
        )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppDelegate.dataSource.filialen.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let currentFiliale = AppDelegate.dataSource.filialen[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filialencell", for: indexPath) as! FilialenCell
        
        cell.filialename.text = (currentFiliale.name)! + " " +  (currentFiliale.address)! + ", "
            + (currentFiliale.city)!
        cell.filialebild.image = currentFiliale.picture
        
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let currentFiliale = AppDelegate.dataSource.filialen[indexPath.item]
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "checktab") as! CheckTab
        CheckTab.currentFiliale = currentFiliale
        newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: true, completion: nil)
    }
 
    
    @IBAction func logout(_ sender: Any) {
        
        self.dismiss(animated: true) {
            
        }
        
        
    }
    
}
