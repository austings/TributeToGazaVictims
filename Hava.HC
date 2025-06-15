Cd(__DIR__);;
#include "FileBMP.HC";
#define DC_NUM	4

CDC *img_dc[DC_NUM];

I64 index = 0;
I64 framecounter = 10;
I64 imIndex=1;
F64 glbl_scale;
Bool first = TRUE;
U8* dir;

U8* l1= "On 13 June 2025, Israel attacked targets ";
U8* l2 = "at more than a dozen locations and cities";
U8* l3 = "across Iran.";

I32 n1 = StrLen(l1);
I32 n2 = StrLen(l2)+n1;
I32 n3 = StrLen(l3)+n2;


U8* l4 ="This escalation marked an unprecedented";
U8* l5 ="increase of wanton violence, sidelining";
U8* l6 ="diplomacy and placing even more civilian";
U8* l7 ="lives at risk.";

I32 n4 = StrLen(l4)+n3;
I32 n5 = StrLen(l5)+n4;
I32 n6 = StrLen(l6)+n5;
I32 n7 = StrLen(l7)+n6;

U8* l8 ="Important now more than ever should";
U8* l9 ="we recognize the importance of peace";
U8* l10="and restraint. To not underestimate the";
U8* l11="efforts we can make in our own lives to";
U8* l12="promote love, faith and forgiveness.";

I32 n8 = StrLen(l8)+n7;
I32 n9 = StrLen(l9)+n8;
I32 n10 = StrLen(l10)+n9;
I32 n11 = StrLen(l11)+n10;
I32 n12 = StrLen(l12)+n11;

U8* l13="Please phone your representative's office.";




U0 GrChar(CDC *dc=gr.dc,U8 ch,I64 x,I64 y,I64 scale)
{
 I64 i,j,k=0;
 for(i=0;i<FONT_HEIGHT;i++){
  for(j=0;j<FONT_WIDTH;j++){
   if(Bt(&text.font[ch],k++)){
    GrRect(dc,x+j*scale,y+i*scale,scale,scale);
   }
  }
 }
}
U0 RenderImage(CTask *,CDC *dc)
{
  dc->flags|=DCF_TRANSFORMATION;
  Mat4x4Scale(dc->r,glbl_scale);
  GrBlot3(dc,0,0,0,img_dc[winmgr.updates%DC_NUM]);
}

U0 InitImage(U8 *filename,F64 scale)
{
  I64 i;
  glbl_scale=scale;
  for (i=0;i<DC_NUM;i++)
    img_dc[i]=BMPRead(filename,TRUE);
}

U0 CleanUpImage()
{
  I64 i;
  for (i=0;i<DC_NUM;i++)
    DCDel(img_dc[i]);
}

U0 BMP24View(CDC* dc,CTask *task)
{
  RenderImage(task,dc);
  
}
U0 Start()
{

 music.tempo = 2;
 music.stacatto_factor  =.5;
 Play("e2DA3DqD"); //Hava
 Play("e3F#D#D");//Nagila
 Play("e2DA3F#qF#");//Hava
 Play("e3AGF#");//Nagila
 Play("e2DA#3GqG");//Hava
 Play("eA#AG");//Nagila
 Play("e2DA3F#D#hD");//venishmeha
 Play("e2DA3DqD"); //Hava
 Play("e3F#D#D");//Nagila
 Play("e2DA3F#qF#");//Hava
 Play("e3AGF#");//Nagila
 Play("e2DA#3GqG");//Hava
 Play("eA#AG");//Nagila
 Play("e2DA3F#D#qDDDD");//venishmeha

 music.tempo = 6;
 music.stacatto_factor = 1;
 Play("EFGAB4CD");
}

U0 Continue()
{
 music.tempo = 4;
 music.stacatto_factor = 1;
 Play("e.3Dt2D1A3.Dt2D3.F#t");//Hava 
 Play("e1A3.D#Dt2D3.F#t");//Nagila
 Play("e1A3.F#t2D3.At1A3.GF#t");//Hava
 Play("e2D#3.Gt1A#3.Gt2D#3.A#t");//Nagila
 Play("e1A#3.AGt2D3.F#t1A3.D#t2D3DEFG4CD1eA");//venishmeha
}

U0 Chorus()
{
 music.tempo = 6;
 music.stacatto_factor = 1;
 Play("q2D3F#F#D#DDhD");//Hava nereneha
 Play("q2C3D#D#DCChC");//Hava nereneha
 Play("q2C3CD#DCG2D3F#1A3D#2D3hDe1A");//Hava nereneha, venishmeha
 Play("q2D3F#F#D#DDhD");//Hava nereneha
 Play("q2C3D#D#DCChC");//Hava nereneha
 Play("q2C3CD#DCG2D3F#1A3D#2D3hDe1A");//Hava nereneha, venishmeha

}

U0 Outro()
{
 music.tempo = 8;
 music.stacatto_factor = 2;
 Play("e2GA#3DAr");//OOoooo
 music.stacatto_factor = 1.5;
 Play("e2GA#3DAr");//rooo
 music.tempo = 8;
 music.stacatto_factor = 1;
 Play("e2GA#3DAr");//OO
 Play("e2GA#3DAr");//rooo
 Play("e2GA#3DAr");//Ahhh
 Play("e2GA#3DAr");//hiimm

}

U0 End()
{
 music.tempo = 4;
 music.stacatto_factor  =1;
 Play("e2G3AA");//Uru him venishmeheya
 Play("e2D3A#A");
 Play("e2G3GA#");
 Play("e2D3AG");

 Play("e2G3AA"); //Uru him venishmeheya
 Play("e2D3A#A");
 Play("e2G3GA#");
 Play("e2D3AG");

 Play("e2G3AA");// Uru him venishmeheya
 Play("e2D4C3A#");
 Play("e2G3A4C");
 Play("e2D3A#A");
 
 Play("e2G3A4C"); //Uru him venishmeheya
 Play("e2D3A#A");
 Play("e2G3AA");
 Play("e2D4C3A#");
 Play("e2G3A4C");
 Play("e2DA#A");

 Play("e2DG3AA4hD");//URU HIM
 Play("e2DG3AA4hD");//URU HIM

 Play("e2DG3DqD");//venishmeheya
 Play("e4A#AGF#");
 Play("e2G4wG");

}


U0 TextIt(CTask *task, CDC *dc)
{
 I64 i;
 dc->color = BLACK;
 for(i=0;i<n1&&i<index;i++)
 {     
    GrChar(dc,l1[i],10+i*15,10,2);
 }
 for(i=0;i<StrLen(l2)&&i<index-n1;i++)
 {
    GrChar(dc,l2[i],10+i*15,30,2);
 }
 for(i=0;i<StrLen(l3)&&i<index-n2;i++)
 {     
    GrChar(dc,l3[i],10+i*15,50,2);
 }
 for(i=0;i<StrLen(l4)&&i<index-n3;i++)
 {     
    GrChar(dc,l4[i],10+i*15,90,2);
 }
 for(i=0;i<StrLen(l5)&&i<index-n4;i++)
 {     
    GrChar(dc,l5[i],10+i*15,110,2);
 }
 for(i=0;i<StrLen(l6)&&i<index-n5;i++)
 {     
    GrChar(dc,l6[i],10+i*15,130,2);
 }
 for(i=0;i<StrLen(l7)&&i<index-n6;i++)
 {     
    GrChar(dc,l7[i],10+i*15,150,2);
 }
 for(i=0;i<StrLen(l8)&&i<index-n7;i++)
 {     
    GrChar(dc,l8[i],10+i*15,190,2);
 }
 for(i=0;i<StrLen(l9)&&i<index-n8;i++)
 {     
    GrChar(dc,l9[i],10+i*15,210,2);
 }
 for(i=0;i<StrLen(l10)&&i<index-n9;i++)
 {     
    GrChar(dc,l10[i],10+i*15,230,2);
 }
 for(i=0;i<StrLen(l11)&&i<index-n10;i++)
 {     
    GrChar(dc,l11[i],10+i*15,250,2);
 }
 for(i=0;i<StrLen(l12)&&i<index-n11;i++)
 {     
    GrChar(dc,l12[i],10+i*15,270,2);
 }

}

U0 DrawIt(CTask *task, CDC*dc)
{
 I64 scale = 1;
 if(index<n11+150)
 {
  if((index<n11+105||index>n11+110)&&
     (index<n11+130||index>n11+135)&&
     (index<n11+140||index>n11+145))
   TextIt(task,dc);
 }
 else{

  if(framecounter==0)
  {
   imIndex++;
   framecounter = 14;
  }
  else
  {
   if(!first)
   {

    CleanUpImage();    
   }
   else
   {
     first=FALSE;
   }  
   U8* edit;
   edit =MStrPrint("%s%s%d%s",dir,"/img/",imIndex,".bmp");
   framecounter--;
   InitImage(edit,scale);
   BMP24View(dc,task);

  }
  
 }

 index++;
}

U0 Run(){
 WinMax;
 WinBorder;
 SettingsPush;
 DocCursor(FALSE);
 DocClear;
 MenuPush("");
 dir = DirCur;
 Fs->draw_it=&DrawIt; 
 Start;
 Continue;Continue;
 Chorus;
 Outro;
 End;
 SettingsPop;
 //DocClear;
 MenuPop;
}
Run;