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
        sortDescriptors: [NSSortDescriptor(keyPath: \Quote.id, ascending: true)],
        animation: .default)
    private var quotes: FetchedResults<Quote>

    var body: some View {
        VStack {
            Text("Quote")
            Text("Source")
        }
    }
}

struct QuoteWidget_Previews: PreviewProvider {
    static var previews: some View {
        QuoteWidget()
    }
}
