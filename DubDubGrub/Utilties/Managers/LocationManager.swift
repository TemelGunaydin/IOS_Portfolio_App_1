
import Foundation

final class LocationManager: ObservableObject {
    @Published var locations: [DDGLocation] = []
    var selectedLocation: DDGLocation?
}
