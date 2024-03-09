//
//  ProgressView.swift
//  WorkOutUpdatedUI
//
//  Created by Jovane Samuels on 9/20/23.
//
import SwiftUI

struct ProgressView: View {
    @State private var pickerSelection: String = "WeekViews"
    @Environment(\.colorScheme) var colorScheme


    // This function returns the appropriate color based on the picker's selection
    func colorForSelection() -> Color {
        switch pickerSelection {
        case "MonthViews":
            return Color(red: 162/255, green: 197/255, blue: 121/255) // RGB(162, 197, 121)
        case "AllTimeView":
            return (Color(hue: 0.583, saturation: 1, brightness: 0.4, opacity: 1))// RGB(255, 255, 221)
        default:
            return ((Color(hue: 0.178, saturation: 0.775, brightness: 0.871, opacity: 1)))// You can set a default color for other selections if needed
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                Picker("Picker", selection: $pickerSelection) { // Notice the $ sign for two-way binding
                    Text("Weekly").tag("WeekViews")
                    Text("Monthly").tag("MonthViews")
                    Text("All Time").tag("AllTimeView")
                }
                .pickerStyle(.segmented)
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .fill(colorScheme == .dark ? Color(uiColor: .black): Color(hue: 0.167, saturation: 0.133, brightness: 1, opacity: 1) )
                    .shadow(
                        color: colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black),
                        radius: 0,
                        x: 3,
                        y: 3
                    )
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .circular
                    )
                    .stroke(colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black), lineWidth: 2)
                }
                .padding()

                HStack {
                    Text("Calories Burnt")
                        .font(.system(.title2, design: .monospaced))
                        .bold()

                    Spacer()
                }
                .padding()

                VStack {
                    CalorieChartView()
                }
                .frame(
                    width: 350,
                    height: 250
                )
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .circular
                    )
                    .fill(colorForSelection())
                    .shadow(
                        color: colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black),
                        radius: 0,
                        x: 3,
                        y: 4
                    )
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .circular
                    )
                    .stroke(colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black), lineWidth: 4)
                }

                HStack {
                    Text("Progress Distribution")
                        .font(.system(.title2, design: .monospaced))
                        .bold()

                    Spacer()
                }
                .padding()

                VStack {
                    ChallengePieChartView()
                        .padding()
                        
                }
                .frame(
                    width: 350,
                    height: 250
                )
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .circular
                    )
                    .fill(colorForSelection())
                    .shadow(
                        color: colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black),
                        radius: 0,
                        x: 3,
                        y: 4
                    )
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .circular
                    )
                    .stroke(colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black), lineWidth: 4)
                }
                HStack {
                    Text("Calendar View")
                        .font(.system(.title2, design: .monospaced))
                        .bold()

                    Spacer()
                }
                .padding()
                VStack {
                    MonthlyCalendarView()
                        //.aspectRatio( contentMode: .fit)
                        
                        
                }
                .frame(
                    width: 350,
                    height: 360
                )
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .circular
                    )
                    .fill(colorForSelection())
                    .shadow(
                        color: colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black),
                        radius: 0,
                        x: 3,
                        y: 4
                    )
                }
                .background(alignment: .center) {
                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .circular
                    )
                    .stroke(colorScheme == .dark ? Color(uiColor: .purple) : Color(uiColor: .black), lineWidth: 4)
                }
            }
            .navigationTitle("Your Progress")
        }
    }
}



struct MonthlyCalendarView: View {
    let calendar = Calendar.current
    let today = Date()
    let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var monthStart: Date {
        calendar.date(from: calendar.dateComponents([.year, .month], from: today))!
    }
    
    var monthEnd: Date {
        calendar.date(byAdding: DateComponents(month: 1, day: -1), to: monthStart)!
    }
    
    var startDayOfWeek: Int {
        let weekday = calendar.component(.weekday, from: monthStart)
        return weekday - 1  // Adjusting since our daysOfWeek array starts from index 0
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                    
                    ForEach(daysOfWeek, id: \.self) { day in
                        Text(day)
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    
                    ForEach(0..<startDayOfWeek, id: \.self) { _ in
                        Text(" ") // Empty cells before first day of the month
                    }
                    
                    ForEach(daysInMonth(), id: \.self) { date in
                        Text(String(calendar.component(.day, from: date)))
                            .padding(10)
                            .background(isDateInCurrentWeek(date: date) ? Color.blue.opacity(0.5) : Color.clear)
                            .cornerRadius(20)
                            .foregroundColor(isDateInCurrentWeek(date: date) ? .white : .black)
                            .fontWeight(.light)
                            .font(.footnote)
                            .bold()
                    }
                    
                }
            }
            .padding()
        }
    }
    
    func daysInMonth() -> [Date] {
        var dates: [Date] = []
        var currentDate = monthStart

        while currentDate <= monthEnd {
            dates.append(currentDate)
            if let nextDate = calendar.date(byAdding: .day, value: 1, to: currentDate) {
                currentDate = nextDate
            }
        }
        
        return dates
    }
    
    func isDateInCurrentWeek(date: Date) -> Bool {
        let currentWeek = calendar.component(.weekOfYear, from: today)
        let dateWeek = calendar.component(.weekOfYear, from: date)
        return currentWeek == dateWeek
    }
}

struct MonthlyCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}

