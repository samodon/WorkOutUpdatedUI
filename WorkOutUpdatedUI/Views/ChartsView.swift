import SwiftUI
import Charts

struct DailyCalories {
    let day: String
    let caloriesBurnt: Int
}

func generateSampleData() -> [DailyCalories] {
    let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    return daysOfWeek.map { day in
        let randomCalories = Int.random(in: 500...2500)
        return DailyCalories(day: day, caloriesBurnt: randomCalories)
    }
}

struct CalorieChartView: View {
    @Environment(\.colorScheme) var colorScheme

    let weekData = generateSampleData()
    
    var body: some View {
        Chart {
            ForEach(Array(weekData.enumerated()), id: \.offset) { index, dayData in
                LineMark(
                    x: .value("Day", dayData.day), // Day as x value
                    y: .value("Calories", dayData.caloriesBurnt) // Calories as y value
                )
                .lineStyle(StrokeStyle(lineWidth: 2))
                .foregroundStyle(colorScheme == .dark ? .black : .black)
                PointMark(
                    x: .value("Day", dayData.day),
                    y: .value("Calories", dayData.caloriesBurnt)
                )
                .foregroundStyle(colorScheme == .dark ? .black : .black)
            }
        }
        .chartXAxis {
            AxisMarks(values: .automatic) { _ in
                AxisGridLine(centered: true, stroke: StrokeStyle(lineWidth: 1))
                    .foregroundStyle(colorScheme == .dark ? Color.black : Color.black)
                    // Gridline style
                AxisTick(stroke: StrokeStyle(lineWidth: 2))
                
                    // Tick style
                AxisValueLabel()
                    .foregroundStyle(colorScheme == .dark ? Color.black : Color.black)
            }
        }
        .chartYAxis {
            AxisMarks(values: .automatic) { _ in
                AxisGridLine(centered: true, stroke: StrokeStyle(lineWidth: 1))
                    //.foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                    // Gridline style
                AxisTick(centered: true, stroke: StrokeStyle(lineWidth: 0))
                    .foregroundStyle(colorScheme == .dark ? Color.black : Color.black)
                    // Tick style
                AxisValueLabel()
                    .foregroundStyle(colorScheme == .dark ? Color.black : Color.black)            }
        }
        .padding()
    }
}
func generateSampleChallengeData() -> [ChallengeData] {
    return challenges.map { challenge in
        let randomCalories = Int.random(in: 50...500)
        return ChallengeData(challenge: challenge, caloriesBurnt: randomCalories)
    }
}
struct ChallengeData{
    let challenge: Challenge
    let caloriesBurnt: Int
}
struct ChallengePieChartView: View {
    let challengeDataList = generateSampleChallengeData()
    
    @available(iOS 17.0, *)
    var pieChart: some View {
        Chart(challengeDataList, id: \.challenge.name) { data in
            SectorMark(
                angle: .value("Calories", Double(data.caloriesBurnt))
            )
            .foregroundStyle(by: .value("Name", data.challenge.name))
        }
        
    }
    
    var backupView: some View {
        VStack {
            Text("Update to iOS 17 to view the chart")
        }
        .frame(width: 300, height: 300)
    }
    
    var body: some View {
        if #available(iOS 17.0, *) {
            pieChart
        } else {
            backupView
        }
    }
}
struct CalorieChartView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieChartView()
    }
}

