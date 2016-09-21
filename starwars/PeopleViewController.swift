//
//  ViewController.swift
//  starwars
//
//  Created by Clavel Tosco on 9/19/16.
//  Copyright © 2016 Clavel Tosco. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {
    
    var people: [AnyObject] = []

    override func viewDidLoad() {
        StarWarsModel.getAllPeople() {
            data, response, error in
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                    as? NSDictionary {
                    if let results = jsonResult["results"] {
                        let resultsArray = results as! NSArray
                        for i in 0..<resultsArray.count {
                            self.people.append(resultsArray[i])
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
        }
        // Do any additional setup after loading the view, typically from a nib.
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "peopleSegue" {
            if let destination = segue.destinationViewController as? PeopleDetailsViewController {
                let path = tableView.indexPathForSelectedRow
                let cell = tableView.cellForRowAtIndexPath(path!)
                let person = people[(path?.row)!]
                destination.name = (cell?.textLabel?.text!)!
                destination.birth = person["birth_year"] as! String
                destination.gender = person["gender"] as! String
                destination.mass = person["mass"] as! String
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        _ = tableView.indexPathForSelectedRow!
        if let _ = tableView.cellForRowAtIndexPath(indexPath) {
            self.performSegueWithIdentifier("peopleSegue", sender: self)
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let person = people[indexPath.row] as! NSDictionary
        cell.textLabel?.text = person["name"] as! String
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

