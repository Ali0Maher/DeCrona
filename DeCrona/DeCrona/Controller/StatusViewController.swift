//
//  ViewController.swift
//  DeCrona
//
//  Created by Ali Maher on 7/27/20.
//  Copyright © 2020 Ali Maher. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {
    
    var countriesData : [countries] = []
    var filteredCountriesData : [countries] = []
    var worldStatus : [countries] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "countriesTableViewCell", bundle: nil), forCellReuseIdentifier: "countriesCell")
        tableView.register(UINib(nibName: "worldTableViewCell", bundle: nil), forCellReuseIdentifier: "worldCell")
        tableView.separatorStyle = .none
        
        fetchingData()

        self.tableView.keyboardDismissMode = .onDrag

        
    }
    
 
    
    func fetchingData (){
        let url = URL(string: "https://coronavirus-19-api.herokuapp.com/countries")
        
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard data != nil else {
                return
            }
            
            do {
                
                let result = try JSONDecoder().decode([countries].self,from :data!)
                print(result)
                
                DispatchQueue.main.async {
                    self.countriesData = result
                    self.worldStatus.append(result[0])
                    self.countriesData.removeFirst()
                    self.filteredCountriesData = result
                    self.filteredCountriesData.removeFirst()

                    self.tableView.reloadData()
                }
                
            } catch {
                print(error)
            }
            
            
        }.resume()
        
    }


    func numbersFormater (number : Int) -> String {
        
        let largeNumber = number
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))!
        return formattedNumber
    }

}


extension StatusViewController : UITableViewDataSource , UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return worldStatus.count

        }
        else{
            return filteredCountriesData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "worldCell", for: indexPath) as! worldTableViewCell
            
            print(countriesData[0].cases)
            cell.totalCases.text = numbersFormater(number : worldStatus[0].cases)
            cell.todayCases.text = numbersFormater(number :worldStatus[0].todayCases)
            cell.totalDeaths.text = numbersFormater(number :worldStatus[0].deaths)
            cell.todayDeaths.text = numbersFormater(number :worldStatus[0].todayDeaths)
            cell.totalRecoverd.text = numbersFormater(number: worldStatus[0].recovered ?? 0)
            cell.selectionStyle = .none;

            return cell
        }
        
        else{
        let cell = tableView.dequeueReusableCell(withIdentifier: "countriesCell", for: indexPath) as! countriesTableViewCell
            cell.countryName.text = filteredCountriesData[indexPath.row].country
            cell.totalCases.text = numbersFormater(number : filteredCountriesData[indexPath.row].cases)
            cell.todayCases.text = numbersFormater(number :filteredCountriesData[indexPath.row].todayCases)
            cell.totalDeaths.text = numbersFormater(number :filteredCountriesData[indexPath.row].deaths)
            cell.todayDeaths.text = numbersFormater(number :filteredCountriesData[indexPath.row].todayDeaths)
            cell.selectionStyle = .none;

            
            
        
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if indexPath.section == 0 {
            
            return 200
        }
        
        else{

            return 140
        }
        
        
    }
    
    
}


extension StatusViewController : UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      // implement your search here!
        guard !searchText.isEmpty else {
            filteredCountriesData = countriesData
            tableView.reloadData()
            return
        }
        filteredCountriesData = countriesData.filter { (countries) -> Bool in
            countries.country.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
        
    }
}
