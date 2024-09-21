import SwiftUI

struct SecondView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    Text("Crypto")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Spacer()
                }
                
                ScrollView {
                    VStack(spacing: 16) {
                        
                        CryptoCard(cryptoName: "BTC", price: "$57969.56", change: "-0.29%", changeColor: .red)
                        
                        CryptoCard(cryptoName: "ETH", price: "$2348.70", change: "-0.56%", changeColor: .red)
                        
                        CryptoCard(cryptoName: "USDT", price: "$1.00", change: "0.00%", changeColor: .green)
                        
                        CryptoCard(cryptoName: "BNB", price: "$550.40", change: "+1.07%", changeColor: .green)
                        
                        CryptoCard(cryptoName: "LTC", price: "$180.45", change: "+0.50%", changeColor: .green)
                        
                        CryptoCard(cryptoName: "XRP", price: "$1.10", change: "-1.20%", changeColor: .red)
                        
                        CryptoCard(cryptoName: "ADA", price: "$2.20", change: "+3.05%", changeColor: .green)
                    }
                    .padding()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    Spacer()
                    
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    Spacer()
                    
                    
                    NavigationLink(destination: PortfolioView()) {
                        VStack {
                            Image(systemName: "bell.fill")
                            Text("Activity")
                        }
                    }
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

// Placeholder for the ThirdPage, assuming it's defined elsewhere
struct ThirdPage: View {
    var body: some View {
        Text("This is the existing Third Page")
            .font(.largeTitle)
            .padding()
    }
}

struct CryptoCard: View {
    let cryptoName: String
    let price: String
    let change: String
    let changeColor: Color
    
    var body: some View {
        HStack {
            
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.leading, 10)
            
            VStack(alignment: .leading) {
                Text(cryptoName)
                    .font(.title2)
                    .bold()
                Text(price)
                    .font(.title2)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(change)
                    .foregroundColor(changeColor)
                    .bold()
                Image(systemName: "chart.line.uptrend.xyaxis")
                    .resizable()
                    .frame(width: 50, height: 20)
                    .foregroundColor(.gray)
            }
            .padding(.trailing, 10)
        }
        .frame(height: 80)
        .background(Color.black)
        .cornerRadius(15)
        .foregroundColor(.white)
    }
}

#Preview {
    SecondView()
}
