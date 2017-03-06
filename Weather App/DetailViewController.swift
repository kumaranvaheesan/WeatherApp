//
//  DetailViewController.swift
//  Weather App
//
//  Created by kumaran V on 06/03/17.
//  Copyright © 2017 Kumaran. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var weatherDescription: UILabel!
    @IBOutlet var Temperature: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    var weather: Weather?


    func configureView() {
        // Update the user interface for the detail item.
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        self.tableView.delegate = self
        self.navigationItem.title = weather?.name
        self.Temperature.text = "\(Int(round((weather?.temp!)!)))°"
        self.weatherDescription.text = weather?.weatherDescription?[0].description
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell")! as! DetailTableViewCell
        switch (indexPath.row){
        case 0:
            cell.title.text = "Humidity:"
            cell.value.text = "\(Int(round((weather?.humidity!)!)))%"
            break
            
        case 1:
            cell.title.text = "Pressure:"
            cell.value.text = "\(Int(round((weather?.pressure!)!))) hPa"
            break
            
        case 2:
            cell.title.text = "Sunrise:"
            cell.value.text = weather?.getSunriseTime() as String?
            break
            
        case 3:
            cell.title.text = "Sunset:"
            cell.value.text = weather?.getSunsetTime() as String?
            break
            
        case 4:
            cell.title.text = "Minimum Temp:"
            cell.value.text = "\(Int(round((weather?.temp_min!)!)))°"
            break
            
        case 5:
            cell.title.text = "Maximum Temp:"
            cell.value.text = "\(Int(round((weather?.temp_max!)!)))°"
            break

        default : break
        
        }
        cell.layer.backgroundColor = UIColor.clear.cgColor
        return cell

    }

    
}

