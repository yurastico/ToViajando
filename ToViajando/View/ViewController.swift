//
//  ViewController.swift
//  ToViajando
//
//  Created by Yuri Cunha on 19/12/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tripsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViewCell()
        view.backgroundColor = UIColor(red: 30/255, green: 59.0/255, blue: 119.0/255, alpha: 1)
        // Do any additional setup after loading the view.
        
    }

    private func configureTableViewCell() {
        tripsTableView.register(UINib(nibName: "TripTableViewCell", bundle: nil), forCellReuseIdentifier: "TripTableViewCell")
        tripsTableView.register(UINib(nibName: "OfferTableViewCell", bundle: nil), forCellReuseIdentifier: "OfferTableViewCell")
        tripsTableView.delegate = self
        tripsTableView.dataSource = self
    }

    private func navigateToDetail(_ trip: Viagem?) {
        guard let trip else { return }
        let detailController = DetailViewController.instantiate(trip)
        navigationController?.pushViewController(detailController, animated: true)
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numberOfLines ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessaoDeViagens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let viewModel = sessaoDeViagens?[indexPath.section]
        switch viewModel?.type {
        case .destaques:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TripTableViewCell") as? TripTableViewCell else { fatalError()}
            cell.configCell(viewModel?.trips[indexPath.row])
            return cell
        case .ofertas:
            guard let offerCell = tableView.dequeueReusableCell(withIdentifier: "OfferTableViewCell") as? OfferTableViewCell else { fatalError()}
            offerCell.configCell(viewModel?.trips)
            offerCell.delegate = self
            return offerCell
        default:
            return UITableViewCell()
        }
     
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self)
            let header = headerView?.first as? HomeTableViewHeader
            header?.configureView()
            return header
        }
        return nil
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 300
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 475
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = sessaoDeViagens?[indexPath.section]
        switch viewModel?.type {
        case .destaques,.internacional:
            let selectedTrip = viewModel?.trips[indexPath.row]
            navigateToDetail(selectedTrip)
        default:
            break
        }
        
    }
}

extension ViewController: OfferTableViewCellDelegate {
    func didSelectView(_ trip: Viagem?) {
        navigateToDetail(trip)
    }
    
    
}
