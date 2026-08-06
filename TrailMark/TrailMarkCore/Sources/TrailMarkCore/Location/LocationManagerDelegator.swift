import Foundation
import CoreLocation // GPS
import Observation

// MARK: - LOCATION MANAGER EXTENSTION FOR EVENT DELEGATION
extension LocationManager: CLLocationManagerDelegate {
    nonisolated public func locationManager(_ manager:   CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatu) {
        Task {
            @MainActor in self.authorizationStatus = status
        }
    }
    
    nonisolated public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let points = locations.map(TrackPoint.init(location:))
        let last = locations.last
        Task {
            @MainActor in self.currentLocation = last
            if self.isTracking {
                self.track.points.append(contentsOf: points)
            }
        }
    }
    
    nonisolated public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Location failures are common and transient (e.g. fix indoors)
        // We swallow themm so the UI keeps track of the events
    }
}
