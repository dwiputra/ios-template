//
//  DetailViewController.m
//  LetsCook
//
//  Created by Dwi Putra on 9/29/14.
//  Copyright (c) 2014 Montazze. All rights reserved.
//

#import "DetailViewController.h"
#import <SDWebImage-ProgressView/UIImageView+ProgressView.h>

@interface DetailViewController (){
    CGFloat y;
}

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self roundedCornerRank];
}

/**
 *  this method set rank of UILabel going to be rounded on corner
 *
 */
- (void) roundedCornerRank{
    [_rank.layer setCornerRadius:5];
    _rank.clipsToBounds=YES;
}

- (void)viewWillAppear:(BOOL)animated{
    _rank.text = [NSString stringWithFormat:@"%@", [self.recipe social_rank]];
    _titleRecipe.text = [self.recipe title];
    
    [_detailImage setImageWithURL:[NSURL URLWithString:[[self.recipe image_url] stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]] usingProgressView:nil];
    y=360;
    [self customIngredientsView];
}

/**
 *  this method handles ingredientsText of textView, populate it from array, count the
 *
 *  @param searchBar -> object searchBar
 *
 */
- (void) customIngredientsView{
    NSString * resultConditions = [[self.recipe ingredients] componentsJoinedByString:@"\n"];
    _ingredientsText.text = resultConditions;
    [_ingredientsText sizeToFit];
    CGRect frame = _ingredientsText.frame;
    y += frame.size.height;
}

/**
 *  this method will set content size of scroll view 
 *
 */
- (void)viewDidLayoutSubviews{
    [_scrollView setContentSize:CGSizeMake(320, y)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
