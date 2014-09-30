//
//  SearchViewController.m
//  LetsCook
//
//  Created by Dwi Putra on 9/29/14.
//  Copyright (c) 2014 Montazze. All rights reserved.
//

#import "SearchViewController.h"
#import "ListViewController.h"
#import "ApiController.h"
#import "RecipesModel.h"

@interface SearchViewController (){
    ListViewController *list;
}

@end

@implementation SearchViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    list = [ListViewController new];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - searchBar delegate
/**
 *  request to search list of food ingredients
 *
 *  @param searchBar -> object searchBar
 *
 */
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.view endEditing:YES];
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [HUD setMode:MBProgressHUDModeIndeterminate];
    [HUD setLabelText:@"searching"];
    [HUD show:YES];
    
    [[ApiController instanceShared] searchWithValue:self.search.text Page:nil SortBy:SortingByNon withBlock:^(SearchModel *response, NSError *error) {
        if (error==nil) {
            if ([response count]!=nil) {
                list.searchSummary = response;
                [self.navigationController pushViewController:list animated:YES];
                [self.search setText:@""];
                [HUD hide:YES];
            }else{
                [HUD setMode:MBProgressHUDModeCustomView];
                [HUD setCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alert-failed"]]];
                [HUD setLabelText:@"Searching failed"];
                [HUD hide:YES afterDelay:1];
            }
        }else{
            [HUD setMode:MBProgressHUDModeCustomView];
            [HUD setCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alert-error"]]];
            [HUD setLabelText:@"Connection error"];
            [HUD hide:YES afterDelay:1];
        }
    }];
}


@end
