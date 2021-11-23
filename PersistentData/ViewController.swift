import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!

    var contactsArr : Array<String> = ["steve", "sarah", "adam"]
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        read()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        contactsArr.append(textField.text!)
        tableView.reloadData()
        write()
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactsArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")!
        cell.textLabel?.text = contactsArr[indexPath.row]
        return cell
        
    }
    
    func getFile () -> URL?
    {
        let fileManager = FileManager.default
        do{
            let docsDir = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            //print(docsDir)
            return docsDir.appendingPathComponent("my_contacts.txt")
            
        }catch{return nil}
        
    }
    
    func write (){
        let contactsString = contactsArr.joined(separator: "\n")
        
        if let file = getFile()
        {
            
            try? contactsString.write(to: file, atomically: true, encoding: .utf8)
        }
        
    }
    
    func read(){
        contactsArr = []
        
        do {
            if let file = getFile() {
                let contactsString = try String(contentsOf: file)
                contactsArr = contactsString.components(separatedBy: "\n")
            }
        }catch{}
    }
}

