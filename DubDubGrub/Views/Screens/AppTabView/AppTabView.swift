
import SwiftUI

struct AppTabView: View {
    
    @StateObject private var viewModel = AppTabViewModel()

    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView {
            LocationMapView()
                .tabItem { Label("Map", systemImage: "map") }
            
            LocationListView()
                .tabItem { Label("Locations", systemImage: "building") }
            
            NavigationView { ProfileView() }
                .tabItem { Label("Profile", systemImage: "person") }
        }
        .task {
            try? await CloudKitManager.shared.getUserRecord()
            viewModel.checkIfHasSeenOnboard()
        }
        .sheet(isPresented: $viewModel.isShowingOnboardView) {
            OnboardView()
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
