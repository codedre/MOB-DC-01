//
//  MoodListTableViewController.swift
//  letseat
//
//  Created by Andre Shonubi on 3/11/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class MoodListTableViewController: UITableViewController {
    var mood = Mood()
    var button: HamburgerButton! = nil
    var selectedIndexPath:NSIndexPath?
    var moodList: [String] = []
    
    //add custom button
    func menuButton() {
        
        self.button = HamburgerButton(frame: CGRectMake(0, 0, 5, 5))
        self.button.addTarget(self, action: "toggle:", forControlEvents: .TouchUpInside)
        var transform = self.button.transform
        transform = CGAffineTransformScale(transform, 0.65, 0.65)

        self.button.transform = transform
        
        self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(customView: self.button), animated: true)
    }
    
    func toggle(button:UIButton) {
         self.button.showsMenu = !self.button.showsMenu
    }
    
    func searchQuery(currentMood:String?) ->String{
        var food : String?
            for mood in self.mood.foodArrary{
                if let foods = mood[currentMood!] {
                    food = foods
                    return food!
                }
            }
        return "donuts"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.mood.moodArrary.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
        // Sets each cell to equal each item in the array
        
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.textLabel?.font = UIFont.systemFontOfSize(50.0)

        cell.textLabel?.text = self.mood.moodArrary[indexPath.row]
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // get current text label title
        let indexPath = tableView.indexPathForSelectedRow()
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!) as UITableViewCell!
        self.performSegueWithIdentifier("showPlace", sender: currentCell)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let selectedCell = sender as UITableViewCell
        if let destionationVC = segue.destinationViewController as? PlacesViewController {
            destionationVC.navTitle = selectedCell.textLabel?.text
            destionationVC.query = searchQuery(selectedCell.textLabel?.text)
        }
        
    }
    

}
