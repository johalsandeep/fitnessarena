//
//  Utilities.swift
//  FitnessArena
//
//  Created by Akshay on 2021-11-12.
//

import Foundation
import UIKit

class Utilities {
    
    
static func isPasswordValid(_ password : String) -> Bool{
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
    return passwordTest.evaluate(with: password)
}
    
    
}
