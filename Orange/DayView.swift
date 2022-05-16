//
//  DayView.swift
//  Orange
//
//  Created by Vishwa Pandian on 5/13/22.
//

import SwiftUI

struct DayView: View {
    
    @State var currentDate = Date()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    HStack {
                        Spacer()
                        Image(systemName: "plus")
                        .font(Font.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color(red: 167/255, green: 206/255, blue: 239/255))
                    .cornerRadius(15)
                }
                
                Button {
                    
                } label: {
                    HStack {
                        Spacer()
                        Image(systemName: "shuffle")
                        .font(Font.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color(red: 88/255, green: 147/255, blue: 198/255))
                    .cornerRadius(15)
                }
            }
            .padding(7)
            HStack {
                
                Spacer()
                
                Button {
                    currentDate = currentDate - 86400
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(Color(red: 44/255, green: 90/255, blue: 130/255))
                            .frame(width: 35, height: 35)
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(Font.system(size: 20, weight: .bold))
                        
                    }
                }
                
                Spacer()
                
                Text("\(currentDate.formatted(.dateTime.weekday(.wide).month(.wide).day()))")
                    .font(Font.system(size: 20, weight: .bold))
                
                Spacer()
                
                Button {
                    currentDate = currentDate + 86400
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 35, height: 35)
                            .foregroundColor(Color(red: 44/255, green: 90/255, blue: 130/255))
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                            .font(Font.system(size: 20, weight: .bold))
                    }
                }
                
                Spacer()
            }
            .padding()
            Spacer()
            
            
            
        }
    }
}



struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView()
            
    }
}
