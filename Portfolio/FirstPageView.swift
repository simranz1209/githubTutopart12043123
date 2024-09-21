import SwiftUI

struct FirstPageView : View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                
                Text("Step into the Future of Finance")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                Spacer()
                
                
                Image(systemName: "Cutyard")
                    .resizable()
                    .frame(width: 250, height: 150)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Spacer()
                VStack {
                    Text("Your Digital Wallet, One Tap Away")
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    Text("Secure. Simple. Fast.")
                        .font(.subheadline)
                        .padding(.bottom, 8)
                    
                    Text("Welcome to CryptoWallet! Your gateway to the world of cryptocurrency. Manage, trade, and grow your digital assets with top-notch security.")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(.horizontal)
                
                Spacer()
                
                
                NavigationLink(destination: SecondView()) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(15)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .background(Color.blue.opacity(0.2))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct FirstPageView_preview: PreviewProvider{
    static var previews: some View{
        FirstPageView()
    }
}
