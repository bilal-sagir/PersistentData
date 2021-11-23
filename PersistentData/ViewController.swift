import UIKit

class ViewController: UIViewController
{
    let myText = """
                    a long text
                    with multiple
                    different long
                    lines.
                    """
    
    func write ()
    {
        let fileManager = FileManager.default
        
        do{
            let myDocs = try fileManager.url(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: false)
            let file: URL = myDocs.appendingPathComponent("file.txt")
            print(file)
            try? myText.write(to: file, atomically: true, encoding: String.Encoding.utf8)
        }catch{print(error)}
        
    }
    
    func read ()
    {
        let fileManager = FileManager.default
        
        do{
            let myDocs = try fileManager.url(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: false)
            let file: URL = myDocs.appendingPathComponent("file.txt")
            
            let content = try String(contentsOf: file)
            
            print(content)
        }catch{print(error)}
        
    }

    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //write()
        read()
        
    }

}

