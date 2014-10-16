//
//  image2ViewController.swift
//  Suram
//

//  Copyright (c) 2014 Kavya Suram. All rights reserved.
//

import UIKit

class image2ViewController: UIViewController {

    @IBOutlet weak var statueName: UILabel!
    @IBOutlet weak var statueImage: UIImageView!
    
    @IBOutlet weak var statueLocation: UITextField!
    @IBOutlet weak var statueDesc: UITextView!
    private var path:String?
    
    @IBOutlet weak var seemoreB: UIButton!
    private var position=1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let path = NSBundle.mainBundle().pathForResource("statueinfo", ofType:"plist") as String?
        let alldata = NSArray(contentsOfFile: path!)
        let rowdata = alldata[position] as [String:String]
        
        let imagepath = NSBundle.mainBundle().pathForResource("ourladiesofrockies", ofType:"jpg") as String?
        statueImage.image = UIImage(contentsOfFile: imagepath!)
        
        //assign the text View with description from the plist
        statueDesc.text=rowdata["description"]
        statueName.text=rowdata["name"]
        statueLocation.text=rowdata["location"]
        statueDesc.editable = false
        statueDesc.backgroundColor = UIColor.clearColor()
        
        statueDesc.font = UIFont(name: "Calibri", size: 9)
        self.view.addSubview(statueDesc)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonTapped(theButton:UIButton) {
        position=1
        let path = NSBundle.mainBundle().pathForResource("statueinfo", ofType:"plist") as String?
        let alldata = NSArray(contentsOfFile: path!)
        let rowdata = alldata[position] as [String:String]
        
        statueDesc.frame=CGRectMake(35, 307, 240,200);
        statueDesc.text=rowdata["description"]
        theButton.hidden=true
        
        
        
    }
}
