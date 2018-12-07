//
//  MapViewController.swift
//  finalProject
//
//  Created by Mike Banks on 2018-12-06.
//  Copyright © 2018 Salim Elewa. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var pokemonImageData:UIImage!
    var pokemonName:String!
    var pokemonStats:String!
    var latitude:String!
    var longitude:String!
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonStatsLabel: UILabel!
    
    
    
    let fightPokemon = ["https://pokeapi.co/api/v2/pokemon/salamence/",
        "https://pokeapi.co/api/v2/pokemon/tyranitar/",
        "https://pokeapi.co/api/v2/pokemon/garchomp/",
        "https://pokeapi.co/api/v2/pokemon/rhydon/",
        "https://pokeapi.co/api/v2/pokemon/onix/"]
    var pokemonFighter:String!
    
    //MARK: TODO: CHECK USER INPUT FOR LOCATION
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        pokemonImage.image = pokemonImageData
        pokemonNameLabel.text = self.pokemonName
        //pokemonStatsLabel.text = "\(self.pokemonStats)  HP: 100"
        
        // set up the "view" of the map
        let latitudeValue = (latitude as NSString).doubleValue
        let longitudeValue = (longitude as NSString).doubleValue
        
        // 1. Set the "center" of the view                => coordinate
        let centerCoordinate = CLLocationCoordinate2DMake(longitudeValue,latitudeValue)
        
        // 2. Set the "zoom" level                      => span
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        
        // 3. Built the "view" -> (center & zoom)       => region
        let region = MKCoordinateRegion(center: centerCoordinate, span: span)
        
        // 4. Update the map to show your "view"
        //mapView.setRegion(region, animated: true)
        
        // add a pin to the map
        // 1. Create a new Pin object (MKPointAnnotation)
        
        let random = Float.random(in: 0.1 ... 0.2)
        let random2 = Float.random(in: 0.2 ... 0.3)
        let random3 = Float.random(in: 0.4 ... 0.5)
        let random4 = Float.random(in: 0.6 ... 0.7)
        let random5 = Float.random(in: 0.8 ... 0.9)

        let pin = MKPointAnnotation()
        let pin2 = MKPointAnnotation()
        let pin3 = MKPointAnnotation()
        let pin4 = MKPointAnnotation()
        let pin5 = MKPointAnnotation()
        let pin6 = MKPointAnnotation()
        
        
        // 2. Set the coordinate of the Pin (CLLocationCoordinate)
        let coord = CLLocationCoordinate2DMake(longitudeValue,latitudeValue)
        let coord2 = CLLocationCoordinate2DMake(longitudeValue-Double(random),latitudeValue-Double(random))
        let coord3 = CLLocationCoordinate2DMake(longitudeValue-Double(random2),latitudeValue-Double(random2))
        let coord4 = CLLocationCoordinate2DMake(longitudeValue-Double(random3),latitudeValue-Double(random3))
        let coord5 = CLLocationCoordinate2DMake(longitudeValue-Double(random4),latitudeValue-Double(random4))
        let coord6 = CLLocationCoordinate2DMake(longitudeValue-Double(random5),latitudeValue-Double(random5))




        pin.coordinate = coord
        pin2.coordinate = coord2
        pin3.coordinate = coord3
        pin4.coordinate = coord4
        pin5.coordinate = coord5
        pin6.coordinate = coord6
        // 3. OPTIONAL: add a "bubble/popup"
        pin.title = self.pokemonName
        pin2.title = "salamence"
        pin3.title = "tyranitar"
        pin4.title = "garchomp"
        pin5.title = "rhydon"
        pin6.title = "onix"
        
        // 4. Add the pin to the map
        mapView.addAnnotation(pin)
        mapView.addAnnotation(pin2)
        mapView.addAnnotation(pin3)
        mapView.addAnnotation(pin4)
        mapView.addAnnotation(pin5)
        mapView.addAnnotation(pin6)
        print(coord2)
        print(coord)
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
    {
        print("to ehre")
        if let annotationTitle = view.annotation?.title
        {
            print("User tapped on annotation with title: \(annotationTitle!)")
            print("got")
        }
        pokemonFighter = (view.annotation?.title)!
        self.performSegue(withIdentifier: "battle", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        BattleViewController.pokemonAttacker = pokemonFighter
    }

}
