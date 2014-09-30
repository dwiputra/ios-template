//
//  GetRecipeModel.h
//  LetsCook
//
//  Created by Dwi Putra on 9/30/14.
//  Copyright (c) 2014 Montazze. All rights reserved.
//

#import "JSONModel.h"
#import "RecipeModel.h"

@interface GetRecipeModel : JSONModel

@property (nonatomic, retain) RecipeModel *recipe;

@end
