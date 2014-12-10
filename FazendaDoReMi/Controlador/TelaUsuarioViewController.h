//
//  TelaUsuarioViewController.h
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 30/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorUsuario.h"
#import "GerenciadorComponenteView.h"

@interface TelaUsuarioViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property UIImageView *recipeImageView;

@property (weak, nonatomic) IBOutlet UIView *viewPrincipal;

@property (weak, nonatomic) IBOutlet UITableView *tableUsuarios;


@end
