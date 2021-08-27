

import UIKit

class DetailsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        let logoutBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "open-menu"), style: .done, target: self, action: #selector(handleSaveBtn))
        logoutBarButtonItem.tintColor = .white
        self.navigationItem.leftBarButtonItem  = logoutBarButtonItem
    }

         
    @objc private func handleSaveBtn(){
        toggleSideMenuView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

