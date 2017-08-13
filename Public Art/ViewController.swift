//
//  ViewController.swift
//  Public Art
//
//  Created by Tom Kearsley on 8/11/16.
//  Copyright © 2016 Tom Kearsley. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate,UITextFieldDelegate {
    

    @IBOutlet weak var viewsearchheight: NSLayoutConstraint!//71
    @IBOutlet weak var viewsearchtable: UIView!
    @IBOutlet weak var tblsearch: UITableView!
    @IBOutlet weak var lblnoresults: UILabel!
    @IBOutlet weak var txtsearch: UITextField!
    @IBOutlet weak var viewheader: UIView!
    @IBOutlet weak var viewsearch: UIView!
    @IBOutlet weak var MapView: MKMapView!
    
    var distanceSpan:CLLocationDegrees = 100
    let manager = CLLocationManager()
    var windwandPin:Artwork!
    var bombPin:Artwork!
    var elephant_Pin:Artwork!
    var halomoana_Pin:Artwork!
    var rock_Pin:Artwork!
    var pixel_Pin:Artwork!
    var sign_Pin:Artwork!
    var wheel_Pin:Artwork!
    var tukotahi_Pin:Artwork!
    var father_Pin:Artwork!
    var cloud_Pin:Artwork!
    var snake_Pin:Artwork!
    var shiny_Pin:Artwork!
    var don_driver_Pin:Artwork!
    var anchor_stone_Pin:Artwork!
    var cat_Pin:Artwork!
    var colour_pole_Pin:Artwork!
    var collection_Pin:Artwork!
    var imageList = ["Art Collection","Mother of Earth","Bamboozled","Black Figures","Modest Angel"]
    var index = 0
    var count = 0
    var filteredArray = NSArray()
    var arralldata = NSMutableArray()
    var arrartpin = NSMutableArray()
    var artworkList = NSMutableArray()
    var arrartowner = NSMutableArray()
    var arrfikteredowner = NSMutableArray()
    var filteredArrayowner = NSArray()
    var filteredArrayart = NSMutableArray()
    var finalfiltereddata = NSMutableArray()
    
    //DESCRIPTIONS
    let wind_wand_desc = "Len Lye\n \n This is the first large outdoor work built posthumously from plans and drawings left by the artist. The fibreglass mast soars 25 metres into the air and bobs and waves in any breeze. By night it emits a soft red glow. Lye said of his earlier smaller wands “their weight is so lightly balanced that if a bumble bee stood on the ball at the top they would dip a bit….”"
    
    let elephant_desc = "Steve Manning (2014). \n(Click on the image to open in fullscreen)"
    
    let bomb_desc = "Installation by Dale Copeland 2015\n \n The World War 11 German naval mine washed ashore in New Plymouth in February 1943 creating an emergency for 2C Company Bomb Disposal Group who were called on to disarm it. Once disarmed the bomb was displayed in several locations before being offered by the RSA to Port Taranaki. Sculptor Dale Copeland worked with local craftspeople to design the installation."
    let rock_desc = " Matsumi Matuoka \n \n This carved sculpture was created by visiting Japanese artist, Matsumi Matuoka, when she took part in the Te Kupenga Stone Sculpture Society’s Biennial Sculpture Symposium on New Plymouth foreshore. It is carved from Taranaki andesite and was installed at this location in 2013."
    
    let halomoana_desc = "Filipe Tohi 2003 \n \n This 14 metre aluminium work stands out in the city’s CBD and can be all things to all people, according to the artist. Tohi says there is no front, just “inside and outside” so people viewing it from different angles will see different things. The work was commissioned by New Plymouth architect, Terry Boon, as a gift to the city."
    
    let pixel_desc = "Kereama Taepa (2015). \n(Click on the image to open in fullscreen)"
    
    let sign_desc = "John Reynolds    2011 \n \n Standing on the busy Coastal Walkway, the sculpture directs passers by to various local destinations. The high reflection large scale road sign states both the geographically obvious, while summoning up some quirkier cultural highlights. It gives directions to Len Lye’s ‘Trilogy: a flip and two twisters’ which could also reference the surf. Then there’s author Ronald Hugh Morrieson’s ‘Predicament’ and a local youth’s “Zombie Walk”."
    
    let father_desc = "Artist Fridjof Hansen  2011 \n \nThis statue of “the father of New Plymouth” was erected in memory of the chief surveyor of the Plymouth Company who came to New Zealand to choose a site for new settlement for English colonists. Carrington eventually settled in New Plymouth, and held  the positions Member of the House of Representatives, and first chairman of the New Plymouth Harbour Board. The Taranaki branch of the NZ Institute of Surveyors commissioned the statue."
    
    let cloud_desc = "MD Smither (2007). \n(Click on the image to open in fullscreen)"
    let colour_pole_desc = "Michael Parekowhai  2003 \n \n The powder-coated aluminium column refers to the Te Ataarangi system of Maori language learning devised by Katerina te Heikoko Mataira and Ngoingoi Pewhairangi , based on a system for teaching mathematics by Belgian George Cuisenaire. Atarangi is a tribute to the success of the system and a tribute to the renaissance of Te Reo. \n Installed in 2013. (Click on the image to open in fullscreen)"
    let wheel_desc = "Lipika Sen and Prabhjyot Majithia 2014 \n \n The assemblage of giant pinwheels was created with thin sheets of coloured fibreglass mounted with wire and attached to steel holders allowing for free spinning of the wheels with even the slightest breeze. The artists were inspired by their memories of their childhood in India following the firkee-walas who peddled toy pinwheels in the streets."
    let tukotahi_desc = "Rangimarie Maori Aria Arts & Craft Society (1991). \n(Click on the image to open in fullscreen)"
    let snake_desc = "Te Kupenga Stone Symposium Society (2000). \n(Click on the image to open in fullscreen)"
    
    let shiny_desc = "Howard Tuffery 2016 \n \n The stainless steel sculpture positioned on New Plymouth’s foreshore reflects water on one side, land on the other, and sky above.  Tuffery says “to be light on the land is to consider issues of conservation and sustainability with reliance on our land for wealth. To enlighten is to think towards the future and new ways of thinking about ownership, guardianship and land use.”"
    let don_driver_desc = "Don Driver (1966)."
    let collection_desc = "This is a collection of artworks On King St, swipe to the left to see more photos. \nBoulder Bean Anthony Turner (United Kingdom) \nMother of Earth Ming-Sheng Wu (Taiwan) \nBamboozled Welch (2015) \nBlack Figures Sam Harrison (Christchurch) \nModest Angel at Jacobs Ladder John Mclean (Taranaki)"
    let cat_desc = "Don Driver (1960) \n(Click on the image to open in fullscreen)."
    let anchor_desc = "Donated by John Rae. \n(Click on the image to open in fullscreen)"
    
    
    // LOCATIONS
    let windwandcoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.055961,174.072288)
    let bombcoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.057487, 174.054154)
    let elephantcoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.069150, 174.081657)
    let halomoanacoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.058951, 174.073410)
    let rockcoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.010627, 174.178184)
    let pixelcoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.057265, 174.073791)
    let signcoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.058316, 174.051954)
    let wheelcoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.056593, 174.072684)
    let tukotahicoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.056812, 174.072730)
    let fathercoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.059038, 174.070527)
    let cloudcoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.059515,174.073706)
    let snakecoord:CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.057154, 174.072670)
    let shinycoord:CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.05602950741741, 174.0699454416841)
    let don_drivercoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.009391, 174.178753)
    let anchorcoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.055985, 174.072476)
    let catcoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.066965, 174.079661)
    let colour_polecoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.057508,174.072513)
    let collection_coord:CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.058208,174.070732)
    
    @IBAction func returnMap(segue:UIStoryboardSegue) {
    
    
    }
    
    override func viewDidLoad() {
        print(isViewLoaded)
        super.viewDidLoad()
        // tracking user's location
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        viewsearch.isHidden = true
        viewsearchtable.isHidden = true
        tblsearch.isHidden = true
        lblnoresults.isHidden = false
        viewsearchheight.constant = 87
        arralldata = ["Art Collection","Wind Wand","Collateral Damage","Wandering Willow Elephants","Stone Head Sculpture","Halomoana","Swing","Tichi","Big Wave Territory","The Firkee-Wala","Tukotahi","Frederic Alonzo Carrington","Aotearoa","Ngä Hau e Whä","Light on the Land","Southern Cross Mural","Anchor Stone","Cats","Atarangi"]
        
         arrartowner = ["Various Artists","Len Lye","Dale Copland","Steve Manning","Unknown","Sopolemalama Filipe Tohi","Matsumi Matuoka","Kereama Taepa","John Reynolds","Lipika Sen & Prabhjyot","Rangimarie Maori Aria Arts & Craft Society","Fridtjof Hadsen","MD Smither","Te Kupenga Stone Symposium Society","Howard Tuffery","Don Driver","Filipe Tohi","Don Driver","Michael Parekowhai"]
        
        
        
        
        let maskLayer = CAShapeLayer()
        // drawRect(rect: imgart)
        // func drawRect(rect: CGRect) {
        
        let y:CGFloat = 20
        let curveTo:CGFloat = 0
        
        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: y))
        myBezier.addQuadCurve(to: CGPoint(x: self.view.frame.size.width, y: y), controlPoint: CGPoint(x: viewheader.frame.size.width / 2, y: curveTo))
        myBezier.addLine(to: CGPoint(x: self.view.frame.size.width, y: viewheader.frame.size.height))
        myBezier.addLine(to: CGPoint(x: 0, y: viewheader.frame.size.height))
        myBezier.close()
        let context = UIGraphicsGetCurrentContext()
        //context!.setLineWidth(4.0)
        UIColor.yellow.setFill()
        myBezier.fill()
        maskLayer.path = myBezier.cgPath
        viewheader.layer.mask = maskLayer      //  }
        
        let radians: CGFloat = CGFloat(atan2f(Float(viewheader.transform.b), Float(viewheader.transform.a)))
        let degrees: CGFloat = radians * (180 / .pi)
        let transform = CGAffineTransform(rotationAngle: (180 + degrees) * .pi / 180)
        viewheader.transform = transform

        
        
        self.navigationController?.isNavigationBarHidden = true

        // Setting up Map
        
        let distanceSpan:CLLocationDegrees = 2000
        MapView.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(-39.0556253, 174.0752278), distanceSpan,distanceSpan), animated: true)
        MapView.showsUserLocation = true
        MapView.delegate = self
        

        
        // REGISTRY
        
        windwandPin = Artwork(title:"Wind Wand",locationName:"Len Lye",discipline:wind_wand_desc,
                                 coordinate:windwandcoord)
        bombPin = Artwork(title:"Collateral Damage",locationName:"Dale Copland",discipline:bomb_desc,coordinate:bombcoord)
        elephant_Pin = Artwork(title:"Wandering Willow Elephants", locationName:"Steve Manning",discipline:elephant_desc,coordinate:elephantcoord)
        halomoana_Pin = Artwork(title:"Halomoana",locationName:"Sopolemalama Filipe Tohi",discipline:halomoana_desc,coordinate:halomoanacoord)
        rock_Pin = Artwork(title:"Swing",locationName:"Matsumi Matuoka",discipline:rock_desc,coordinate:rockcoord)
        pixel_Pin = Artwork(title:"Tichi",locationName:"Kereama Taepa",discipline:pixel_desc,coordinate:pixelcoord)
        sign_Pin = Artwork(title:"Big Wave Territory",locationName:"John Reynolds",discipline:sign_desc,coordinate:signcoord)
        wheel_Pin = Artwork(title:"The Firkee-Wala",locationName:"Lipika Sen & Prabhjyot",discipline:wheel_desc,coordinate:wheelcoord)
        tukotahi_Pin = Artwork(title:"Tukotahi",locationName:"Rangimarie Maori Aria Arts & Craft Society",discipline:tukotahi_desc,coordinate:tukotahicoord)
        father_Pin = Artwork(title:"Frederic Alonzo Carrington",locationName:"Fridtjof Hadsen",discipline:father_desc,coordinate:fathercoord)
        cloud_Pin = Artwork(title:"Aotearoa",locationName:"MD Smither",discipline:cloud_desc,coordinate:cloudcoord)
        snake_Pin = Artwork(title:"Ngä Hau e Whä",locationName:"Te Kupenga Stone Symposium Society",discipline:snake_desc,coordinate:snakecoord)
        shiny_Pin = Artwork(title:"Light on the Land",locationName:"Howard Tuffery",discipline:shiny_desc,coordinate:shinycoord)
        don_driver_Pin = Artwork(title:"Southern Cross Mural",locationName:"Don Driver",discipline:don_driver_desc,coordinate:don_drivercoord)
        anchor_stone_Pin = Artwork(title:"Anchor Stone",locationName:"Filipe Tohi",discipline:anchor_desc,coordinate:anchorcoord)
        cat_Pin = Artwork(title:"Cats",locationName:"Don Driver",discipline:cat_desc,coordinate:catcoord)
        colour_pole_Pin = Artwork(title:"Atarangi",locationName:"Michael Parekowhai",discipline:colour_pole_desc,coordinate:colour_polecoord)
        collection_Pin = Artwork(title:"Art Collection",locationName:"Various Artists",discipline:collection_desc,coordinate:collection_coord)
        


        
        // ADDING TO MAP
        MapView.addAnnotation(windwandPin)
        MapView.addAnnotation(bombPin)
        MapView.addAnnotation(elephant_Pin)
        MapView.addAnnotation(halomoana_Pin)
        MapView.addAnnotation(pixel_Pin)
        MapView.addAnnotation(sign_Pin)
        MapView.addAnnotation(wheel_Pin)
        MapView.addAnnotation(tukotahi_Pin)
        MapView.addAnnotation(father_Pin)
        MapView.addAnnotation(cloud_Pin)
        MapView.addAnnotation(snake_Pin)
        MapView.addAnnotation(shiny_Pin)
        MapView.addAnnotation(don_driver_Pin)
        MapView.addAnnotation(anchor_stone_Pin)
        MapView.addAnnotation(cat_Pin)
        MapView.addAnnotation(colour_pole_Pin)
        MapView.addAnnotation(collection_Pin) //18
        
        arrartpin.add(windwandPin)
        arrartpin.add(bombPin)
        arrartpin.add(elephant_Pin)
        arrartpin.add(halomoana_Pin)
        arrartpin.add(rock_Pin)
        arrartpin.add(pixel_Pin)
        arrartpin.add(sign_Pin)
        arrartpin.add(wheel_Pin)
        arrartpin.add(tukotahi_Pin)
        arrartpin.add(father_Pin)
        arrartpin.add(cloud_Pin)
        arrartpin.add(snake_Pin)
        arrartpin.add(shiny_Pin)
        arrartpin.add(don_driver_Pin)
        arrartpin.add(anchor_stone_Pin)
        arrartpin.add(cat_Pin)
        arrartpin.add(colour_pole_Pin)
        arrartpin.add(collection_Pin)
        

        
        
    }
    
    
    
    
    func updateList(){
        
        // REGISTRY
        
        windwandPin = Artwork(title:"Wind Wand",locationName:"Len Lye",discipline:wind_wand_desc,
                              coordinate:windwandcoord)
        bombPin = Artwork(title:"Collateral Damage",locationName:"Dale Copland",discipline:bomb_desc,coordinate:bombcoord)
        elephant_Pin = Artwork(title:"Wandering Willow Elephants", locationName:"Steve Manning",discipline:elephant_desc,coordinate:elephantcoord)
        halomoana_Pin = Artwork(title:"Halomoana",locationName:"Sopolemalama Filipe Tohi",discipline:halomoana_desc,coordinate:halomoanacoord)
        rock_Pin = Artwork(title:"Swing",locationName:"Matsumi Matuoka",discipline:rock_desc,coordinate:rockcoord)
        pixel_Pin = Artwork(title:"Tichi",locationName:"Kereama Taepa",discipline:pixel_desc,coordinate:pixelcoord)
        sign_Pin = Artwork(title:"Big Wave Territory",locationName:"John Reynolds",discipline:sign_desc,coordinate:signcoord)
        wheel_Pin = Artwork(title:"The Firkee-Wala",locationName:"Lipika Sen & Prabhjyot",discipline:wheel_desc,coordinate:wheelcoord)
        tukotahi_Pin = Artwork(title:"Tukotahi",locationName:"Rangimarie Maori Aria Arts & Craft Society",discipline:tukotahi_desc,coordinate:tukotahicoord)
        father_Pin = Artwork(title:"Frederic Alonzo Carrington",locationName:"Fridtjof Hadsen",discipline:father_desc,coordinate:fathercoord)
        cloud_Pin = Artwork(title:"Aotearoa",locationName:"MD Smither",discipline:cloud_desc,coordinate:cloudcoord)
        snake_Pin = Artwork(title:"Ngä Hau e Whä",locationName:"Te Kupenga Stone Symposium Society",discipline:snake_desc,coordinate:snakecoord)
        shiny_Pin = Artwork(title:"Light on the Land",locationName:"Howard Tuffery",discipline:shiny_desc,coordinate:shinycoord)
        don_driver_Pin = Artwork(title:"Southern Cross Mural",locationName:"Don Driver",discipline:don_driver_desc,coordinate:don_drivercoord)
        anchor_stone_Pin = Artwork(title:"Anchor Stone",locationName:"Filipe Tohi",discipline:anchor_desc,coordinate:anchorcoord)
        cat_Pin = Artwork(title:"Cats",locationName:"Don Driver",discipline:cat_desc,coordinate:catcoord)
        colour_pole_Pin = Artwork(title:"Atarangi",locationName:"Michael Parekowhai",discipline:colour_pole_desc,coordinate:colour_polecoord)
        collection_Pin = Artwork(title:"Art Collection",locationName:"Various Artists",discipline:collection_desc,coordinate:collection_coord)
        
        
        artworkList.add(anchor_stone_Pin)
        artworkList.add(cloud_Pin)
        artworkList.add(colour_pole_Pin)
        artworkList.add(collection_Pin)// Bamboozled
        artworkList.add(sign_Pin)
        artworkList.add(collection_Pin)// Black Figures
        artworkList.add(cat_Pin)
        artworkList.add(bombPin)
        artworkList.add(father_Pin)
        artworkList.add(halomoana_Pin)
        artworkList.add(shiny_Pin)
        artworkList.add(collection_Pin)// Modest Angel
        artworkList.add(collection_Pin) //Mother of Earth
        artworkList.add(snake_Pin)
        artworkList.add(don_driver_Pin)
        artworkList.add(rock_Pin)
        artworkList.add(wheel_Pin)
        artworkList.add(pixel_Pin)
        artworkList.add(tukotahi_Pin)
        artworkList.add(elephant_Pin)
        artworkList.add(windwandPin)
        
    }
    
    
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
//    {
//        if annotation is MKUserLocation {return nil}
//        
//        let reuseId = "pin"
//        
//        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
//        if pinView == nil {
//            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//            pinView!.canShowCallout = true
//            pinView!.animatesDrop = true
//            pinView!.calloutOffset = CGPoint(x: -5, y: 5)
//            let calloutButton = UIButton(type: .detailDisclosure)
//            pinView!.rightCalloutAccessoryView = calloutButton
//            pinView?.image = UIImage (named: "Green")
//            pinView!.annotation = annotation
//            pinView!.sizeToFit()
//        }
//        else {
//            pinView!.annotation = annotation
//        }
//        
//        
//        return pinView
//    }


    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !annotation.isKind(of: MKUserLocation.self) else {
            
            return nil
        }
        
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView!.canShowCallout = true
        }
        else {
            annotationView!.annotation = annotation
        }
        
       // let imgdis = UIImageView()
        //annotationView?.frame = cgrect
        annotationView!.image = UIImage(named: "map1 alt ")
//        imgdis.frame = CGRect (x: 9, y: 10, width: (annotationView?.frame.size.width)!-18, height: (annotationView?.frame.size.height)!-36)
//        imgdis.layer.cornerRadius=imgdis.frame.size.width/2
//        imgdis.layer.masksToBounds=true
//        if index < imageList.count - 1
//        {
//            if index == imageList.count - 1
//            {
//                index = 0
//            }
//            else
//            {
//                
//            }
//            index = index + 1
//            imgdis.image = UIImage(named: imageList[index])
//        }
//
//        annotationView?.addSubview(imgdis)
//        //annotationView?.backgroundColor = UIColor .blue
        
        return annotationView
        
    
        
    }
    
    

    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            if let artworkPin = view.annotation as? Artwork {
                performSegue(withIdentifier: "no", sender: artworkPin)
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "no" {
                if let artworkPin = sender as? Artwork {
                    let ViewTwo = segue.destination as! ViewTwo
                    ViewTwo.artworkPin = artworkPin
                }
            }
        }
        
        func drawRect(rect: CGRect) {
            
            let y:CGFloat = 20
            let curveTo:CGFloat = 0
            
            let myBezier = UIBezierPath()
            myBezier.move(to: CGPoint(x: 0, y: y))
            myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: curveTo))
            myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height))
            myBezier.addLine(to: CGPoint(x: 0, y: rect.height))
            myBezier.close()
            let context = UIGraphicsGetCurrentContext()
            context!.setLineWidth(4.0)
            UIColor.yellow.setFill()
            myBezier.fill()
        }
}

    @IBAction func btncancel(_ sender: Any)
    {
        viewsearch .isHidden = true
        viewsearchtable .isHidden = true
        txtsearch.text=""
    }
    
    //MARK: - Search Task
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let string1 = string
        let string2 = txtsearch.text
        var finalString = ""
        
        if string.characters.count > 0 { // if it was not delete character
            finalString = string2! + string1
        }
        else if (string2?.characters.count)! > 0{
            // if it was a delete character
            
            finalString = String(string2!.characters.dropLast())
        }
        self .filteredArray1(searchString: finalString as NSString)
        //   filteredArray(finalString)// pass the search String in this method
        return true
    }
    
    
    func filteredArray1(searchString:NSString){// we will use NSPredicate to find the string in array
        let predicate = NSPredicate(format: "SELF contains[c] %@",searchString) // This will give all element of array which contains search string
        
       
        if searchString.length==0
        {
            lblnoresults .isHidden = false
            tblsearch .isHidden = true
        }
        else
        {
            arrfikteredowner = NSMutableArray()
            finalfiltereddata = NSMutableArray()
            // we will use NSPredicate to find the string in array
            let predicate = NSPredicate(format: "SELF contains[c] %@",searchString)
            filteredArray = arralldata.filtered(using: predicate) as NSArray
            filteredArrayowner = arrartowner.filtered(using: predicate) as NSArray
            for i in 0..<filteredArray.count
            {
                let strname = filteredArray[i] as! String
                for j in 0..<arralldata.count
                {
                    let str = arralldata[j] as! String
                    if  strname == str
                    {
                        let dictadd = NSMutableDictionary()
                        dictadd .setValue(strname, forKey: "imagename")
                        dictadd .setValue(arrartowner[j], forKey: "ownername")
                        dictadd .setValue("1", forKey: "type")
                        finalfiltereddata .add(dictadd)
                    }
                }
            }
            
            for s in 0..<finalfiltereddata.count
            {
                let lastdata = finalfiltereddata[s]
                for k in 0..<finalfiltereddata.count
                {
                    let firstdata = finalfiltereddata[k]
                    
                }
                
            }
            
            for i in 0..<filteredArrayowner.count
            {
                let strname = filteredArrayowner[i] as! String
                for j in 0..<arrartowner.count
                {
                    let str = arrartowner[j] as! String
                    if  strname == str
                    {
                        let dictadd = NSMutableDictionary()
                        dictadd .setValue(arralldata[j], forKey: "imagename")
                        dictadd .setValue(strname, forKey: "ownername")
                        dictadd .setValue("0", forKey: "type")
                        finalfiltereddata .add(dictadd)
                    }
                }
            }
            if filteredArray.count == 0 && filteredArrayowner.count==0
            {
                lblnoresults .isHidden = false
                tblsearch .isHidden = true
                viewsearchheight .constant = 87
            }
            else
            {
                lblnoresults .isHidden = true
                tblsearch .isHidden = false
                let introwheight = finalfiltereddata.count as NSInteger
                let intda = 54
                let total = introwheight * intda
                viewsearchheight .constant = CGFloat(total)
                if viewsearchheight.constant>self.view.frame.size.height - 100
                {
                    viewsearchheight .constant = self.view.frame.size.height - 100
                }
            }

        }
        
        print(finalfiltereddata)
        tblsearch .reloadData()
    }
    
    @IBAction func btnsearch(_ sender: Any)
    {
        viewsearchheight .constant = 84
        viewsearch .isHidden = false
        viewsearchtable .isHidden = false
        tblsearch .isHidden = true
        lblnoresults .isHidden = false
    }
}

extension ViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let arrindex = finalfiltereddata .object(at: indexPath.row) as! NSDictionary
        
        let type = arrindex .value(forKey: "type") as! NSString
        let lbltitle : UILabel? = cell.contentView.viewWithTag(1) as? UILabel
        let lblartist : UILabel? = cell.contentView.viewWithTag(2) as? UILabel
        if type == "1"
        {
            lbltitle?.text = arrindex .value(forKey: "imagename") as? String
            lblartist?.text = arrindex .value(forKey: "ownername") as? String
        }
        else
        {
            lbltitle?.text = arrindex .value(forKey: "ownername") as? String
            lblartist?.text = arrindex .value(forKey: "imagename") as? String
        }
        return cell
    }
}



extension ViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return finalfiltereddata.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        txtsearch .resignFirstResponder()
        viewsearch .isHidden = true
        viewsearchtable .isHidden = true
        txtsearch.text=""
//        let checkcount = finalfiltereddata .object(at: indexPath.row)
//        as AnyObject
//        if checkcount .isKind(of: NSNull())
//        {
//            
//        }
//        else
//        {
        if finalfiltereddata.count==0
        {
            
        }
        else
        {
            let arrindex = finalfiltereddata .object(at: indexPath.row) as! NSDictionary
            for i in 0..<arrartpin.count
            {
                let artworkPin: Artwork = arrartpin[i] as! Artwork
                if artworkPin.title == arrindex .value(forKey: "imagename") as? String
                {
                    performSegue(withIdentifier: "no", sender: artworkPin)
                    return
                }
            }
        }
        
           // txtsearch.text=""
      //  }
    }
}



