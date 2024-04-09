//
//  Location.swift
//  Mapa
//
//  Created by Louisi Dalazen on 04/04/24.
//

import Foundation
import MapKit

struct Location : Identifiable{
    let id = UUID()
    let name : String
    let coordinate : CLLocationCoordinate2D
    let image : String
    let description : String
    let address : String
    let avaliacao : String?
    let nota : Int?
}
