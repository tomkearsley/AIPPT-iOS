//
//  MainMenu.swift
//  Public Art
//
//  Created by Tom Kearsley on 4/07/17.
//  Copyright © 2017 Tom Kearsley. All rights reserved.
//

import Foundation
import UIKit

class MainMenu: UIViewController{
    
    @IBAction func mapBtn(_ sender: Any) {
        performSegue(withIdentifier: "returnMap", sender: self)
    }
    
    
    
    
}
