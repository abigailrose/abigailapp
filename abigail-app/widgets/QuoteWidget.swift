//
//  QuoteWidget.swift
//  abigail-app
//
//  Created by Abigail Fox on 10/25/21.
//

import SwiftUI
import CoreData

struct QuoteWidget: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Quote.timesShown, ascending: true)],
        animation: .default)
    private var quotes: FetchedResults<Quote>
    
    @State private var quoteText: String = ""
    @State private var sourceText: String = ""

    var body: some View {
        VStack {
            Text(quoteText)
            Text(sourceText)
            Button(action: getDailyQuote) {
                Text("generate")
            }
        }
    }
    
    func getDailyQuote() {
        let today = quotes.first
        quotes.first?.timesShown += 1
        
        quoteText = today?.quote ?? ""
        sourceText = today?.source ?? ""
        
        //TODO:
        // - make sure a new quote is only shown once a day
        // - make sure quotes are shown at roughly equal frequency: order by timesShown
        // - this logic should probably go in the QuoteView and get passed into here (or come from main page)
    }
}

struct QuoteWidget_Previews: PreviewProvider {
    static var previews: some View {
        QuoteWidget()
    }
}
