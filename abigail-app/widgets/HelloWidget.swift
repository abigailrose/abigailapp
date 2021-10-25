//
//  HelloWidget.swift
//  abigail-app
//
//  Created by Abigail Fox on 10/25/21.
//

import SwiftUI

struct HelloWidget: View {
    var body: some View {
        Text(greeting())
    }
}

func greeting()->String{
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    
    if hour < 12 {
        return "Good morning Abigail"
    }
    else if hour < 17 {
        return "Good afternoon Abigail"
    }
    else {
        return "Good evening Abigail"
    }
}

struct HelloWidget_Previews: PreviewProvider {
    static var previews: some View {
        HelloWidget()
    }
}
