//
//  ApiController.m
//  LetsCook
//
//  Created by Dwi Putra on 9/29/14.
//  Copyright (c) 2014 Montazze. All rights reserved.
//

#import "ApiController.h"

#define baseUrlString @"http://food2fork.com/"

@implementation ApiController

/**
 *  singleton method to make this class easy to call
 *
 *  @return object of ApiController
 */
+ (instancetype)instanceShared{
    static ApiController *controller = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        controller = [[ApiController alloc] initWithBaseURL:[NSURL URLWithString:baseUrlString]];
        controller.responseSerializer.acceptableContentTypes = [controller.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    });
    return controller;
}

/**
 *  request to search list of food ingredients
 *
 *  @param text -> value of search key
 *  @param page -> page of food list (30items/page)
 *  @param sortBy -> sorting of food list (r: by rating, t: by trendingness)
 *
 */
- (void) searchWithValue:(NSString *)text Page:(NSNumber *)page SortBy:(SortingBy)sortBy withBlock:(void (^)(SearchModel *, NSError *))block{
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@"6fd077e1f98d884fe7e6fa07d4abed9d" forKey:@"key"];
    [parameter setValue:text forKey:@"q"];
    switch (sortBy) {
        case SortingByRating:
            [parameter setValue:@"r" forKey:@"sort"];
            break;
        case SortingByTranding:
            [parameter setValue:@"t" forKey:@"sort"];
            break;
        case SortingByNon:
        default:
            break;
    }
    [parameter setValue:page forKey:@"page"];
    
    [[ApiController instanceShared] POST:@"api/search/" parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        if (block) {
            block([[SearchModel alloc] initWithDictionary:responseObject error:nil], nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

/**
 *  request to get food ingredients
 *
 *  @param rID -> recipe  id
 *
 */
- (void)getReceipeWithID:(NSString *)rID withBlock:(void (^)(GetRecipeModel *, NSError *))block{
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:rID forKey:@"rId"];
    [parameter setValue:@"6fd077e1f98d884fe7e6fa07d4abed9d" forKey:@"key"];
    
    [[ApiController instanceShared] POST:@"api/get/" parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        if (block) {
            block([[GetRecipeModel alloc] initWithDictionary:responseObject error:nil], nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

@end
