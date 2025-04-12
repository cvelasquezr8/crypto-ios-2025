import SwiftUI


struct AssetDetailView: View {
    
    let asset: Asset
    
    var body: some View {
        Text(asset.name)
            .navigationTitle(asset.name)
    }
}


#Preview {
    NavigationStack {
        AssetDetailView(
            asset: .init(
                id: "1",
                name: "Bitcoin",
                symbol: "BTC",
                priceUsd: "5000.89",
                changePercent24Hr: "9.80"
            )
        )
    }
}
