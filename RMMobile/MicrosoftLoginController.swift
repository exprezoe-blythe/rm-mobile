//
//  MicrosoftLoginController.swift
//  RMMobile
//
//  Created by Dev on 2/13/22.
//

import Foundation
import SwiftUI
import MSAL

struct BrandView : View{
    var body: some View{
        VStack{
            Text("ROBINS & MORTON")
                .font(.title)
                .foregroundColor(.red)
                .bold()
                .padding()
                .border(Color.red, width: 4)
        }
    }
}

class MicrosoftLoginController:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        let btn = UIButton(frame: CGRect(x:20, y: self.view.frame.height - 100, width: self.view.frame.width - 40, height: 52))
        btn.backgroundColor = .red
        btn.setTitle("Signin", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        btn.layer.cornerRadius = 14;
        
//        let brandText = UITextView(frame: CGRect(x:20, y: self.view.frame.height/2 - 52, width: self.view.frame.width - 40, height: 52))
//        brandText.text = "Robins & Morton"
//        brandText.textColor = UIColor(.red)
        
        let brandView = UIHostingController(rootView: BrandView())
        
        brandView.view.translatesAutoresizingMaskIntoConstraints = false
        brandView.view.frame = self.view.bounds
        
        self.view.addSubview(brandView.view)
        self.view.addSubview(btn)
    }
    
    @objc func buttonTapped(_ sender: UIButton){
        do{
            let authority = try MSALB2CAuthority(url: URL(string: "https://login.microsoftonline.com/robinsmorton.onmicrosoft.com")!)
            let pcaConfig = MSALPublicClientApplicationConfig(clientId: "981a7a31-5b88-4ebd-96c0-fee95a41b947", redirectUri: nil, authority: authority)
            let application = try MSALPublicClientApplication(configuration: pcaConfig)
            let webViewParameters = MSALWebviewParameters(authPresentationViewController: self)
            let interactiveParameters = MSALInteractiveTokenParameters(scopes: ["user.read"], webviewParameters: webViewParameters)
            
            application.acquireToken(with: interactiveParameters){
                (result, error) in
                guard let result = result else{
                    print(error!)
                    return
                }
                if let account = result.account.username{
                    print(account)
                    let msAccount = MSAccount(userName: account, userEmail: account)
                    UIApplication.shared.windows.first {$0.isKeyWindow}!.rootViewController = UIHostingController(rootView: ContentView(msAccount: msAccount))
                }
            }
        }catch{
            print(error)
        }
    }
}

struct CustomLogin: UIViewControllerRepresentable{
    typealias UIViewControllerType = MicrosoftLoginController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CustomLogin>) -> MicrosoftLoginController {
        return MicrosoftLoginController()
    }
    
    func updateUIViewController(_ uiViewController: MicrosoftLoginController, context: Context) {
        
    }
}
#if DEBUG
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        CustomLogin()
    }
}
#endif
