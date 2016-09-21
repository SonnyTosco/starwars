//
//  FilmViewController.swift
//  starwars
//
//  Created by Clavel Tosco on 9/19/16.
//  Copyright © 2016 Clavel Tosco. All rights reserved.
//

import Foundation
import UIKit

class FilmViewController: UITableViewController {
    
    var film: [AnyObject] = []
    
    override func viewDidLoad() {
        StarWarsModel.getAllFilms() {
            data, response, error in
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                    as? NSDictionary {
                    if let results = jsonResult["results"] {
                        let resultsArray = results as! NSArray
                        for i in 0..<resultsArray.count {
                            self.film.append(resultsArray[i])
                        }
                    }
                    dispatch_async(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                    })
                }
            } catch {
                print("Something went wrong")
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "filmSegue" {
            if let destination = segue.destinationViewController as? FilmDetailsViewController {
                let path = tableView.indexPathForSelectedRow
                let cell = tableView.cellForRowAtIndexPath(path!)
                let films = film[(path?.row)!]
                destination.titleM = (cell?.textLabel?.text!)!
                destination.releaseDate = films["release_date"] as! String
                destination.director = films["director"] as! String
                destination.crawl = films["opening_crawl"] as! String
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return film.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        _ = tableView.indexPathForSelectedRow!
        if let _ = tableView.cellForRowAtIndexPath(indexPath) {
            self.performSegueWithIdentifier("filmSegue", sender: self)
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let films = film[indexPath.row] as! NSDictionary
        cell.textLabel?.text = films["title"] as! String
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}