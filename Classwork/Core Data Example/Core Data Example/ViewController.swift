//
//  ViewController.swift
//  Core Data Example
//
//  Created by Andre Shonubi on 2/25/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit
import CoreData //import eveywhere coredata is being used

class ViewController: UIViewController {
    
    var appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate) // Referrencing appDelegate (boilerplate)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if you can access moc then you can work with object
        //self.appDelegate.managedObjectContext always called
        if let moc = self.appDelegate.managedObjectContext {
            var ena = NSEntityDescription.insertNewObjectForEntityForName("Animal", inManagedObjectContext: moc) as Animal
            ena.name = "Andre"
            ena.numberOfLegs = 4
            ena.hasFurr = true
            ena.noise = "woof woof"
            appDelegate.saveContext()
        }
    }

    @IBAction func loadAnimalData(sender: AnyObject) {
        if let moc = self.appDelegate.managedObjectContext {
            let fetchAnimals = NSFetchRequest(entityName: "Animal")
            let animalPredicate = NSPredicate(format: "name contains %@", "dre") //pre filter befor all data comes in
            
            fetchAnimals.predicate = animalPredicate
            
            
            
            if let animals : [Animal] =  moc.executeFetchRequest(fetchAnimals, error: nil) as? [Animal]{
                for animal in animals {
                    println(animal.name)
                    println(animal.noise)      
                }
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

