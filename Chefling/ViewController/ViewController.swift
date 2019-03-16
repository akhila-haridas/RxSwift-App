//
//  ViewController.swift
//  Chefling
//
//  Created by Akhila Haridas on 14/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import UIKit
import RxSwift
import SDWebImage


class ViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var btnDirections: UIButton?
    @IBOutlet weak var lblLikes: UILabel?
    @IBOutlet weak var activityLoader: UIActivityIndicatorView?
    @IBOutlet weak var noDataView: UIView?
    @IBOutlet weak var lblError: UILabel?
    var headerView: RecipeHeaderView?
    var footerView: RecipeFooterView?
    let imageView = UIImageView()
    let tableViewModel = IngredientsTableViewModel()
    private let disposeBag = DisposeBag()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView = RecipeHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kHeaderViewHeight))
        footerView = RecipeFooterView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kFooterHeight))
        setNavBar()
        setTableView()
        setHeaderImageView()
        setFooter()
        bindTableViewModel()
        getApiResponse()
    }
    
    func setNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func setTableView() {
        tableView?.estimatedRowHeight = UITableView.automaticDimension
        tableView?.tableHeaderView = nil
        tableView?.contentInset = UIEdgeInsets(top: kImageHeight, left: 0, bottom: 0, right: 0)
        tableView?.tableHeaderView = headerView
        tableView?.addSubview(headerView!)
        tableView?.tableFooterView = nil
        tableView?.tableFooterView = footerView
        tableView?.addSubview(footerView!)
        tableView?.delegate = self
    }
    
    func setHeaderImageView() {
        imageView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kImageHeight)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
    }
    
    func setFooter() {
        Utils.setViewCornerRadius(view: btnDirections)
        btnDirections?.layer.backgroundColor = UIColor.lightGreenColor().cgColor
        btnDirections?.setTitleColor(UIColor.white, for: .normal)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = kImageHeight - (scrollView.contentOffset.y + kImageHeight)
        if y <= 64 {
            self.navigationController?.navigationBar.backgroundColor = UIColor.navBarDefault()
            self.navigationController?.navigationBar.tintColor = UIColor.black
            UIApplication.shared.statusBarView?.backgroundColor = UIColor.navBarDefault()

        } else {
            self.navigationController?.navigationBar.backgroundColor = UIColor.clear
            self.navigationController?.navigationBar.tintColor = UIColor.white
            UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear
        }
        
        let height = min(y, 500)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
    
    func bindTableViewModel() {
        tableViewModel.ingredientCells.bind(to: self.tableView!.rx.items){ tableView, index, viewModel in
            let indexPath = IndexPath(item: index, section: 0)
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as? IngredientsTableViewCell else {
                    return UITableViewCell()
                }
            cell.ingredientViewModel = viewModel
            return cell
            }.disposed(by: disposeBag)
        }

    
    func getApiResponse() {
        if !NetworkReachability.isReachable{
           lblError?.text = kNoInternetMessage
        } else {
            activityLoader?.startAnimating()
            APIClient.sharedInstance.getResponse().subscribe(onNext: { (responseData) in
                self.activityLoader?.stopAnimating()
                self.noDataView?.isHidden = true
                let ingredients = responseData.data.ingredients
                if ingredients.count > 0 {
                    self.tableViewModel.ingredients = ingredients
                }
                self.headerView?.recipeData = responseData.data
                if let images = responseData.data.images as? [Image] {
                    let image = images[0]
                    self.imageView.sd_setImage(with: URL(string: image.url), placeholderImage: nil)
                }
                self.lblLikes?.text = "\(responseData.data.totoalLikes)"
            }, onError: { (error) in
                print(error.localizedDescription)
                self.lblError?.text = kErrorMessage
            }, onCompleted: {
                //do nothing
            }) {
                //on dispose
            }
        }
    }
    
    

}


