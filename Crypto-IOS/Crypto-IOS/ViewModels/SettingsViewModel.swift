import Foundation
import FirebaseAuth


@Observable
final class SettingsViewModel {
    var email: String = ""
    var password: String = ""
    
    var showError = false
    var errorMessage: String = ""
    var isLogedIn = false
    var user: User?
    
    init () {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        
        user = .init(id: currentUser.uid, email: currentUser.email ?? "N/A")
    }
    
    func login() async {
        do {
            let result = try await Auth.auth().signIn(
                withEmail: email, password: password
            )
            
            user = .init(
                id: result.user.uid,
                email: result.user.email ?? "N/A"
            )
            
            email = ""
            password = ""
            
            isLogedIn = true
        } catch {
            showError = true
            errorMessage = error.localizedDescription
        }
        
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            user = nil
        } catch {
            // TODO handle error
        }
    }
}
