import Foundation

class User: NSCoding

{
    var name: String
    var id: String
    var email: String
    
    init(name: String, id: String, email:String)
    {
        self.name = name
        self.id = id
        self.email = email
    }
    
    func encode(with coder: NSCoder)
    {
        coder.encode(self.name, forKey: "name")
        coder.encode(self.id, forKey: "id")
        coder.encode(self.email, forKey: "email")
    }
    
    required convenience init?(coder: NSCoder)
    {
        let name = coder.decodeObject(forKey: "name") as! String
        let id = coder.decodeObject(forKey: "id") as! String
        let email = coder.decodeObject(forKey: "email") as! String
        
        self.init(name: name, id: id, email: email)
        
    }
    
    
}
