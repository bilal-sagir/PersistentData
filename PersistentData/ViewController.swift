import UIKit

class ViewController: UIViewController
{
    let user = User(name: "blllll", id: "sssss", email: "bs@gmail.com")
    
    let docsURL = try! FileManager.default.url(for: .documentDirectory,
                                                  in: .userDomainMask,
                                                  appropriateFor: nil,
                                                  create: false)
    
    func write()
    {
        
    }
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

}

