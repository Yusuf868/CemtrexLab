
import UIKit

class MyNavigationController: WLISideMenuNavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a table view controller
        let tableViewController = MyMenuTableViewController()
        
        // Create side menu
        sideMenu = WLISideMenu(sourceView: view, menuViewController: tableViewController, menuPosition:.left)
        
        // Set a delegate
        sideMenu?.delegate = self
        
        // Configure side menu
        sideMenu?.menuWidth = 220.0
        
        // Show navigation bar above side menu  
        view.bringSubviewToFront(navigationBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MyNavigationController: WLISideMenuDelegate {
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        return true
    }
}
