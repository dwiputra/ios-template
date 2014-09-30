//
//  SearchModel.h
//  LetsCook
//
//  Created by Dwi Putra on 9/30/14.
//  Copyright (c) 2014 Montazze. All rights reserved.
//

#import "JSONModel.h"
#import "RecipesModel.h"

@interface SearchModel : JSONModel

@property (nonatomic, retain) NSNumber * count;
@property (nonatomic, strong) NSArray<RecipesModel, Optional> * recipes;


@end
