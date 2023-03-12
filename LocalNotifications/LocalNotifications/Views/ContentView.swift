//
//  ContentView.swift
//  LocalNotifications
//
//  Created by Matthew Salazar on 2023-03-09.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    let notify = NotificationHandler()
    
    var body: some View {
        
        VStack(spacing: 20){
            Spacer()
            
            Button("Send a notification in 5 Seconds"){
                notify.sendNotification(
                    date: Date(),
                    type: "time",
                    timeInterval: 5.0,
                    title: "Hey There",
                    body: "This is your reminder")
            }
            DatePicker("Pick a Date", selection: $selectedDate, in: Date()...)
            
            Button("Schedule Notification"){
                notify.sendNotification(
                    date: selectedDate,
                    type: "date",
                    title: "Whats up",
                    body: "This is your reminder")
                
            }.tint(.orange)
            
            
            Spacer()
            
            Text("Not Working?")
                .foregroundColor(.gray)
                .italic()
            
            
            Button ("Request permissions"){
                notify.askPermission()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
