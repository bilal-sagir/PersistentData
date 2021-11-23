import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var myImgView : UIImageView!

    func imgUrl () -> URL
    {
        let docsDir = try? FileManager.default.url(for: .documentDirectory,
                                                      in: .userDomainMask,
                                                      appropriateFor: nil,
                                                      create: false)
        print(docsDir)
        return docsDir!.appendingPathComponent("myImg.jpeg")
    }
    
    @IBAction func saveImg()
    {
        let imgData = myImgView.image?.jpegData(compressionQuality: 1.0)
        do{
            try? imgData?.write(to: imgUrl())
            myImgView.image = nil
        }
    }
    
    @IBAction func fetchImg(){
        if let data = try? Data(contentsOf: imgUrl())
        {
            let img = UIImage(data: data)
            myImgView.image = img
        }
               
    }
}

