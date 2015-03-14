//
//  MoodListTableViewController.swift
//  letseat
//
//  Created by Andre Shonubi on 3/11/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit
import Alamofire

let accessToken = "AIzaSyDCWStgsI4e7f1sUC6zVWF_KU2DRVpAkWs"

class MoodListTableViewController: UITableViewController {
    var moodArrary = ["HAPPY 😃", "SAD 😔", "HEALTHY 💊","SICK 😷","ETHNIC 👳","COMFORT 🛀","FUN 😎"]
    var button: HamburgerButton! = nil

    //Get google places data
    func googleplaces() {
        Alamofire.request(.GET, "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=cruise&key=AIzaSyDCWStgsI4e7f1sUC6zVWF_KU2DRVpAkWs").responseJSON { (request, response, json, error) in

        }
        
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.googleplaces()
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
        return self.moodArrary.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
        // Sets each cell to equal each item in the array
        
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.textLabel?.font = UIFont.systemFontOfSize(50.0)

        cell.textLabel?.text = self.moodArrary[indexPath.row]
        return cell
        
    }
    
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
////        if editingStyle == .Delete {
////            //removes it from the array and the view when array is specified
//////            self.gaCampuses.removeAtIndex(indexPath.row)
//////            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
////        }
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
