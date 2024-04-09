//
//  data.swift
//  Mapa
//
//  Created by Louisi Dalazen on 04/04/24.
//

import Foundation
import MapKit

let restaurantes : Array<Location> = [
    mokka, ilMercato, cafeCultura
]


let mokka = Location(name:"Mokka Floripa", coordinate: CLLocationCoordinate2D(latitude: -27.5881868, longitude: -48.5762905), image: "https://img.restaurantguru.com/r500-Mokka-Floripa-Emporium-Padaria-Cafeteria-Confeitaria-Pao-Artesanal-Ponto-turistico-facade.jpg", description: "Cafeteria e padaria", address: "Av. Cláudio A. Barbosa, 1917 - Estreito, Florianópolis - SC, 88075-015", avaliacao: "Preço bom, comida bem gostosa, mas nada muito especial.", nota: 4)

let ilMercato = Location(name: "Il Mercato", coordinate: CLLocationCoordinate2D(latitude: -27.6125195, longitude: -48.5824151), image: "https://lh5.googleusercontent.com/p/AF1QipNBwFzeTZirSHnaq_G3ZP6KkJaIaaREgPd7vS1I=w408-h544-k-no", description: "Cafeteria e gelateria", address: "R. Des. Pedro Silva, 2079 - Coqueiros, Florianópolis - SC, 88080-700", avaliacao: "Delicia! Panini de copa muuuito delicia! Amo! e ainda tem gelato de sobremesa!", nota: 5)

let cafeCultura = Location(name: "Café Cultura", coordinate: CLLocationCoordinate2D(latitude: -27.588909, longitude: -48.545704), image: "https://lh5.googleusercontent.com/p/AF1QipPIROVBevbWUHSx-DnrpgizcottJGjKa5-ZIbdG=w408-h272-k-no", description: "Cafeteria", address: "R. Alm. Alvim, 595 - Centro, Florianópolis - SC, 88015-380", avaliacao: "Bem gostoso, gosto do cafe de caramelo salgado! mas bem caro.", nota: 4)


