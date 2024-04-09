//
//  ContentView.swift
//  Mapa
//
//  Created by Louisi Dalazen on 04/04/24.
//
import SwiftUI
import MapKit

struct ContentView: View {
    @State var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -27.6109852, longitude: -48.5489548),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    ))
    
    @State private var showingSheet = false
    @State var sheetViewLocation : Location = restaurantes[0]
    
    var body: some View {
        ZStack{
            Map(position: $position){
                ForEach(restaurantes) {location in
                    Annotation(location.name, coordinate: location.coordinate){
                        ZStack {
                            Circle()
                                .fill(.red)
                                .frame(width: 28, height: 28)
                            Image(systemName: "cup.and.saucer").foregroundColor(.white).onTapGesture {
                                showingSheet.toggle()
                                sheetViewLocation = location
                            }
                        }
                    }}
            }.animation(.easeInOut(duration: 2)).ignoresSafeArea()
                .sheet(isPresented: $showingSheet, content: {
                    
                    DetailsView(location: sheetViewLocation) .presentationDetents([.height(300), .large])
                })
            VStack(){
                Spacer()
                ScrollView(.horizontal) {
                    HStack{
                        
                        ForEach(restaurantes){restaurante in
                            
                            ZStack {
                                Color(.white)
                                VStack(){
                                    AsyncImage(url: URL(string: restaurante.image)){
                                        image in image.resizable()
                                    } placeholder: {
                                        ZStack {
                                            Rectangle().fill(.gray.opacity(0.3))
                                            ProgressView()
                                        }
                                        
                                    }
                                    .scaledToFill()
                                    .frame(width: 140, height: 120)
                                    .clipped().cornerRadius(5)
                                    Text(restaurante.name).font(.headline)
                                    Text(restaurante.description).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                                    
                                    HStack {
                                        if(restaurante.nota != nil){
                                            Image(systemName: "star.fill").foregroundColor( restaurante.nota! >= 1 ? .yellow : .gray)
                                            Image(systemName: "star.fill").foregroundColor(restaurante.nota! >= 2 ? .yellow : .gray)
                                            Image(systemName: "star.fill").foregroundColor(restaurante.nota! >= 3 ? .yellow : .gray)
                                            Image(systemName: "star.fill").foregroundColor(restaurante.nota! >= 4 ? .yellow : .gray)
                                            Image(systemName: "star.fill").foregroundColor(restaurante.nota! >= 5 ? .yellow : .gray)
                                        }
                                    }.padding(1)
                                    
                                }.padding(8)
                                
                                
                            }.frame(width:160, height: 220).cornerRadius(10).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).onTapGesture(perform: {
                                position = MapCameraPosition.region(MKCoordinateRegion(
                                    center: restaurante.coordinate,
                                    span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                                ))
                                showingSheet.toggle()
                                sheetViewLocation = restaurante
                            })
                            
                        }
                    }.padding()
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
