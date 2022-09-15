//
//  OnboardingViewController.swift
//  Deltna
//
//  Created by Mohammad on 9/3/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    
  
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1{
                nextButton.setTitle("Get Started", for: .normal)
            }else{
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        slides = [OnboardingSlide(title:"ausdhfiusdhf", description:"kjsdhcjbsdjhchjbsdcb jbv sjd cbjb uash dja hjd ahisud kjashj dajkshd has kjdkas jdakj sdj asjkh jaksdj jkas djka skd", image: #imageLiteral(resourceName: "page1")),OnboardingSlide(title:"ausdhfiusdhf", description:"kjsdhcjbsdjhchjbsdcb jbv sjd cbjb uash dja hjd ahisud kjashj dajkshd has kjdkas jdakj sdj asjkh jaksdj jkas djka skd", image: #imageLiteral(resourceName: "page2")),OnboardingSlide(title:"ausdhfiusdhf", description:"kjsdhcjbsdjhchjbsdcb jbv sjd cbjb uash dja hjd ahisud kjashj dajkshd has kjdkas jdakj sdj asjkh jaksdj jkas djka skd", image: #imageLiteral(resourceName: "page3"))]
    }
    

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let loginViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.loginViewController) as? LoginViewController

            self.view.window?.rootViewController = loginViewController
            self.view.window?.makeKeyAndVisible()
        
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }
        
    }
    

}
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingViewControllerCell.identifire, for: indexPath) as!
            OnboardingViewControllerCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
}
