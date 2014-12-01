//
//  GerenciadorUsuario.h
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 30/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Usuario.h"
#import "AppDelegate.h"

@interface GerenciadorUsuario : NSObject

@property Usuario *usuarioLogado;


+(GerenciadorUsuario*)sharedManager;
-(void)setaUsuarioAtual:(Usuario*)usuario;




-(NSArray*)retornaTodosUsuarios;
-(int)retornaNumeroUsuarios;
-(void)limparDadosBanco;


-(Usuario*)retornaUsuario:(NSString*)nomeUsuario;
-(void)cadastrarUsuario:(Usuario*)usuario;
-(void)deletarUsuario:(NSString*)nomeUsuario;
-(void)atualizarNomeUsuario:(NSString*)nomeAtual :(NSString*)paramentroMudar;




@end
