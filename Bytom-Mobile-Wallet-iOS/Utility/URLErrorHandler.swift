//
//  URLErrorHandler.swift
//  Bytom-Mobile-Wallet-iOS
//
//  Created by 曲终叶落 on 2018/7/5.
//  Copyright © 2018年 曲终叶落. All rights reserved.
//

import Foundation
import PromiseKit

class URLErrorHandler {
    private weak var interface: UIInterface?
    private var httpErrorHandler: ((HTTPClientError) -> Void)?
    
    func handle(error: Error, interface: UIInterface?, httpErrorHandler: ((HTTPClientError) -> Void)? = nil) {
        self.interface = interface
        self.httpErrorHandler = httpErrorHandler
        if error is PMKHTTPError {
            let urlError = error as! PMKHTTPError
            switch urlError {
            case PMKHTTPError.badStatusCode( _, let data, let response):
                handleBadResponse(data: data, response: response)
                break
            }
        } else {
            interface?.alertNetworkError()
            print(error)
        }
    }
    
    private func handleBadResponse(data: Data?, response: URLResponse?) {
        if let response = response {
            if response is HTTPURLResponse {
                if let data = data {
                    let error = try? JSONDecoder().decode(HTTPClientError.self, from: data)
                    if let error = error {
                        if let httpErrorHandler = self.httpErrorHandler {
                            httpErrorHandler(error)
                        }else{
                            interface?.toast(error.message)
                        }
                    }else{
                        interface?.alertNetworkError()
                    }
                }else{
                    interface?.alertNetworkError()
                }
            }
        }
    }
}
