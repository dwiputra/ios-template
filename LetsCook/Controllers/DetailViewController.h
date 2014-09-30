//
//  DetailViewController.h
//  LetsCook
//
//  Created by Dwi Putra on 9/29/14.
//  Copyright (c) 2014 Montazze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TPKeyboardAvoidingScrollView.h>
#import "RecipeModel.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *detailImage;
@property (strong, nonatomic) IBOutlet UILabel *rank;
@property (strong, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UILabel *titleRecipe;
@property (strong, nonatomic) IBOutlet UITextView *ingredientsText;
@property (nonatomic, strong) RecipeModel * recipe;

@end
