

import AVFoundation
import Photos

enum PhotoLibraryAuthorizationStatus {
    case notRequested
    case granted
    case unauthorized
}

typealias RequestPhotoLibraryAuthorizationCompletionHandler = (PhotoLibraryAuthorizationStatus) -> Void

class RequestPhotoLibraryAuthorizationController {
    static func requestPhotoLibraryAuthorization(completionHandler: @escaping RequestPhotoLibraryAuthorizationCompletionHandler) {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                guard status == .authorized else {
                    completionHandler(.unauthorized)
                    return
                }
                completionHandler(.granted)
            }
        }
    }
    
static func getPhotoLibraryAuthorizationStatus() -> PhotoLibraryAuthorizationStatus {
    
    let status = PHPhotoLibrary.authorizationStatus()
    switch status {
        case .authorized: return .granted
        case .notDetermined: return .notRequested
        default: return .unauthorized
        }
    }
}
