//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 1.02.23.
//

import UIKit    

protocol UserInfoVCDelegate: AnyObject {
    func didTapGithubProfile(for user: User)
    func didTapGetFollowers(for user: User)
}

class UserInfoVC: UIViewController {
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GHFBodyLabel(textAlignment: .center)
    
    var itemViews:[UIView] = []
    
    var username: String!
    
    weak var delegate: FollowerListVCDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        layoutUI()
        getUserInfo()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func getUserInfo(){
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user) :
                DispatchQueue.main.async { self.configureUIElements(with: user) }
           
            case .failure(let error):
                self.presentGHFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    func configureUIElements(with user: User) {
       
        let repoItemVC = GHFRepoItemVC(user: user)
        repoItemVC.delegate = self
        
        let followerItemVC = GHFFollowerItemVC(user: user)
        followerItemVC.delegate = self

        self.add(childVC: GHFUserInfoHeaderVC(user: user), to: self.headerView)
        self.add(childVC: repoItemVC, to: self.itemViewOne)
        self.add(childVC: followerItemVC, to: self.itemViewTwo)
        self.dateLabel.text = "Github since \(user.createdAt.convertToDisplayFormat())"
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    func layoutUI() {
        itemViews = [headerView, itemViewOne, itemViewTwo, dateLabel]
        
        let padding:CGFloat = 20
        let itemHeight:CGFloat = 140
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
}

extension UserInfoVC: UserInfoVCDelegate {
    func didTapGithubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGHFAlertOnMainThread(title: "Invalid URL", message: "The url attached to this user is invalid", buttonTitle: "OK")
            return
        }
        presentSafariVC(with: url)
    }
    
    
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else {
            presentGHFAlertOnMainThread(title: "No followers", message: "This user has no followers 😢", buttonTitle: "So sad")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
    }
}
