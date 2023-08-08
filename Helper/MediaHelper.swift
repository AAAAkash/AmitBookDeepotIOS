

import UIKit
import Photos

class MediaHelper: NSObject {

    var result: ((Bool) -> Void)?

    static func checkForCamera(handler: @escaping ((MediaAction) -> Void)) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3)) {
                let status  = AVCaptureDevice.authorizationStatus(for: .video)
                if status == .authorized {
                    handler(.cameraSuccess)
                    
                } else if status == .notDetermined {
                    AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (status) in
                        if status == true {
                            handler(.cameraSuccess)
                        } else {
                            handler(.permissionError)
                        }
                    })
                } else if status == .restricted || status == .denied {
                    handler(.permissionError)
                }
            }
        } else {
            handler(.cameraNotFound)
        }
    }
    
    static func checkForGalleryAction(handler: @escaping ((MediaAction) -> Void)) {
        let status = PHPhotoLibrary.authorizationStatus()
        if(status == .notDetermined) {
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == .authorized {
                    handler(.gallerySuccess)
                } else {
                    handler(.permissionError)
                }
            })
        } else if (status == .authorized) {
            handler(.gallerySuccess)
        } else if (status == .restricted || status == .denied) {
            handler(.permissionError)
        }
    }

    // MARK: - Show Alert With No Permissions Message

    static func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
    }
    // Helper function inserted by Swift 4.2 migrator.
    static func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
        return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
    }
    // Helper function inserted by Swift 4.2 migrator.
    static func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        return input.rawValue
    }
    
    static func urlExists(_ input: String) -> (Bool, String) {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))

        for match in matches {
            guard let range = Range(match.range, in: input) else { continue }
            let url = input[range]
            return (true, String(url))
        }
        return (false, "")
    }
    
//    func uploadVideo(_ videoDetail: UploadUrlResponseDeatil, file: URL) {
//        let videoURL = videoDetail.uploadURL ?? ""
//        let fileName = videoDetail.fileName ?? ""
//
//        let url = URL(string: videoURL)
//        var request: NSMutableURLRequest? = nil
//        if let url = url {
//            request = NSMutableURLRequest(url: url)
//        }
//
//        let mimetype = file.mimeType()
//        request?.setValue("public-read", forHTTPHeaderField: "x-amz-acl")
//        request?.setValue(mimetype, forHTTPHeaderField: "Content-Type")
//        request?.setValue(fileName, forHTTPHeaderField: "filename")
//
//        request?.httpMethod = "PUT"
//
//        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
//
//
//        let task1 = session.uploadTask(with: request! as URLRequest, fromFile: file)
//        task1.resume()
//    }
    
    static func getThumbnailImage(forUrl url: String) -> UIImage? {
        let videoUrl = URL(string: url)!
        let asset: AVAsset = AVAsset(url: videoUrl)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        
        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60), actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
}

extension MediaHelper: URLSessionDelegate {
     func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
         self.result?(true)
         DispatchQueue.main.async {
             Progress.instance.hide()
         }
     }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        // update progress as needed
           print("progress %f", totalBytesSent/totalBytesExpectedToSend);
    }
 }

 extension MediaHelper: URLSessionTaskDelegate {
     func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
         DispatchQueue.main.async {
             Progress.instance.hide()
         }
         if let error = error {
             print(error.localizedDescription)
             self.result?(false)
             return
         } else {
             self.result?(true)
         }
     }
 }

extension FileManager {
    func clearTmpDirectory() {
        do {
            let tmpDirURL = FileManager.default.temporaryDirectory
            let tmpDirectory = try contentsOfDirectory(atPath: tmpDirURL.path)
            try tmpDirectory.forEach { file in
                let fileUrl = tmpDirURL.appendingPathComponent(file)
                try removeItem(atPath: fileUrl.path)
            }
        } catch {
           //catch the error somehow
        }
    }
}

enum MediaAction: Int {
    case cameraSuccess = 0
    case gallerySuccess
    case cameraNotFound
    case permissionError
}
