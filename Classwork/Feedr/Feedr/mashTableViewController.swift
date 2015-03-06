//
//  ViewController.swift
//  Feedr
//
//  Created by Tedi Konda on 3/2/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit

class mashTableController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    var tempData = ["Ena's tail is apperantly OK", "MOB Class is awesome", "Pigs sighted flying"]
    
    var json: NSDictionary?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // connecting to site
        if let url = NSURL(string: "http://mashable.com/stories.json"){
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                
                if let jsonDict: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) {
                    self.json = jsonDict as? NSDictionary
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
            })
            task.resume()
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let jsonData =  self.json {
            if let data = jsonData["new"] as? NSArray {
                return data.count
            }
        }
        
        return 0 // Fallback incase data comes back with error
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        if cell == nil  {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        }
        
        if let jsonData =  self.json {
            if let data = jsonData["new"] as? NSArray {
                if let children = data[indexPath.row] as? NSDictionary {
                    
                        if let title = children["title"] as? NSString {
                            cell.textLabel?.text = title
                            
                        }
                    if let sub = children["author"] as? NSString {
                        cell.detailTextLabel?.text = sub
                    }
                }
            }
        }
        
        return cell
    }
    
    //on click
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var url = NSURL(string: "http://tedi.io")
        performSegueWithIdentifier("web", sender: NSURLRequest(URL: url!))
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let request = sender as? NSURLRequest {
            var destinationViewController = segue.destinationViewController as WebViewController
            destinationViewController.request = request
        }
    }
    
    
}

