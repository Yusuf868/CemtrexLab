
import UIKit
struct VenueModal {
    var id: String
    var name: String
}

class ViewController: UIViewController{
    var venuesArray = [VenueModal]()
    @IBOutlet weak var tableView : UITableView!
    var db = DBHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
        apiCall()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toggleSideMenuBtn(_ sender: UIBarButtonItem) {
        toggleSideMenuView()
    }
    func apiCall() {
        if let url = URL(string:"https://api.foursquare.com/v2/venues/search?ll=40.7484,-73.9857&oauth_token=NPKYZ3WZ1VYMNAZ2FLX1WLECAWSMUVOQZOIDBN53F3LVZBPQ&v=20180616") {
            let session = URLSession(configuration:
             .default).dataTask(with: url) { (data, response, error) in
                guard let data = data else {return}
                do {
                    let jsonDictionary = try
                     JSONSerialization.jsonObject(with: data, options: [])
                     as! [String: Any]
                    self.parseData(dict: jsonDictionary)
                } catch {
                      print(error.localizedDescription)
    } }
            session.resume()
        }
    }
    func parseData(dict: [String: Any]) {
        if let responseDictionary = dict["response"] as? [String: Any],
           let venuesArray = responseDictionary["venues"] as? [[String:
            Any]] {
    //
    for userDictionary in venuesArray {
                    let id = userDictionary["id"] as! String
                    let name = userDictionary["name"] as! String
                    let venue = VenueModal(id: id, name: name)
                    self.venuesArray.append(venue)

                        if let categories = userDictionary["categories"] as?
                         [[String: Any]] {
                        let dictionary = categories.first
                       // print(dictionary!)
                            print(id)
                            print(name)
                          // db.insert(id: id, name: name)
    //here data is save to database once so i comment this part
    }
    }
                //U got your required values here
                //print(self.venuesArray)
            }
    }
}


extension ViewController: WLISideMenuDelegate{
    // MARK: - ENSideMenu Delegate
       func sideMenuWillOpen() {
           print("sideMenuWillOpen")
       }
       
       func sideMenuWillClose() {
           print("sideMenuWillClose")
       }
       
       func sideMenuShouldOpenSideMenu() -> Bool {
           print("sideMenuShouldOpenSideMenu")
           return true
       }
       
       func sideMenuDidClose() {
           print("sideMenuDidClose")
       }
       
       func sideMenuDidOpen() {
           print("sideMenuDidOpen")
       }
}
