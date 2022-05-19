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
    
    @State var totalHours = "0 hours"
    @State var totalMinutes = "0 minutes"
    
    @State var totalHoursInt: Int16 = 0
    @State var totalMinutesInt: Int16 = 0
    
    var body: some View {
        VStack {
            
            HStack {
                
                Image(systemName: "xmark.circle")
                    .font(Font.system(size: 20))
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                    .opacity(0)
                
                Spacer()
                
                Text(event?.name ?? "")
                    .bold()
                    .foregroundColor(.primary)
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                Button {
                    showTaskManager.toggle()
                } label: {
                    Image(systemName: "xmark.circle")
                        .font(Font.system(size: 20))
                        .foregroundColor(.blue)
                        .padding(.top, 30)
                        .padding(.horizontal, 30)
                }

            }
                        
            
            
            
            
            DatePicker("Date and Time", selection: $date, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(DefaultDatePickerStyle())
                .labelsHidden()
                .padding()
            
            HStack {
                Menu {
                    
                    Button {
                        
                        totalHours = "0 hours"
                        
                    } label: {
                        Text("0 Hours")
                    }
                    
                    Button {
                        
                        totalHours = "1 hour"
                        totalHoursInt = 1
                        
                    } label: {
                        Text("1 Hour")
                    }
                    
                    Button {
                        
                        totalHours = "2 hours"
                        totalHoursInt = 2
                        
                    } label: {
                        Text("2 Hours")
                    }
                    
                    Button {
                        
                        totalHours = "3 hours"
                        totalHoursInt = 3
                        
                    } label: {
                        Text("3 Hours")
                    }
                    
                    Button {
                        totalHours = "4 hours"
                        totalHoursInt = 4
                    } label: {
                        Text("4 Hours")
                    }
                    
                    Button {
                        totalHours = "5 hours"
                        totalHoursInt = 5
                    } label: {
                        Text("5 Hours")
                    }
                    
                    Button {
                        totalHours = "6 hours"
                        totalHoursInt = 6
                    } label: {
                        Text("6 Hours")
                    }
                    
                    Button {
                        totalHours = "7 hours"
                        totalHoursInt = 7
                    } label: {
                        Text("7 Hours")
                    }
                    
                    Button {
                        totalHours = "8 hours"
                        totalHoursInt = 8
                    } label: {
                        Text("8 Hours")
                    }
                    
                    Button {
                        totalHours = "9 hours"
                        totalHoursInt = 9
                    } label: {
                        Text("9 Hours")
                    }
                    
                } label: {
                    Text(totalHours)
                        .foregroundColor(.secondary)
                }
                
                Menu {
                    
                    Button {
                        totalMinutes = ("0 minutes")
                        totalMinutesInt = 0
                    } label: {
                        Text("0 minutes")
                    }
                    
                    Button {
                        totalMinutes = ("5 minutes")
                        totalMinutesInt = 5
                    } label: {
                        Text("5 minutes")
                    }
                    
                    Button {
                        totalMinutes = ("10 minutes")
                        totalMinutesInt = 10
                    } label: {
                        Text("10 minutes")
                    }
                    
                    Button {
                        totalMinutes = ("15 minutes")
                        totalMinutesInt = 15
                    } label: {
                        Text("15 minutes")
                    }
                    
                    Button {
                        totalMinutes = ("20 minutes")
                        totalMinutesInt = 20
                    } label: {
                        Text("20 minutes")
                    }
                    
                    Button {
                        totalMinutes = ("25 minutes")
                        totalMinutesInt = 25
                    } label: {
                        Text("25 minutes")
                    }
                    
                    Button {
                        totalMinutes = ("30 minutes")
                        totalMinutesInt = 30
                    } label: {
                        Text("30 minutes")
                    }
                    
                    Button {
                        totalMinutes = ("40 minutes")
                        totalMinutesInt = 40
                    } label: {
                        Text("40 minutes")
                    }
                    
                    Button {
                        totalMinutes = ("45 minutes")
                        totalMinutesInt = 45
                    } label: {
                        Text("45 minutes")
                    }
                    
                    Button {
                        totalMinutes = ("50 minutes")
                        totalMinutesInt = 50
                    } label: {
                        Text("50 minutes")
                    }
                    
                    
                } label: {
                    Text(totalMinutes)
                        .foregroundColor(.secondary)
                }

            }
            
            
            HStack {
                
                Button {
                    showTaskManager.toggle()
                } label: {
                    Text("Save")
                        .bold()
                        .foregroundColor(.blue)
                        .padding()
                }
                .padding()
                
                Button {
                    coreDM.deleteEvent(event: event!)
                    showTaskManager.toggle()
                } label: {
                    Text("Delete")
                        .bold()
                        .foregroundColor(.red)
                        .padding()
                }
            }
            
            
        }
        .background(RoundedRectangle(cornerRadius: 20).shadow(color: .black.opacity(0.2), radius: 3))
        .padding(.horizontal)
        .transition(.move(edge: .bottom))
        .foregroundColor(.white)
        .onAppear {
            date = event!.date ?? Date()
            totalHoursInt = event!.length / 60
            totalMinutesInt = event!.length % 60
            
            if (totalHoursInt == 0) {
                totalHours = "0 hours"
            } else if (totalHoursInt == 1) {
                totalHours = "1 hour"
            }
        }
        
    }
    
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(coreDM: CoreDataManager())
    }
}
