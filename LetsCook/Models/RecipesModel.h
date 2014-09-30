//
//  RecipesModel.h
//  LetsCook
//
//  Created by Dwi Putra on 9/30/14.
//  Copyright (c) 2014 Montazze. All rights reserved.
//

#import "JSONModel.h"

@protocol RecipesModel

@end

@interface RecipesModel : JSONModel

@property (nonatomic, retain) NSString * publisher;
@property (nonatomic, retain) NSString * f2f_url;
@property (nonatomic, retain) NSString * source_url;
@property (nonatomic, retain) NSString * recipe_id;
@property (nonatomic, retain) NSString * image_url;
@property (nonatomic, retain) NSNumber * social_rank;
@property (nonatomic, retain) NSString * publisher_url;
@property (nonatomic, retain) NSString * title;

@end
