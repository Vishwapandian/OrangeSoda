//
//  AddEvent.swift
//  schedule
//
//  Created by Vishwa Pandian on 4/1/22.
//

import SwiftUI

struct AddView: View {
    
    let coreDM: CoreDataManager
    
    @State var nameOfEvent = ""
    @State var selectedDate = Date()
    @State var selectedTime = Date()
    @State var reccuring = false
    @State var timeMatters = false
    
    @State var totalHours = "0 hours"
    @State var totalMinutes = "5 minutes"
    
    @State var totalHoursInt: Int16 = 0
    @State var totalMinutesInt: Int16 = 5
    
    @Binding var showEventPicker: Bool
    
    @State var anytimeBeforeBool = false
    
    var body: some View {
        VStack {
            
            Form {
                
                Section {
                    TextField("Name of event", text: $nameOfEvent)
                }
                
                Section(header: Text("Due date")) {
                    DatePicker("When: ", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                        .datePickerStyle(.graphical)
                    
                    Toggle("Can be anytime before", isOn: $anytimeBeforeBool)
                    
                }
                
                Section(header: Text("start time")) {
                    if (!timeMatters) {
                        DatePicker("",selection: $selectedTime, displayedComponents: .hourAndMinute)
                            .datePickerStyle(.wheel)
                    }
                    Toggle("Time doesn't matter", isOn: $timeMatters)
                }
                
                Section(header: Text("event length")) {
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
                
                Section {
                    Toggle("Is this a recurring event?", isOn: $reccuring)
                }
                
                Button {
                    
                    let dateFormatter = DateFormatter()
                    
                    let dateFormatter2 = DateFormatter()
                     
                    dateFormatter.dateFormat = "HH"
                    dateFormatter2.dateFormat = "mm"
                     
                    var result: Float
                    
                    if (!timeMatters) {
                        
                        let str1 = dateFormatter.string(from: selectedTime)
                        let str2 = dateFormatter2.string(from: selectedTime)
                        
                        let finalFloat = ((Float)(str1) ?? 1) * 60 + ((Float)(str2) ?? 1)
                        
                        result = finalFloat
                        
                    } else {
                        result = 0
                    }
                    
                    
                    totalMinutesInt += (totalHoursInt * 60)
                    if nameOfEvent == "" {
                        nameOfEvent = "untitled event"
                    }
                    coreDM.saveEvent(name: nameOfEvent, date: selectedDate, repeats: reccuring, length: totalMinutesInt, anytime: anytimeBeforeBool, time: result)
                    showEventPicker = false
                } label: {
                    HStack {
                        Spacer()
                        Text("Confirm")
                            .foregroundColor(.green)
                            .font(.title)
                            .bold()
                        Spacer()
                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(coreDM: CoreDataManager(), showEventPicker: .constant(true))
            .preferredColorScheme(.dark)
    }
}
