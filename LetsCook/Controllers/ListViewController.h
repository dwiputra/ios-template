//
//  ListViewController.h
//  LetsCook
//
//  Created by Dwi Putra on 9/29/14.
//  Copyright (c) 2014 Montazze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>
#import "SearchModel.h"

@interface ListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    MBProgressHUD *HUD;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) SearchModel *searchSummary;

@end
