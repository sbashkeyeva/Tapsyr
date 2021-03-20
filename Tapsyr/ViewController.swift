//
//  ViewController.swift
//  Tapsyr
//
//  Created by Symbat Bashkeyeva on 3/18/21.
//

import UIKit

class ViewController: UIViewController {

    lazy var firstOnboardView = FirstOnboardView()
    lazy var secondOnboardView = SecondOnboardView()
    lazy var thirdOnboardView = ThirdOnboardView()
    lazy var views = [firstOnboardView, secondOnboardView, thirdOnboardView]
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(
            width: view.frame.width * CGFloat(views.count),
            height: view.frame.height
        )
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(
                x: view.frame.width * CGFloat(i),
                y: 0,
                width: view.frame.width,
                height: view.frame.height
            )
        }
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        pageControl.addTarget(
            self, action: #selector(pageControlTapHandler(sender:)), for: .touchUpInside
        )
        return pageControl
    }()
    
    @objc
    func pageControlTapHandler(sender: UIPageControl) {
        scrollView.scrollTo(horizontalPage: sender.currentPage, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setViewConstraints()
        stylizeViews()
    }
    
    func addSubviews() {
        view.addSubview(firstOnboardView)
        view.addSubview(scrollView)
        scrollView.edgeTo(view: view)
        view.addSubview(pageControl)
        pageControl.pinTo(view)
    }
    
    func setViewConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        firstOnboardView.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            firstOnboardView.leftAnchor.constraint(equalTo: view.leftAnchor),
            firstOnboardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstOnboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            firstOnboardView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func stylizeViews() {
        pageControl.pageIndicatorTintColor = hexStringToUIColor(hex: "E7EEFD")
        pageControl.currentPageIndicatorTintColor = hexStringToUIColor(hex: "0AA8BA")
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
