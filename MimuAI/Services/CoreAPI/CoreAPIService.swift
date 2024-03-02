//
//  CoreAPIService.swift
//  MimuAI
//
//  Created by Duy Nguyen on 2/3/2024.
//

import Foundation

class CoreAPIService {
    private let session: URLSession
    private let baseURL: URL
    
    private let requestQueue = DispatchQueue(label: "request.queue")
    
    init(session: URLSession = URLSession.shared, baseURL: URL = URL(string: "https://api.mimu.ai")!) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func visualAuthentication(imageData: Data, completion: @escaping (Result<FacialAuthenticationResponse, Error>) -> Void) {
        let url = baseURL.appendingPathComponent("/authentication")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = imageData
        request.setValue("image/jpeg", forHTTPHeaderField: "Content-Type")
        
        requestQueue.async {
            self.session.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(CoreAPIError.noData))
                    return
                }
                
                do {
                    let response = try JSONDecoder().decode(FacialAuthenticationResponse.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    }
    
    func tts(text: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let url = baseURL.appendingPathComponent("/tts")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = text.data(using: .utf8)
        request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
        
        requestQueue.async {
            self.session.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(CoreAPIError.noData))
                    return
                }
                
                completion(.success(data))
            }.resume()
        }
    }
}
