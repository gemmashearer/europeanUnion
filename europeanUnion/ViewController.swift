//
//  ViewController.swift
//  europeanUnion
//
//  Created by Gemma Shearer on 31/05/2015.
//  Copyright (c) 2015 GemmaShearer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var yearJoinedLabel: UILabel!
    
    //defining all the global variables needed for the array
    var allCountries:[Country] = []
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        var austriaCountry = Country()
        austriaCountry.name = "Austria"
        austriaCountry.capital = "Vienna"
        austriaCountry.population = 8.474
        austriaCountry.joined = 1995
        
        allCountries.append(austriaCountry)
        
        countryLabel.text = austriaCountry.name
        capitalLabel.text = "The capital city is \(austriaCountry.capital)"
        populationLabel.text = "Population in millions \(austriaCountry.population)"
        yearJoinedLabel.text = "Joined the EU in \(austriaCountry.joined)"
    
        var belgiumCountry = Country()
        belgiumCountry.name = "Belgium"
        belgiumCountry.capital = "Brussels"
        belgiumCountry.population = 11.2
        belgiumCountry.joined = 1957
        
        var bulgariaCountry = Country()
        bulgariaCountry.name = "Bulgaria"
        bulgariaCountry.capital = "Sofia"
        bulgariaCountry.population = 7.265
        bulgariaCountry.joined = 2007
        
        var croatiaCountry = Country()
        croatiaCountry.name = "Croatia"
        croatiaCountry.capital = "Zagreb"
        croatiaCountry.population = 4.253
        croatiaCountry.joined = 2013
        
        var cyprusCountry = Country()
        cyprusCountry.name = "Cyprus"
        cyprusCountry.capital = "Nicosia"
        cyprusCountry.population = 1.141
        cyprusCountry.joined = 2004
        
        //appending all instances of country to the array
        
        allCountries += [belgiumCountry, bulgariaCountry, croatiaCountry, cyprusCountry]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
        var randomIndex:Int
        
        do {
            randomIndex = Int(arc4random_uniform(UInt32(allCountries.count)))
        } while currentIndex == randomIndex
        currentIndex = randomIndex
        let country = allCountries[randomIndex]
        
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.countryLabel.text = country.name
            self.capitalLabel.text = "The capital city is \(country.capital)"
            self.populationLabel.text = "Population in millions \(country.population)"
            self.yearJoinedLabel.text = "Joined the EU in \(country.joined)"
            }, completion: {(finished: Bool) -> () in
                
        })
    }


}

