import Foundation

class Task {
    var date = Date()
    var name = ""
    var discription = ""
    var priority = 1
    var dueNow = false
    var estimatedTime = 0
    var recurring = false
    var recurringDays = ["Mon": false, "Tue": false, "Wed": false, "Thru": false, "Fri": false]
    // dictionary with all day names (saturday sunday, stc... binded with a bool representing if the event reacures on that day
    
    init (name: String, discription: String, date: Date, priority: Int, dueNow: Bool, estimatedTime: Int, recurring: Bool) {
        self.name = name
        self.discription = discription
        self.date = date
        self.priority = priority
        self.dueNow = dueNow
        self.estimatedTime = estimatedTime
        self.recurring = recurring
    }
}
