//
//  PlacesViewController.swift
//  letseat
//
//  Created by Andre Shonubi on 3/13/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit
import MapKit

class PlacesViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var navBar: UINavigationBar!
    var menuButtom: HamburgerButton! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawMap()
        navigation()
        
        
    }
    
    func drawMap() {
        var latitude: CLLocationDegrees = 48.399193
        var longitude: CLLocationDegrees = 9.9933341
        
        var latDelta: CLLocationDegrees = 0.01
        var longDelta: CLLocationDegrees = 0.01
        
        var theSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var churchLocation: CLLocationCoordinate2D =  CLLocationCoordinate2DMake(latitude, longitude)
        var theRegion: MKCoordinateRegion = MKCoordinateRegionMake(churchLocation, theSpan)
        
        self.mapView.setRegion(theRegion, animated: true)
        
        var placeAnnotation = MKPointAnnotation()
        placeAnnotation.coordinate = churchLocation
        placeAnnotation.title = "The Spot"
        placeAnnotation.subtitle = "is right here"
        
        self.mapView.addAnnotation(placeAnnotation)
    }
    
    func navigation() {
        self.menuButtom = HamburgerButton(frame: CGRectMake(0, 0, 5, 5))
        self.menuButtom.addTarget(self, action: "toggle:", forControlEvents: .TouchUpInside)
        var transform = self.menuButtom.transform
        transform = CGAffineTransformScale(transform, 0.65, 0.65)
        
        self.menuButtom.transform = transform
        self.navBar.backItem?.setLeftBarButtonItem(UIBarButtonItem(customView: self.menuButtom), animated: true)
        
        self.navBar.topItem?.title = "Happy"
        let titleColor: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navBar.titleTextAttributes = titleColor
    }
    
    func toggle(button:UIButton) {
        self.menuButtom.showsMenu = !self.menuButtom.showsMenu
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
