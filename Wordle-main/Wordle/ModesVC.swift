
import UIKit

class ModesVC: UIViewController {

    @IBOutlet var mode: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mode.isOn = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func modeChanged(_ sender: Any) {
        switchModes()
    }
    func switchModes() {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let interfaceStyle = window?.overrideUserInterfaceStyle ==      .unspecified ? UIScreen.main.traitCollection.userInterfaceStyle : window?.overrideUserInterfaceStyle
        if interfaceStyle != .dark {
        window?.overrideUserInterfaceStyle = .dark
        } else {
        window?.overrideUserInterfaceStyle = .light
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
