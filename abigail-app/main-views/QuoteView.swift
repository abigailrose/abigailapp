//
//  QuoteView.swift
//  abigail-app
//
//  Created by Abigail Fox on 10/28/21.
//

import SwiftUI

struct QuoteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Quote.id, ascending: true)],
        animation: .default)
    private var quotes: FetchedResults<Quote>
    
    var body: some View {
        VStack {
            List {
                ForEach(quotes) { quote in
                    Text(quote.quote ?? "")
                }
                .onDelete(perform: deleteItems)
            }
        }
        .toolbar {
            ToolbarItem {
                NavigationLink(destination: AddQuoteView()) {
                    Image(systemName: "plus")
                        .font(.title3)
                }
            }
        }
    }
    
    func test() {
        for quote in quotes {
            print(quote.quote)
            print(quote.source)
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
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { quotes[$0] }.forEach(viewContext.delete)

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

}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
