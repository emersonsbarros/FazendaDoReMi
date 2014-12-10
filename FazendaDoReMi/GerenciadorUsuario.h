//
//  GerenciadorUsuario.h
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 30/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "UsuarioAplicativo.h"
#import "Usuario.h"
#import "Aula.h"

@interface GerenciadorUsuario : NSObject

@property UsuarioAplicativo *usuarioLogado;


+(GerenciadorUsuario*)sharedManager;
-(void)setaUsuarioAtual:(UsuarioAplicativo*)usuario;




-(NSArray*)retornaTodosUsuarios;
-(int)retornaNumeroUsuarios;
-(void)limparDadosBanco;


-(Usuario*)retornaUsuario:(NSString*)nomeUsuario;
-(void)cadastrarUsuario:(UsuarioAplicativo*)usuario;
-(void)deletarUsuario:(NSString*)nomeUsuario;
-(void)atualizarNomeUsuario:(NSString*)nomeAtual :(NSString*)paramentroMudar;




@end
