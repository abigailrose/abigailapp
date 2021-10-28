//
//  Homepage.swift
//  abigail-app
//
//  Created by Abigail Fox on 10/25/21.
//

import SwiftUI

struct Homepage: View {
    var body: some View {
        NavigationView {
            VStack {
                HelloWidget()
                    .padding()
                Text("Today's weather")
                    .padding()
                Text("How are you today?")
                    .padding()
                Text("Today's quote")
                    .foregroundColor(Color.black)
                    .padding()
                NavigationLink(destination: QuoteView()) {
                    QuoteWidget()
                }
                Text("Word of the day")
                    .padding()
                Text("Last night's sleep")
                    .padding()
            }
        }
        .navigationBarBackButtonHidden(false)
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
