---
title: my second Processing program (3D spheres)
date: 2008/10/07
tags: [code]
author: Jez Nicholson
alias: /lorenz-attractor-in-processing
---
I revisited my first Processing program this morning and had a play with 3D objects. This is incredibly easy as all I had to do was take a quick look at an example then use a 'Matrix'

    /**
    + 3D Lorenz Attractor : 3D spheres
    */
    float h=0.01;
    float x=0.6;
    float y=0.6;
    float z=0.6;
    float xnew,ynew,znew;
    int npoints = 100;
    float scaler = 3;
    float offset = 300;
    float frac=8/3;
    int k=0;
    float maxz = 0;
    float minz = 0;
    
    void setup()
    {
      size(600, 600, P3D);
      background(102);
    }
    
    void draw()
    {
      lights();
      noStroke();
      if (k < 10000)
      {
        pushMatrix();
        xnew = x + h*10*(y-x);
        ynew = y + h*((-x*z) + 28*x-y);
        znew = z + h*(x*y - frac*z);
        color c1 = color((z/50) * 255, (z/50) * 255 , 60);
        translate(x*scaler+offset, y*scaler+offset, z*scaler*4);
        sphere(1);
        popMatrix();
        x=xnew;
        y=ynew;
        z=znew;
        k++;
      }
    }