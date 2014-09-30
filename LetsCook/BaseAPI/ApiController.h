//
//  ApiController.h
//  LetsCook
//
//  Created by Dwi Putra on 9/29/14.
//  Copyright (c) 2014 Montazze. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "SearchModel.h"
#import "GetRecipeModel.h"

typedef enum : NSUInteger {
    SortingByRating,
    SortingByTranding,
    SortingByNon
} SortingBy;

@interface ApiController : AFHTTPSessionManager

+ (instancetype) instanceShared;

- (void) searchWithValue:(NSString*)text Page:(NSNumber*)page SortBy:(SortingBy)sortBy withBlock:(void (^)(SearchModel *response, NSError *error))block;

- (void) getReceipeWithID:(NSString*)rID withBlock:(void (^)(GetRecipeModel *response, NSError *error))block;

@end
