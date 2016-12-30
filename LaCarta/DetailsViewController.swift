//
//  DetailsViewController.swift
//  LaCarta
//
//  Created by Caleb on 30/12/2016.
//  Copyright © 2016 Caleb. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

	//MARK: Properties
	@IBOutlet weak var Photo: UIImageView!
	@IBOutlet weak var Winename: UILabel!
	@IBOutlet weak var Description: UILabel!


	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
