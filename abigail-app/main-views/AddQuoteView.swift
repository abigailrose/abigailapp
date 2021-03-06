//
//  AddQuoteView.swift
//  abigail-app
//
//  Created by Abigail Fox on 10/28/21.
//

import SwiftUI

struct AddQuoteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentation
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Quote.id, ascending: true)],
        animation: .default)
    private var quotes: FetchedResults<Quote>
    
    
    @State private var quote: String = ""
    @State private var source: String = ""
    
    var body: some View {
        VStack {
            Text("Add a new quote")
                .font(.title)
            
            //TODO: I don't love how this looks
            TextEditor(text: $quote)
                .font(.title3)
                .shadow(radius: 1)
                .padding()
            HStack {
                Text("Source: ")
                    .font(.title3)
                TextField("Enter source", text: $source)
                    .font(.title3)
                    .padding()
            }
            .padding()
            Button(action: {
                addQuote()
                self.presentation.wrappedValue.dismiss()
            }) {
                Label("Add Quote", systemImage: "plus")
                    .font(.title3)
            }
            Spacer()
        }
        Spacer()
        .padding()
    }
    
    func addQuote() {
        print("I am a quote")
        
        if quote != "" && source != "" {
            let newQuote = Quote(context: viewContext)
            newQuote.source = source
            newQuote.quote = quote
            newQuote.id = UUID()
            newQuote.timesShown = 0;
        }

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

struct AddQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddQuoteView()
    }
}
