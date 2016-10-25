//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, FiltersViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var businesses: [Business]!
    var filteredBusinesses: [Business]!
    var searchBar: UISearchBar!
    var searchText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
        
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        
        Business.searchWithTerm(term: "Mexican", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.searchText = ""
            self.filterData(searchText: self.searchText)
            self.tableView.reloadData()
//            if let businesses = businesses {
//                for business in businesses {
//                    print(business.name!)
//                    print(business.address!)
//                }
//            }
            }
        )
    }
    
    func filterData(searchText: String) {
        if searchText.isEmpty {
            filteredBusinesses = businesses
        } else {
            filteredBusinesses = businesses!.filter({(item: Business) -> Bool in
                if (item.name)?.range(of: searchText, options: .caseInsensitive) != nil {
                    return true
                } else {
                    return false
                }
            })
        }
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
        filterData(searchText: searchText)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredBusinesses != nil {
            return filteredBusinesses!.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        
        cell.business = filteredBusinesses[indexPath.row]
        
        return cell
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false;
        searchBar.text = ""
        self.searchText = ""
        filterData(searchText: searchText)
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let filtersViewController = navigationController.topViewController as! FiltersViewController
        
        filtersViewController.delegate = self
    }
    
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : AnyObject]) {
        let categories = filters["categories"] as? [String]
        let deals = filters["deals"] as? Bool
        let sort_temp = filters["sort_by"] as? NSNumber
        let sort_by = (sort_temp?.intValue).map { YelpSortMode(rawValue: $0) }!
        let radius_temp = filters["radius"] as? NSNumber
        var radius = 0
        switch radius_temp!.intValue {
        case 0:
            radius = 482
        case 1:
            radius = 1609
        case 2:
            radius = 8046
        case 3:
            radius = 32186
        default:
            radius = 40233
        }

        Business.searchWithTerm(term: "Restaurants", sort: sort_by, categories: categories, deals: deals, distance: radius) { (businesses: [Business]?, error: Error?) -> Void in
            self.businesses = businesses
            self.searchText = ""
            self.filterData(searchText: self.searchText)
            self.tableView.reloadData()
        }
    }
}
