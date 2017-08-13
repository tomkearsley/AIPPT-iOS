//
//  AboutVC.swift
//  Public Art
//
//  Created by Pankaj Sakariya on 06/03/17.
//  Copyright © 2017 Tom Kearsley. All rights reserved.
//

import UIKit
import MessageUI

class AboutVC: UIViewController,MFMailComposeViewControllerDelegate {

    @IBOutlet weak var viewart: UIView!
    @IBOutlet weak var lblaboutus: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let y:CGFloat = 20
        let curveTo:CGFloat = 0
        let maskLayer = CAShapeLayer()
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: y))
        myBezier.addQuadCurve(to: CGPoint(x: self.view.frame.size.width, y: y), controlPoint: CGPoint(x: viewart.frame.size.width / 2, y: curveTo))
        myBezier.addLine(to: CGPoint(x: self.view.frame.size.width, y: self .view .bounds .size .height - 418))
        myBezier.addLine(to: CGPoint(x: 0, y: self .view .bounds .size .height - 418))
        myBezier.close()
        let context = UIGraphicsGetCurrentContext()
        //context!.setLineWidth(4.0)
        UIColor.yellow.setFill()
        myBezier.fill()
        maskLayer.path = myBezier.cgPath
        viewart.layer.mask = maskLayer      //  }
        
        let radians: CGFloat = CGFloat(atan2f(Float(viewart.transform.b), Float(viewart.transform.a)))
        let degrees: CGFloat = radians * (180 / .pi)
        let transform = CGAffineTransform(rotationAngle: (180 + degrees) * .pi / 180)
        viewart.transform = transform
        viewart.frame = CGRect (x: 0, y: 0, width: UIScreen .main .bounds .width, height: self .view .bounds .size .height - 418)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func btnmenu(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var btnmaik: UIButton!
    
    @IBAction func btnmail(_ sender: Any)
    {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["info@nicehotel.co.nz"])
        mailComposerVC.setSubject("Art in Public Places App")
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
