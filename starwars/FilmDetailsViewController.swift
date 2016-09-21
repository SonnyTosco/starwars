//
//  FilmDetailsViewController.swift
//  starwars
//
//  Created by Clavel Tosco on 9/20/16.
//  Copyright © 2016 Clavel Tosco. All rights reserved.
//

import Foundation
import UIKit

class FilmDetailsViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var crawlLabel: UILabel!
    
    var titleM = ""
    var releaseDate = ""
    var director = ""
    var crawl = ""
    
    override func viewDidLoad() {
        titleLabel.text = titleM
        releaseDateLabel.text = releaseDate
        directorLabel.text = director
        crawlLabel.text = crawl
    }
}
