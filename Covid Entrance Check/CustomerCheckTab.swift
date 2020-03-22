//
//  CustomerCheckTab.swift
//  Covid Entrance Check
//
//  Created by Alpay Kücük on 22.03.20.
//  Copyright © 2020 Alpay Kücük. All rights reserved.
//

import Foundation
import UIKit

class CustomerCheckTab: UIViewController {
    
    
    var currentCustomer: Person?
    
    @IBOutlet weak var customerid: UILabel!
    @IBOutlet weak var risikofactor: UILabel!
    @IBOutlet weak var risikofaktorlayout: UIView!
    @IBOutlet weak var letztesTestErgebnis: UILabel!
    @IBOutlet weak var frage1: UILabel!
    @IBOutlet weak var frage2: UILabel!
    @IBOutlet weak var frage3: UILabel!
    @IBOutlet weak var antwort1: UILabel!
    @IBOutlet weak var antwort2: UILabel!
    @IBOutlet weak var antwort3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customerid.text = currentCustomer?.id
        risikofaktorlayout.layer.cornerRadius = 20
        risikofaktorlayout.clipsToBounds = true
        letztesTestErgebnis.text = getTestResult()
        antwort1.text = getAnswer(bool: (currentCustomer?.fragen[0])!)
        antwort2.text = getAnswer(bool: (currentCustomer?.fragen[1])!)
        antwort3.text = getAnswer(bool: (currentCustomer?.fragen[2])!)
        if isRisiko() {
            risikofaktorlayout.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            risikofactor.text = "HOCH"
        } else {
            risikofaktorlayout.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            risikofactor.text = "NIEDRIG"
        }
        
    
        
    }
    
    func isRisiko() -> Bool{
        
        if (((currentCustomer?.fragen[0])! && (currentCustomer?.fragen[1])!) && (currentCustomer?.fragen[2])!) {
            return true
        } else {
            
            return false
        }
        
    }
    
    
    
    func getAnswer(bool: Bool) -> String {
        switch bool {
        case true:
            return "JA"
            
        case false:
            return "NEIN"
        default:
            return ""
        }
    }
    
    
    
    
    
    func getTestResult() -> String {
        
        switch currentCustomer?.examinations[0].result {
        case .negative:
            return "negative"
        case .positiv:
            return "positive"
        case .none:
            return "Never tested"
        }
        
    }
    
    
    @IBAction func abbrechen(_ sender: Any) {
        self.dismiss(animated: true) {
        }
    }
    
    @IBAction func einlass(_ sender: Any) {
        CheckTab.currentFiliale?.customer.append(currentCustomer!)
        // Inside another ViewController
        
        
        print((CheckTab.currentFiliale?.customer.count)!)
        
        let currentPresentedVC = self.presentingViewController as? CheckTab
        currentPresentedVC?.reloadData()
        
        self.dismiss(animated: true) {
            
        }
        
        
        
    }
    
}
