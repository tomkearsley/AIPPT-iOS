//
//  TableInfoView.swift
//  Public Art
//
//  Created by Tom Kearsley on 20/07/17.
//  Copyright © 2017 Tom Kearsley. All rights reserved.
//
import Foundation
import UIKit
import MapKit
import Contacts


class TableInfoView: UIViewController {
    
    @IBAction func backBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "returnMap", sender: self)
    }
    
    
    
    
    
    @IBOutlet weak var viewzoomimage: UIView!
    @IBOutlet weak var imgart: UIImageView!
    @IBOutlet weak var collection: UICollectionView!
    
    @IBOutlet weak var viewmain: UIView!
    var imageList = ["Art Collection","Mother of Earth","Bamboozled","Black Figures","Modest Angel"]
    var index = 0
    var arrimagezoom = NSMutableArray()
    
    
    // left-swipe triggers this func
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        if artworkPin.title! == "Art Collection" {
            // yes, so let's adjust the index and show a new image (if we're not at the beginning of the list)
            if index > 0 {
                index = index - 1
                art_image.image = UIImage(named: arrimagezoom[index] as! String)
            }
        }
        // is the current artworkPin.title "Collection" ?
        
        
    }
    
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        // is the current artworkPin.title "Collection" ?
        if artworkPin.title! == "Art Collection" {
            arrimagezoom = ["Art Collection","Mother of Earth","Bamboozled","Black Figures","Modest Angel"]
            // yes, so let's adjust the index and show a new image (if we're not at the end of the list)
            if index < imageList.count - 1 {
                index = index + 1
                art_image.image = UIImage(named: arrimagezoom[index] as! String)
            }
        }
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        
        viewzoomimage .isHidden = false
        if artworkPin.title! == "Art Collection" {
            arrimagezoom = ["Art Collection","Mother of Earth","Bamboozled","Black Figures","Modest Angel"]
        }
        collection .reloadData()
        collection.setNeedsLayout()
        //collection.layoutIfNeeded()
        collection.scrollToItem (at: IndexPath (item: index, section: 0),at: [], animated: false)
        //        let imageView = UIImage (named: <#T##String#>)
        //
        //        let newImageView = UIImageView(image: imageView.image)
        //
        //        newImageView.frame = self.view.frame
        //
        //        newImageView.backgroundColor = .black
        //        newImageView.contentMode = .scaleAspectFit
        //        newImageView.isUserInteractionEnabled = true
        //        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        //        newImageView.addGestureRecognizer(tap)
        //        self.view.addSubview(newImageView)
    }
    
    func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
    
    @IBOutlet weak var art_image: UIImageView!
    @IBOutlet weak var map_button: UIButton!
    
    
    @IBOutlet weak var art_desc: UILabel!
    @IBOutlet weak var art_title: UILabel!
    var artworkPin: Artwork!
    
    
    @IBAction func map_button(_ sender: AnyObject) {
        let addressDict = [CNPostalAddressStreetKey:artworkPin.title!]
        let coord = artworkPin.coordinate
        let placemark = MKPlacemark(coordinate: coord, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark:placemark)
        let options = [MKLaunchOptionsDirectionsModeKey:
            MKLaunchOptionsDirectionsModeDriving]
        mapItem.openInMaps(launchOptions: options)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        art_title.text = artworkPin.title
        art_desc.text = artworkPin.discipline
        art_image.image = UIImage(named:(artworkPin.title!))
        index = 0
        if artworkPin.title! == "Art Collection" {
            arrimagezoom = ["Art Collection","Mother of Earth","Bamboozled","Black Figures","Modest Angel"]
            art_image.image = UIImage(named: arrimagezoom[index] as! String)
            // arrimagezoom .add((artworkPin.title!))
        }
        arrimagezoom .add((artworkPin.title!))
        
        let maskLayer = CAShapeLayer()
        collection.dataSource = self as! UICollectionViewDataSource;
        collection.delegate = self as! UICollectionViewDelegate;
        // drawRect(rect: imgart)
        // func drawRect(rect: CGRect) {
        viewzoomimage .isHidden = true
        let y:CGFloat = 20
        let curveTo:CGFloat = 0
        
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: y))
        myBezier.addQuadCurve(to: CGPoint(x: self.view.frame.size.width, y: y), controlPoint: CGPoint(x: viewmain.frame.size.width / 2, y: curveTo))
        myBezier.addLine(to: CGPoint(x: self.view.frame.size.width, y: self .view .bounds .size .height - 334))
        myBezier.addLine(to: CGPoint(x: 0, y: self .view .bounds .size .height - 334))
        myBezier.close()
        let context = UIGraphicsGetCurrentContext()
        //context!.setLineWidth(4.0)
        UIColor.yellow.setFill()
        myBezier.fill()
        maskLayer.path = myBezier.cgPath
        viewmain.layer.mask = maskLayer      //  }
        
        let radians: CGFloat = CGFloat(atan2f(Float(viewmain.transform.b), Float(viewmain.transform.a)))
        let degrees: CGFloat = radians * (180 / .pi)
        let transform = CGAffineTransform(rotationAngle: (180 + degrees) * .pi / 180)
        viewmain.transform = transform
        viewmain.frame = CGRect (x: 0, y: 0, width: UIScreen .main .bounds .width, height: self .view .bounds .size .height - 334)
        //  viewmain.transform =    CGAffineTransform (rotationAngle: 2)
        let radians1: CGFloat = CGFloat(atan2f(Float(art_image.transform.b), Float(art_image.transform.a)))
        let degrees1: CGFloat = radians1 * (0 / .pi)
        let transform1 = CGAffineTransform(rotationAngle: (180 + degrees1) * .pi / 180)
        art_image.transform = transform1
    }
    
    
    @IBAction func btnback(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    @IBAction func btnhideview(_ sender: Any)
    {
        viewzoomimage .isHidden = true
    }
    
    
}

extension TableInfoView : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
        let imgzoom : UIImageView? = cell.contentView.viewWithTag(1) as? UIImageView
        imgzoom?.image = UIImage (named: arrimagezoom[indexPath.row] as! String)
        return cell
    }
}

extension TableInfoView : UICollectionViewDelegate
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrimagezoom.count
    }
    
}

extension TableInfoView : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(self.view.frame.size.width - 10), height: CGFloat(self.view.frame.size.height))
    }
    
    @objc(collectionView:layout:insetForSectionAtIndex:) func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 5, 0, 5)
    }
    @objc(collectionView:layout:minimumLineSpacingForSectionAtIndex:) func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
