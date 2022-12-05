protocol NetworkImageRequestDelegate {
    func didUpdateData(imageData: Data)
    func didUpdateProgress(progress: CGFloat)
}

import UIKit

final class NetworkImageRequest: NSObject {
    
    var delegate: NetworkImageRequestDelegate?
    
    static let shared = NetworkImageRequest()
    private override init() {}
    
    func requestData() {
        let urlString = "https://img2.goodfon.ru/wallpaper/original/1/de/pticy-chernyy-fon-zelenye.jpg"
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        session.downloadTask(with: url)
            .resume()
    }
}

extension NetworkImageRequest: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let data = try? Data(contentsOf: location) else { return }
        delegate?.didUpdateData(imageData: data)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        delegate?.didUpdateProgress(progress: progress)
    }
}
