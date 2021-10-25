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
    private var items: FetchedResults<Quote>

    var body: some View {
        VStack {
            Button(action: addQuote) {
                Label("Add Item", systemImage: "plus")
            }
            Text("Quote")
            Text("Source")
        }
    }
    
    func addQuote() {
        print("I am a quote")
        
        let newQuote = Quote(context: viewContext)
        newQuote.source = "source"
        newQuote.quote = "quote"

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct QuoteWidget_Previews: PreviewProvider {
    static var previews: some View {
        QuoteWidget()
    }
}
