import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        defaults.set("true", forKey: "firstUsed")
        defaults.synchronize()
        
        // < 100kb
        
        if let useStatus = defaults.object(forKey: "firstUsed")
        {
            print("status is : \(useStatus)")
            
        }
    }

}

