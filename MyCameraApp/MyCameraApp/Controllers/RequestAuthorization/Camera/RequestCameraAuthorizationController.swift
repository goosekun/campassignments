//
//  RequestCameraAuthorizationController.swift
//  MyCameraApp
//
//  Created by Field Employee on 12/14/21.
//

import AVFoundation

enum CameraAuthorizationStatus {
    case notRequested
    case granted
    case unauthorized
}

typealias RequestCameraAuthorizationCompletionHandler = (CameraAuthorizationStatus) -> Void

class RequestCameraAuthorizationController {
    static func requestCameraAuthorization(completionHandler: @escaping RequestCameraAuthorizationCompletionHandler) {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { granted in
                DispatchQueue.main.async {
                    guard granted else {
                        completionHandler(.unauthorized)
                        return
                }
                    completionHandler(.granted)
            }
        })
    }
    
static func getCameraAuthorizationStatus() -> CameraAuthorizationStatus {
    let status = AVCaptureDevice.authorizationStatus(for: .video)
    switch status {
        case .authorized: return .granted
        case .notDetermined: return .notRequested
        default: return .unauthorized
        }
    }
}
