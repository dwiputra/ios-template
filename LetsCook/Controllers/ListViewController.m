//
//  ListViewController.m
//  LetsCook
//
//  Created by Dwi Putra on 9/29/14.
//  Copyright (c) 2014 Montazze. All rights reserved.
//

#import "ListViewController.h"
#import "ListCell.h"
#import "DetailViewController.h"
#import <SDWebImage-ProgressView/UIImageView+ProgressView.h>
#import "ApiController.h"
#import "RecipesModel.h"

@interface ListViewController (){
    DetailViewController *detailVC;
}

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Receipes list";
    detailVC = [DetailViewController new];
    [self.tableView registerNib:[UINib nibWithNibName:@"ListCell" bundle:nil]forCellReuseIdentifier:@"Cell"];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.searchSummary recipes].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    RecipesModel *recipe = [[self.searchSummary recipes] objectAtIndex:indexPath.row];
    
    [cell.listImage setImageWithURL:[NSURL URLWithString:[[recipe image_url] stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]] usingProgressView:nil];
    cell.listTitle.text = [recipe title];
    [cell.listRank.layer setCornerRadius:5];
    [cell.listRank setClipsToBounds:YES];
    cell.listRank.text = [NSString stringWithFormat:@"%@", [recipe social_rank]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [HUD setMode:MBProgressHUDModeIndeterminate];
    [HUD setLabelText:@"fetching"];
    [HUD show:YES];
    
    RecipesModel *recipe = [[self.searchSummary recipes] objectAtIndex:indexPath.row];
    [[ApiController instanceShared] getReceipeWithID:[recipe recipe_id] withBlock:^(GetRecipeModel *response, NSError *error) {
        if (error==nil) {
            if ([response recipe]!=nil) {
                detailVC.recipe = [response recipe];
                [self.navigationController pushViewController:detailVC animated:YES];
                [HUD hide:YES];
            }else{
                [HUD setMode:MBProgressHUDModeCustomView];
                [HUD setCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alert-failed"]]];
                [HUD setLabelText:@"Fetching failed"];
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
