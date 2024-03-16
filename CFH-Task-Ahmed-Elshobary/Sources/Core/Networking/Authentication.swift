//
//
//

import Foundation
import Alamofire


struct AccessTokenResponse: Decodable {
    let access_token: String?
    var token_type: String?
    var expires_in: Double?
}


class Authentication: BaseViewModel {
    
    static let shared = Authentication()
    
    private let tokenKey = "token"
    
     var token: String? {
        get {
            return UserDefaults.standard.string(forKey: tokenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: tokenKey)
        }
    }
    
    func getAuth() -> String {
        guard let token = token else { return "" }
        return "Bearer \(token)"
    }
    
    func saveToken(token: String) {
        self.token = token
    }
    
    func clearToken() {
        self.token = nil
    }
    
    func refreshToken(completion: @escaping (Bool) -> Void) {}
}
