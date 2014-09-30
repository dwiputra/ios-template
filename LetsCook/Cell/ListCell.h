//
//  ListCell.h
//  LetsCook
//
//  Created by Dwi Putra on 9/29/14.
//  Copyright (c) 2014 Montazze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *listImage;
@property (strong, nonatomic) IBOutlet UILabel *listTitle;
@property (strong, nonatomic) IBOutlet UILabel *listRank;

@end
