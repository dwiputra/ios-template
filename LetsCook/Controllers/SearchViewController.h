//
//  SearchViewController.h
//  LetsCook
//
//  Created by Dwi Putra on 9/29/14.
//  Copyright (c) 2014 Montazze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface SearchViewController : UIViewController<UISearchBarDelegate>{
    MBProgressHUD *HUD;
}
@property (strong, nonatomic) IBOutlet UISearchBar *search;

@end
