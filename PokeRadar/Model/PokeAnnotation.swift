//
//  PokeAnnotation.swift
//  PokeRadar
//
//  Created by Sabrina Fletcher on 11/27/17.
//  Copyright © 2017 Sabrina Fletcher. All rights reserved.
//

import Foundation

var deck = Dictionary<Int, String>()

func parsePokemonCSV() {
    
    let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
    
    do {
        
        let csv = try CSV(contentsOfURL: path)
        let rows = csv.rows
        
        for row in rows {
            
            let pokeId = Int(row["id"]!)!
            let name = row["identifier"]!
            
            deck[pokeId] = name
        }
        
    } catch let err as NSError {
        
        print(err.debugDescription)
    }
}

class PokeAnnotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var pokemonNumber: Int
    var pokemonName: String
    var title: String?
    
    
    

    
    init(coordinate: CLLocationCoordinate2D, pokemonNumber:Int){
        self.coordinate = coordinate
        self.pokemonNumber = pokemonNumber
        self.pokemonName = (deck[pokemonNumber]?.capitalized)!
        title = self.pokemonName
        
        
    }
}
