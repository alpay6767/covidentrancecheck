//
//  ViewController.swift
//  Covid Entrance Check
//
//  Created by Alpay Kücük on 21.03.20.
//  Copyright © 2020 Alpay Kücük. All rights reserved.
//

import UIKit
import AZDialogView

class ViewController: UIViewController {

    
    @IBOutlet weak var personalid: UITextField!
    @IBOutlet weak var enterbtn: UIButton!
    @IBOutlet weak var becomeEntranceBtn: UIButton!
    
    static var currentPerson: Person?
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.personalid.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround() 
        
        
    }

    @IBAction func enter(_ sender: Any) {
        
        let currentPerson = AppDelegate.findPersonID(personId: personalid.text!)
        
        if currentPerson.id == AppDelegate.dataSource.personen[0].id {
            showFailedDialog()
        } else {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "filialenfindertab") as! FilialenFinderTab
            
            newViewController.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
            self.present(newViewController, animated: true, completion: nil)
        
        }
    }
    
    func showFailedDialog() {
        
        let dialog = AZDialogViewController(title: "Person nicht gefunden!", message: "Die Personid wurde nicht gefunden")
        dialog.titleColor = .black
        dialog.messageColor = .black
        dialog.alertBackgroundColor = .white
        dialog.dismissDirection = .bottom
        dialog.dismissWithOutsideTouch = true
        dialog.showSeparator = true
        dialog.rubberEnabled = true
        dialog.blurBackground = false
        dialog.blurEffectStyle = .light
        
        dialog.imageHandler = { (imageView) in
            imageView.image = UIImage(named: "failedlogo")
                
               imageView.contentMode = .scaleAspectFill
               return true //must return true, otherwise image won't show.
        }
        
        
        
        dialog.show(in: self)
        
        
    }
    
}


// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
