//
//  CustomAlertView.swift
//  Orange
//
//  Created by Vishwa Pandian on 5/18/22.
//

import SwiftUI

struct CustomAlertView : View {
    
    let coreDM: CoreDataManager
    
    @Binding var showTaskManager: Bool
    
    @Binding var event: Event?
    
    @State var date = Date()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
            }
            Text(event?.name ?? "")
                .bold()
                .foregroundColor(.primary)
                .padding()
            
            Button {
                showTaskManager.toggle()
            } label: {
                Text("close")
                    .foregroundColor(.blue)
            }
            .padding()
            
            Button {
                coreDM.deleteEvent(event: event!)
                showTaskManager.toggle()
            } label: {
                Text("Finished Task")
                    .bold()
                    .foregroundColor(.primary)
                    .padding()
            }
            
            
        }
        .background(RoundedRectangle(cornerRadius: 15).shadow(color: .black.opacity(0.2), radius: 3))
        .padding(.horizontal)
        .transition(.move(edge: .bottom))
        .foregroundColor(.white)
    }
    
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(coreDM: CoreDataManager())
    }
}
