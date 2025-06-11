//
//  NetworkLogger.swift
//  Cook's Corner
//
//  Created by KhuePM on 29/5/25.
//

import Foundation

import Alamofire

public final class NetworkLogger: EventMonitor {
    public let queue = DispatchQueue(label: "networklogger")

    public func requestDidFinish(_ request: Request) {
        print("[Request] \(request.description)")
    }

    public func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        print("[Response] \(response.debugDescription)")
    }
}
