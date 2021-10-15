//
//  TestViewController.swift
//  test-gu
//
//  Created by Денис Сизов on 15.10.2021.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var testView: AvatarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testView.image = UIImage(named: "vasia")!
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
