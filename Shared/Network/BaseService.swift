//
//  BaseService.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import Alamofire

class BaseService {

    typealias BaseServiceCompletion<T: ModelProtocol> = (T?, BasicStatusResponseModel?) -> Void
    
    let sessionManager: Session = {
        return Alamofire.Session.default
    }()
    
    let ignoreErrors = [String]()
    
    static func cancellAllRequests() {
        Alamofire.Session.default.session.getTasksWithCompletionHandler { (sessionDataTask, uploadTask, downloadTask) in
            sessionDataTask.forEach { $0.cancel() }
            uploadTask.forEach { $0.cancel() }
            downloadTask.forEach { $0.cancel() }
        }
    }
    
    func performRequest<T: Codable>(_ route: URLRequestConvertible,
                                    _ queue: DispatchQueue,
                                    _ completionHandler: @escaping BaseServiceCompletion<T>,
                                    _ contentType: ContentType = .json) {
        sessionManager
            .request(route)
            .validate(contentType: [contentType.rawValue])
            .responseJSON(queue: queue) { (dataResponse) in
                var result: T?
                var error: BasicStatusResponseModel?
                defer {
                    completionHandler(result, error)
                }
                guard let response = dataResponse.response else {
                    var responseError = 0
                    if let err = dataResponse.error {
                        responseError = err.responseCode ?? 0
                    }
                    let rout = route.urlRequest?.url?.absoluteString ?? "no url"
                    debugPrint("Request: \(rout) - Err Code: \(responseError)")
                    error = BasicStatusResponseModel(statusCode: 502, statusMessage: responseError.description)
                    return
                }
                let rout = route.urlRequest?.url?.absoluteString ?? "no url"
                debugPrint("Request: \(rout) - Code: \(response.statusCode)")
                switch response.statusCode {
                case 200..<300:
                    if let data = dataResponse.data {
                        do {
                            result = try T.toModel(from: data)
                        } catch let parseError {
                            error = BasicStatusResponseModel(statusCode: 502, statusMessage: parseError.localizedDescription)
                        }
                    }
                default:
                    if let data = dataResponse.data {
                        do {
                            error = try BasicStatusResponseModel.toModel(from: data)
                        } catch let parseError {
                            error = BasicStatusResponseModel(statusCode: 502, statusMessage: parseError.localizedDescription)
                        }
                    } else {
                        error = BasicStatusResponseModel(statusCode: 502, statusMessage: "unknow error")
                    }
                }
            }
    }
}
