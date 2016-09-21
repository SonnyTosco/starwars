//
//  PeopleDetailsViewController.swift
//  starwars
//
//  Created by Clavel Tosco on 9/20/16.
//  Copyright © 2016 Clavel Tosco. All rights reserved.
//

import Foundation
import UIKit

class PeopleDetailsViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var genderLabel: UILabel!
    
    @IBOutlet var birthLabel: UILabel!
    
    @IBOutlet var massLabel: UILabel!
    
    var name = ""
    var gender = ""
    var birth = ""
    var mass = ""
    
    override func viewDidLoad() {
        nameLabel.text = name
        genderLabel.text = gender
        birthLabel.text = birth
        massLabel.text = mass
    }
}