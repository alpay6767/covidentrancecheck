//
//  Person.swift
//  Covid Entrance Check
//
//  Created by Alpay Kücük on 21.03.20.
//  Copyright © 2020 Alpay Kücük. All rights reserved.
//

import Foundation
import UIKit

class Person {
    
    var id: String?
    var fileNumber: String?
    var firstName: String?
    var lastName: String?
    var dateOfBirth: Date?
    var address: String?
    var zip: String?
    var city: String?
    var gender: Gender?
    var examinations = [Examination]()
    var fragen = [Bool]()
    
    init(id: String, fileNumber: String, firstName: String, lastName: String, dateOfBirth: Date, address: String, zip: String, city: String, gender: Gender, examinations: [Examination]) {
        self.id = id
        self.fileNumber = fileNumber
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.address = address
        self.zip = zip
        self.city = city
        self.gender = gender
        self.examinations = examinations
    }
    
    init(id: String, fileNumber: String, firstName: String, lastName: String, dateOfBirth: Date, address: String, zip: String, city: String, gender: Gender) {
        self.id = id
        self.fileNumber = fileNumber
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.address = address
        self.zip = zip
        self.city = city
        self.gender = gender
    }
    
    
    
}

class Examination {
    
    var id: String?
    var result: Result
    
    init(id: String, result: Result) {
        self.id = id
        self.result = result
    }
    
    
}


enum Result {
    case positiv, negative
}

enum Gender {
    case m, f, d
}
