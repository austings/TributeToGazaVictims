Cd(__DIR__);;
#include "FileBMP.HC"
#define DC_NUM	4

CDC *cafe_dc[DC_NUM];
F64 glbl_scale;
Bool first = TRUE;
I64 framecounter = 10;
I64 imIndex = 1;
U0 CleanUpImage()
{
  I64 i;
  for (i=0;i<DC_NUM;i++)
    DCDel(cafe_dc[i]);
}
U0 InitImage(U8 *filename,F64 scale)
{
  I64 i;
  glbl_scale=scale;
  for (i=0;i<DC_NUM;i++)
    cafe_dc[i]=BMPRead(filename,TRUE);
}

U0 DrawIt(CTask *,CDC *dc)
{
  if(framecounter==0)
  {
   imIndex++;
   framecounter = 10;
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
    
  InitImage("T:/HavaNagila/img/14.bmp",1);

  dc->flags|=DCF_TRANSFORMATION;
  Mat4x4Scale(dc->r,glbl_scale);
  GrBlot3(dc,0,0,0,cafe_dc[winmgr.updates%DC_NUM]);
 }
}

U0 RenderImage(CTask *,CDC *dc)
{
  dc->flags|=DCF_TRANSFORMATION;
  Mat4x4Scale(dc->r,glbl_scale);
  GrBlot3(dc,140,0,0,cafe_dc[winmgr.updates%DC_NUM]);
}

"%s",DirCur;

Fs->draw_it=&DrawIt;
 //CleanUpView();
