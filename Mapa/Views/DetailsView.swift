//
//  DetailsView.swift
//  Mapa
//
//  Created by Louisi Dalazen on 04/04/24.
//

import SwiftUI

struct DetailsView: View {
    @State var location : Location
    
    var body: some View {
        ZStack {
            //            Rectangle().fill( LinearGradient(gradient: Gradient(colors: [.white,.white, Color("azulclaro")]), startPoint: .top, endPoint: .bottom)).ignoresSafeArea()
            VStack(alignment: .leading){
                AsyncImage(url: URL(string: location.image)){
                    image in image.resizable()
                } placeholder: {
                    ZStack {
                        Rectangle().fill(.gray.opacity(0.3))
                        ProgressView()                }
                }
                .scaledToFill()
                .frame(width: 360, height: 300)
                .clipped().cornerRadius(5)
                
                HStack(alignment:.top) {
                    Text(location.name).font(.title.bold())
                    Spacer()
                    HStack {
                        if(location.nota != nil){
                            Image(systemName: "star.fill").foregroundColor( location.nota! >= 1 ? .yellow : .gray)
                            Image(systemName: "star.fill").foregroundColor(location.nota! >= 2 ? .yellow : .gray)
                            Image(systemName: "star.fill").foregroundColor(location.nota! >= 3 ? .yellow : .gray)
                            Image(systemName: "star.fill").foregroundColor(location.nota! >= 4 ? .yellow : .gray)
                            Image(systemName: "star.fill").foregroundColor(location.nota! >= 5 ? .yellow : .gray)
                        }
                        
                    }
                }
                Text(location.description).font(.headline)
                
                
                Text(location.address).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).font(.headline).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/).padding(.vertical)
                
                Text("\(location.avaliacao ?? "")").multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).padding().background( Color("azulclaro").opacity(0.6)).cornerRadius(10)
                
                
            }.padding()
            
            
            
            Spacer()
        }.padding()
    }
}


#Preview {
    DetailsView(location: ilMercato)
}
