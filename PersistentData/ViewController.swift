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
        let dataPath = docsURL.appendingPathComponent("my_data.plist")
        
        let archiver = try? NSKeyedArchiver.archivedData(withRootObject: user, requiringSecureCoding: false)
        
        try? archiver?.write(to: dataPath)
        
       //print(dataPath)
    }
    
    func read(){
        let dataPath = docsURL.appendingPathComponent("my_data.plist")
        
        if let data = try? Data(contentsOf: dataPath){
            do{
                let foundUser = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? User
                print("found: \(foundUser?.name)")
            }catch{}
        }
    }
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //write()
        read()
    }

}

