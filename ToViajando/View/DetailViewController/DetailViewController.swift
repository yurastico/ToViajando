//
//  DetailViewController.swift
//  ToViajando
//
//  Created by Yuri Cunha on 31/12/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var tripImage: UIImageView!
    
    @IBOutlet weak var tripSubtitleLabel: UILabel!
    
    @IBOutlet weak var tripTitleLabel: UILabel!
    
    @IBOutlet weak var tripPriceLabel: UILabel!
    @IBOutlet weak var tripNightsLabel: UILabel!
    var trip: Viagem?
    
    @IBOutlet weak var tripDiscontPriceLabel: UILabel!
    class func instantiate(_ trip: Viagem) ->  DetailViewController {
        let detailViewController = DetailViewController(nibName: String(describing: self), bundle: nil)
        detailViewController.trip = trip
        return detailViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

    private func configureView() {
        tripImage.image = UIImage(named: trip?.asset ?? "")
    
        tripTitleLabel.text = trip?.titulo
        tripSubtitleLabel.text = trip?.subtitulo
        tripPriceLabel.text = "R$ \(trip?.preco ?? 0)"
        let atributtedString = NSMutableAttributedString(string: "R$ \(trip?.precoSemDesconto ?? 0)")
        atributtedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0,atributtedString.length))
        tripDiscontPriceLabel.attributedText = atributtedString
        
        if let numberOfDays = trip?.diaria, let numberOfGuests = trip?.hospedes {
            let days = numberOfDays == 1 ? "Diaria" : "Diarias"
            let guests = numberOfGuests == 1 ? "Pessos" : "Pessoas"
            tripNightsLabel.text = "\(numberOfDays) \(days) - \(numberOfGuests) \(guests)"
        }
        
    }
}
