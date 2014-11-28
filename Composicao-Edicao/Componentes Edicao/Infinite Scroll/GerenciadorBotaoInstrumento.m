//
//  GerenciadorBotaoInstrumento.m
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 28/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GerenciadorBotaoInstrumento.h"

@implementation GerenciadorBotaoInstrumento


-(id)init{
    self = [super init];
    
    if(self){
        self.listaBotoesInstrumentos = [[NSMutableArray alloc]init];
        [self criaBotoesInstrumento];
    }
    return self;
}



+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//Singleton
+(GerenciadorBotaoInstrumento*)sharedManager{
    static GerenciadorBotaoInstrumento *gerenciadorDeItem = nil;
    
    if(!gerenciadorDeItem){
        gerenciadorDeItem = [[super allocWithZone: nil] init];
    }
    return gerenciadorDeItem;
}


-(void)acionaBotao:(TapBotaoInstrumento*)button{
    
    [[ListaInstrumentoViewController sharedManager] chamaTelaCarregamento];
    
    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = button.btnInstrumento.nomeInstrumento;
    self.imgFundo.image = button.btnInstrumento.imgFundo;
    self.imgFundoSecundario.image = button.btnInstrumento.imgFundoSecundario;
    
}

//-(void)adicionaGesture{
//    
//    for(BotaoInstrumento *btn in [GerenciadorBotaoInstrumento sharedManager].isp.imageStore){
//        
//        NSLog(@"dfdf%@",btn.nomeInstrumento);
//        
//        TapBotaoInstrumento *gesture = [[TapBotaoInstrumento alloc]initWithTarget:self action:@selector(acionaBotao:)];
//        gesture.numberOfTapsRequired = 1;
//        gesture.numberOfTouchesRequired = 1;
//        gesture.btnInstrumento = btn;
//        btn.userInteractionEnabled = YES;
//        [btn addGestureRecognizer:gesture];
//    }
//}

-(void)recebeImagensView:(UIImageView*)img1 :(UIImageView*)img2{
    self.imgFundo = img1;
    self.imgFundoSecundario = img2;
}

-(void)criaBotoesInstrumento{
    [self criaBotaoPiano];
    [self criaBotaoXilofone];
    [self criaBotaoTrompete];
    [self criaBotaoSaxfone];
    [self criaBotaoGuitarra];
    [self criaBotaoTelefone];
    [self criaBotaoBongo];
    [self criaBotaoFlauta];
    [self criaBotaoViolao];
    [self criaBotaoAcordiao];
    [self criaBotaoClarinete];
    [self criaBotaoCrystal];
    [self criaBotaoFlautaIndio];
    [self criaBotaoGaita];
    [self criaBotaoHarpa];
    [self criaBotaoBanjo];
    [self criaBotaoOcarina];
    [self criaBotaoPanela];
    
}

-(void)criaBotaoPiano{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnPiano.png"]];
    btn.nomeInstrumento = @"Piano";
    btn.imgFundo = [UIImage imageNamed:@"fundoazul.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"fundocasa.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoXilofone{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnlixeira.png"]];
    btn.nomeInstrumento = @"Xilofone";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoTrompete{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnTrompete.png"]];
    btn.nomeInstrumento = @"Trompete";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoSaxfone{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnSaxofone.png"]];
    btn.nomeInstrumento = @"Saxfone";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoGuitarra{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnlixeira.png"]];
    btn.nomeInstrumento = @"Guitarra";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoTelefone{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnTelefone.png"]];
    btn.nomeInstrumento = @"Telefone";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoBongo{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnTambor.png"]];
    btn.nomeInstrumento = @"TamborBongo";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoFlauta{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnFlauta.png"]];
    btn.nomeInstrumento = @"FlautaDoce";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoViolao{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnViolao.png"]];
    btn.nomeInstrumento = @"ViolaoNylon";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoAcordiao{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnAcordeon.png"]];
    btn.nomeInstrumento = @"Acordiao";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoClarinete{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnClarinete.png"]];
    btn.nomeInstrumento = @"Clarinete";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoCrystal{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnCopoCristal.png"]];
    btn.nomeInstrumento = @"Crystal";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoFlautaIndio{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnFlautaIndio.png"]];
    btn.nomeInstrumento = @"FlautaIndio";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoGaita{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnGaita.png"]];
    btn.nomeInstrumento = @"Gaita";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoHarpa{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnHarpa.png"]];
    btn.nomeInstrumento = @"Harpa";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoBanjo{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnBanjo.png"]];
    btn.nomeInstrumento = @"Banjo";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoOcarina{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnOcarina.png"]];
    btn.nomeInstrumento = @"Ocarina";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
}

-(void)criaBotaoPanela{
    BotaoInstrumento *btn = [[BotaoInstrumento alloc]initWithImage:[UIImage imageNamed:@"btnlixeira.png"]];
    btn.nomeInstrumento = @"Panela";
    btn.imgFundo = [UIImage imageNamed:@"backxilofone-2.png"];
    btn.imgFundoSecundario = [UIImage imageNamed:@"backxilofone1-2.png"];
    [self.listaBotoesInstrumentos addObject:btn];
    
}



//-(void)chamaExercicios:(id)sender{
//    BotaoInstrumento *button = sender;
//
//    [[ComposicaoPartituraViewController sharedManager]chamaTelaCarregamento];
//    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = button.nomeInstrumento;
//    self.imgFundo.image = [UIImage imageNamed:@"fundoazul.png"];
//    self.imgFundoSecundario.image = [UIImage imageNamed:@"fundocasa.png"];
//}





@end
