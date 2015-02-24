//
//  ViewController.swift
//  data persistance
//
//  Created by Andre Shonubi on 2/23/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var coachesBio: [String] = []

    @IBOutlet weak var helloLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("light", forKey: "theme")
        let theme = defaults.objectForKey("theme") as String
        if theme == "dark" {
            self.view.backgroundColor = UIColor.blackColor()
            self.helloLabel.textColor = UIColor.whiteColor()
        }else{
            self.view.backgroundColor = UIColor.whiteColor()
            self.helloLabel.textColor = UIColor.blackColor()
        }
        
        var booksPath = NSBundle.mainBundle().pathForResource("Books", ofType: "plist")
        
        
        //data needs to be set as root level item
        // NSArray or NS Dictionary to read data
        // NSMutableArray or NSMutableDictionary to read/write data
        var books = NSMutableArray(contentsOfFile: booksPath!)
        books![0].setValue("Ena's world 2", forKey: "Title")
        
        books?.writeToFile(booksPath!, atomically: true)
//        println(books!)
        
        var coachesPath = NSBundle.mainBundle().pathForResource("Coaches", ofType: "plist")
        var coaches = NSArray(contentsOfFile: coachesPath!)
        
        for coach in self.coachesBio {
            
            
        }
        
    }

    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Sets the number of cells in the table to equal the number of items in our array
        return self.gaCampuses.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
        // Sets each cell to equal each item in the array
        
        cell.textLabel?.text = self.gaCampuses[indexPath.row]
        return cell
        
    }


}

