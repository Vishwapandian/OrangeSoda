//
//  DayView.swift
//  Orange
//
//  Created by Vishwa Pandian on 5/13/22.
//

import SwiftUI

struct DayView: View {
    
    @State var currentDate = Date()
    
    let coreDM: CoreDataManager
    
    @State var events: [Event] = [Event]()
    
    @State private var showEventPicker = false
    
    @State var refreshBool = false
    
    func populateCalender() {
        events = coreDM.getAllEvents()
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    showEventPicker.toggle()
                } label: {
                    HStack {
                        Spacer()
                        Image(systemName: "plus")
                        .font(Font.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color("color1"))
                    .cornerRadius(15)
                }
                .sheet(isPresented: $showEventPicker, onDismiss: {
                    populateCalender()
                }) {
                    AddView(coreDM: CoreDataManager(), showEventPicker: $showEventPicker)
                        }
                
                Button {
                    populateCalender()
                } label: {
                    HStack {
                        Spacer()
                        Image(systemName: "shuffle")
                        .font(Font.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color("color2"))
                    .cornerRadius(15)
                }
                .onAppear {
                    populateCalender()
                }
            }
            .padding(7)
            HStack {
                ZStack {
                    
                    
                    HStack {
                        Button {
                            currentDate = currentDate - 86400
                        } label: {
                            ZStack {
                                //Circle()
                                  //  .foregroundColor(Color(red: 84/255, green: 130/255, blue: 170/255))
                                    //.frame(width: 35, height: 35)
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("color3"))
                                  //.foregroundColor(.white)
                                    .font(Font.system(size: 20, weight: .bold))
                                
                            }
                        }
                        
                        
                        Spacer()
                            .frame(width: 240)
                            
                        
                        Button {
                            currentDate = currentDate + 86400
                        } label: {
                            ZStack {
                                //Circle()
                                  //  .frame(width: 35, height: 35)
                                    //.foregroundColor(Color(red: 44/255, green: 90/255, blue: 130/255))
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("color3"))
                                    //.foregroundColor(.white)
                                    .font(Font.system(size: 20, weight: .bold))
                            }
                        }
                        
                        
                    }
                    
                    Button {
                        
                    } label: {
                        Text("\(currentDate.formatted(.dateTime.weekday(.wide).month(.wide).day()))")
                            .font(Font.system(size: 20, weight: .bold))
                            .foregroundColor(Color("color3"))
                    }
                }
            }
            .padding()
            Spacer()
            
            /*
            List {
                
                ForEach(events, id: \.self) { event in
                    VStack {
                        Text(event.name ?? "")
                        Text((event.date ?? Date()), style: .date)
                        Text("Length: \(event.length) minutes")
                        //Text("Time: \(event.time ?? Date())")
                        Text("Time: \(event.time)")
                        if (event.repeats) {
                            Text("Repeats")
                        }
                        if (event.anytime) {
                            Text("Event can be anytime")
                        }
                        
                    }

                }
                .onDelete(perform: { IndexSet in
                    IndexSet.forEach { index in
                        let event = events[index]
                        coreDM.deleteEvent(event: event)
                        populateCalender()
                    }
                })
                
            }
            */
            
            ScrollView {
                ZStack {
                    
                    VStack {
                        ForEach(0..<24) { time in
                            
                            HStack {
                                VStack(alignment: .trailing) {
                                    Rectangle()
                                        .frame(width: 75, height: 1)
                                        .foregroundColor(.gray)
                                    if (time > 12) {
                                        Text("\(time - 12) PM")
                                            .font(Font.system(size: 15, weight: .thin))
                                            .foregroundColor(.gray)
                                            .padding(.bottom, 60)
                                    } else if (time == 0) {
                                        Text("12 AM")
                                            .font(Font.system(size: 15, weight: .thin))
                                            .foregroundColor(.gray)
                                            .padding(.bottom, 60)
                                    } else {
                                        Text("\(time) AM")
                                            .font(Font.system(size: 15, weight: .thin))
                                            .foregroundColor(.gray)
                                            .padding(.bottom, 60)
                                    }
                                } // VStack
                                Spacer()
                                
                                if (refreshBool) {
                                    
                                }
                            } // HStack
                           
                        } // ForEach
                    } // VStack
                    
                    
                    ZStack {
                        ForEach(events, id: \.self) { event in
                            
                            let compareDate = event.date ?? Date()
                            
                            if ("\(currentDate.formatted(.dateTime.weekday(.wide).month(.wide).day()))" == "\(compareDate.formatted(.dateTime.weekday(.wide).month(.wide).day()))")
                            {
                                
                                HStack {
                                    Spacer()
                                    VStack {
                                        
                                        VStack {
                                            
                                            let len = (CGFloat)(event.length) * 1.577
                                            
                                            let topPadding = (CGFloat)(event.time) * 1.577
                                            
                                            Spacer()
                                                .frame(height: topPadding)
                                            
                                            ZStack {
                                                
                                                Button {
                                                    
                                                } label: {
                                                    
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .frame(width: 300, height: len)
                                                        .padding(.horizontal)
                                                        .foregroundColor(Color("color2"))
                                                }
                                                
                                                VStack {
                                                    
                                                    let length = event.length
                                                    
                                                    if(length >= 45) {
                                                        Text(event.name ?? "")
                                                            .bold()
                                                            .foregroundColor(.white)
                                                        if (length == 60) {
                                                            Text("\((length / 60)) hour")
                                                                .foregroundColor(.white)
                                                                .opacity(0.8)
                                                        } else if (length % 60 == 0) {
                                                            Text("\(length / 60) hours")
                                                                .foregroundColor(.white)
                                                                .opacity(0.8)
                                                        } else if (length < 120 && length > 45) {
                                                            Text("\(length / 60) hour \(length % 60) minutes")
                                                                .foregroundColor(.white)
                                                                .opacity(0.8)
                                                        } else if (length >= 45) {
                                                            Text("\(length % 60) minutes")
                                                                .foregroundColor(.white)
                                                                .opacity(0.8)
                                                        } else {
                                                            Text("\(length / 60) hours \(length % 60) minutes")
                                                                .foregroundColor(.white)
                                                                .opacity(0.8)
                                                        }
                                                    } else if (length >= 20) {
                                                        Text(event.name ?? "")
                                                            .bold()
                                                            .foregroundColor(.white)
                                                    }
                                                }
                                                
                                            }

                                        }
                                        
                                        Spacer()
                                    }
                                }
                            } // end of if
                            
                        }
                    }
                    
                    
                } // ZStack
            }
            
            
        }
    }
}



struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(coreDM: CoreDataManager())
            
    }
}
