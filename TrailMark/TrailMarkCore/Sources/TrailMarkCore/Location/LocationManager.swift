import Foundation
import CoreLocation // GPS
import Observation

@MainActor
@Observable
public class LocationManager: NSObject {
    public internal(set) var authorizationStatus: CLAuthorizationStatus
    public private(set) var currentLocation: CLLocation?
    public private(set) var isTracking = false
    public private(set) var track = RouteTrack()
    
    private let locationmanager = CLLocationManager() // CLLM is a NSObj
    
    public override init() {
        authorizationStatus = locationmanager.authorizationStatus
        super.init()
        locationmanager.delegate = self
        
        // Setup Settings for Core Location
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        locationmanager.distanceFilter = 10
    }
    
    public var currentCooridnate: CLLocationCoordinate2D? {
        currentLocation?.coordinate
    }
    
    // MARK: - AUTHORIZATION FLOW
    
    public func requestWhenInUseAuthorization() {
        locationmanager.requestWhenInUseAuthorization()
    }
    
    public func requestOneShotlocation() {
        locationmanager.requestLocation()
    }
    
    // MARK: - RECORDING A TRACK
    
    public func startRecording() {
        track = RouteTrack()
        isTracking = true
        // This method is the one that is going to turn the GPS tracking for continusous reading
        locationmanager.startUpdatingLocation()
    }
    
    @discardableResult
    public func stopRecording() {
        isTracking = false
        return track
    }
    
}



