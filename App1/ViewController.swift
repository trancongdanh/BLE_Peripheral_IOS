//
//  ViewController.swift
//  App1
//
//  Created by Tran Cong Danh on 5/14/20.
//  Copyright © 2020 Tran Cong Danh. All rights reserved.
//

import UIKit
import CoreBluetooth
import AVFoundation
import DanhPeripheralManager

class ViewController: UIViewController, DanhPeripheralManagerDelegate {

    @IBOutlet weak var circleView: UIView!

    // create a sound ID, in this case its the tweet sound.
    let systemSoundID: SystemSoundID = 1016

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        circleView.layer.cornerRadius = circleView.frame.size.width/2
        circleView.clipsToBounds = true

        DanhPeripheralManager.shared.startPeripheralManager(newDelegate: self)
    }

    //MARK: - DanhPeripheralManagerDelegate

    func onPeripheralReceiveWrite(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {

        if let value = requests.first?.value {
            let myBytes = [UInt8](value)
            let valueStr = String(bytes: myBytes, encoding: .utf8)
            if ("RED" == valueStr) {
                circleView.backgroundColor = UIColor.red
                AudioServicesPlaySystemSound (systemSoundID)

            } else if ("GREEN" == valueStr) {
                circleView.backgroundColor = UIColor.green
                AudioServicesPlaySystemSound (systemSoundID)

            } else {
                circleView.backgroundColor = UIColor.gray
                AudioServicesPlaySystemSound (systemSoundID)
            }
        }
    }
}
