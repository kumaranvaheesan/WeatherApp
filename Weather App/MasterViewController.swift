//
//  MasterViewController.swift
//  Weather App
//
//  Created by kumaran V on 06/03/17.
//  Copyright © 2017 Kumaran. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, WeatherGetterDelegate {

    var detailViewController: DetailViewController? = nil
    var weather: WeatherGetter!
    var weatherList = [Any]()
    var spinner = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSpinner()
        self.navigationItem.title = "Weather"

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(refreshButtonAction))
        weather = WeatherGetter(delegate: self)
        self.startGettingWeatherInformation()        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    func startGettingWeatherInformation()
    {
        spinner.startAnimating()
        weather.getWeatherFromOpenWeatherMap()
    }
    
    func didreceiveWeather(weatherList: [Any]) {
        
         self.weatherList = weatherList
        self.tableView.reloadData()
        spinner.stopAnimating()

        print("received")

    }
    func didNotreceiveWeather(error: NSError) {
        print("didNotGetWeather error: \(error)")
        spinner.stopAnimating()
        let alert = UIAlertController(title: "Error", message: "There seems to be an error connecting to the server. Please try again later.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        self.spinner.stopAnimating()

    }
    func refreshButtonAction()
    {
        self.startGettingWeatherInformation()
    }
    
    
    func setupSpinner(){
        
        spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height:60))
        
        self.spinner.center = self.view.center
        self.spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        let transform: CGAffineTransform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        self.spinner.transform = transform
        self.view.addSubview(spinner)
        spinner.hidesWhenStopped = true
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let weather = weatherList[indexPath.row] as! Weather
                var controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.weather = weather
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let weather = weatherList[indexPath.row] as! Weather
        cell.textLabel!.text = weather.name
        cell.detailTextLabel?.text = "\(Int(round(weather.temp!)))°"
        return cell
    }

}

