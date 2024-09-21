import SwiftUI
import Charts


struct PortfolioPerformance : Identifiable {
    let id = UUID()
    var name: String
    var value: Double
}

struct PortfolioView: View {
   
    var data = [
        _LineChartView(date: "20th Sept", amount: 100),
        _LineChartView(date: "21st Sept", amount: 200),
        _LineChartView(date: "22nd Sept", amount: 700),
        _LineChartView(date: "23rd Sept", amount: 500)
    ]
    
   
    @State private var Portfolio: [PortfolioPerformance] = [
        PortfolioPerformance(name: "BTC", value: 180),
        PortfolioPerformance(name: "ETH", value: 250),
        PortfolioPerformance(name: "ADA", value: 55)
    ]

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            ScrollView {
                VStack(spacing: 20) {
                    Text("Portfolio")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 10)

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Total Balance")
                            .font(.caption)
                            .foregroundColor(.gray)

                        Text("$23,500.00")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Text("+$1,234.56 (4.32%)")
                            .foregroundColor(.green)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(15)
                    .padding(.horizontal)

                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Portfolio Performance")
                            .font(.headline)
                            .foregroundColor(.white)

                        Chart {
                            ForEach(data) { d in
                                LineMark(
                                    x: .value("Date", d.date),
                                    y: .value("Amount", d.amount)
                                )
                            }
                        }
                        .frame(height: 150)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(15)
                    }
                    .padding(.horizontal)

                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Portfolio Performance")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()

                        Chart(Portfolio, id: \.name) { Portfolio in
                            SectorMark(
                                angle: .value("Macros", Portfolio.value),
                                innerRadius: .ratio(0.618),
                                angularInset: 1.5
                            )
                            .foregroundStyle(by: .value("Name", Portfolio.name))
                        }
                        .frame(height: 200)
                        .chartXAxis(.hidden)
                        .padding()
                    }
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(15)
                    .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Your Assets")
                            .font(.headline)
                            .foregroundColor(.white)

                        VStack(spacing: 15) {
                            AssetRowView(assetName: "Bitcoin", ticker: "BTC", amount: "0.5000 BTC", value: "$15,000.00", percentageChange: "+2.5%", changeColor: .green, circleColor: .orange)
                            AssetRowView(assetName: "Ethereum", ticker: "ETH", amount: "4.0000 ETH", value: "$8,000.00", percentageChange: "-1.2%", changeColor: .red, circleColor: .blue)
                            AssetRowView(assetName: "Cardano", ticker: "ADA", amount: "1,000.0000 ADA", value: "$500.00", percentageChange: "+5.7%", changeColor: .green, circleColor: .purple)
                        }
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(15)
                    }
                    .padding(.horizontal)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.gray.opacity(0.3))
                        .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 10)
                )
                .padding(20)
            }
        }
    }
}

struct AssetRowView: View {
    var assetName: String
    var ticker: String
    var amount: String
    var value: String
    var percentageChange: String
    var changeColor: Color
    var circleColor: Color

    var body: some View {
        HStack {
            Circle()
                .fill(circleColor)
                .frame(width: 30, height: 30)

            VStack(alignment: .leading) {
                Text(assetName)
                    .foregroundColor(.white)
                    .font(.headline)

                Text(ticker)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }

            Spacer()

            VStack(alignment: .trailing) {
                Text(value)
                    .foregroundColor(.white)
                    .font(.headline)

                Text(amount)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }

            Text(percentageChange)
                .foregroundColor(changeColor)
                .font(.headline)
                .padding(.leading, 10)
        }
        .padding(.vertical, 5)
    }
}

struct PortfolioPerformance_preview: PreviewProvider{
    static var previews: some View{
        PortfolioView()
    }
}

