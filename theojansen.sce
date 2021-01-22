count=1;
a=150;
b=500;
c=387;
d=415;
e=558;
f=401;
h=394;
l=550;
g=393;
u=367;
k=490;
j=657;
pin1x=0;
pin1y=0;


m=[];

//avi = moviein((8*pi+pi/2));
for theta=-%pi/6:%pi/12:%pi/6
    pin2x=(pin1x-c)*cos(theta);
pin2y=(pin1x-c)*sin(theta);
i=0;
figure(1);

x=[];
y=[];
for the=0:0.1:2*%pi+%pi/2
   // %for crank
    i=i+1;
    pin4x=a*cos(the);
    pin4y=a*sin(the);
    
   // %for links b,d
    m1=(d.^2)-(b.^2)-(pin2x.^2)-(pin2y.^2)+(pin4x.^2)+(pin4y.^2);
    n1=2*(pin4y-pin2y);
    p1=2*(pin4x-pin2x);
    
    
    q1=(n1/p1).^2+1;
    r1=(2*n1*pin4x/p1)-(2*m1*n1/(p1.^2))-2*pin4y;
    s1=((m1/p1)-pin4x).^2-(b.^2)+(pin4y.^2);
    
    pin3y=(-r1+sqrt((r1.^2)-(4*q1*s1)))/(2*q1);
    pin3x=(-n1*pin3y+m1)/p1;
    
    
   // %for  links f,e
    t1=acos((f.^2+d.^2-e.^2)/(2*f*d));
    t2=atan((pin3y-pin2y),(pin3x-pin2x));
    pin5x=pin2x+f*cos(t1+t2);
    pin5y=pin2y+f*sin(t1+t2);
    
   // %for links k,l
     m2=(h.^2)-(l.^2)-(pin2x.^2)-(pin2y.^2)+(pin4x.^2)+(pin4y.^2);
    n2=2*(pin4y-pin2y);
    p2=2*(pin4x-pin2x);
    
    q2=(n2/p2).^2+1;
    r2=(2*n2*pin2x/p2)-(2*m2*n2/(p2.^2))-2*pin2y;
    s2=((m2/p2)-pin2x).^2-(h.^2)+(pin2y.^2);
     pin6y=(-r2-sqrt((r2.^2)-(4*q2*s2)))/(2*q2);
    pin6x=(-n2*pin6y+m2)/p2;  
    
// for links g,u
     m3=(g.^2)-(u.^2)-(pin5x.^2)-(pin5y.^2)+(pin6x.^2)+(pin6y.^2);
    n3=2*(pin6y-pin5y);
    p3=2*(pin6x-pin5x);
    
    q3=(n3/p3).^2+1;
    r3=(2*n3*pin6x/p3)-(2*m3*n3/(p3.^2))-2*pin6y;
    s3=((m3/p3)-pin6x).^2-(u.^2)+(pin6y.^2);
    
    pin7y=(-r3-sqrt((r3.^2)-(4*q3*s3)))/(2*q3);
    pin7x=(-n3*pin7y+m3)/p3;
    
  //  % for links k,j
     t3=acos((u.^2+k.^2-j.^2)/(2*u*k));
    t4=atan((pin7y-pin6y),(pin7x-pin6x));
    pin8x=pin6x+k*cos(t3+t4);
    pin8y=pin6y+k*sin(t3+t4);
     
    
    x($+1) = pin8x;
    y($+1) = pin8y;
    
    
//%plot
 //   plot([pin1x pin2x], [pin1y pin2y],'black','linewidth',4); hold on       % crank to pin
   // plot([pin1x pin4x], [pin1y pin4y],'r','linewidth',4); hold on     % crank
    //plot([pin4x pin3x], [pin4y pin3y],'g','linewidth',4); hold on       % b
    //plot([pin2x pin3x], [pin2y pin3y],'b','linewidth',4); hold on     % d
    //plot([pin3x pin5x], [pin3y pin5y],'y','linewidth',4); hold on     % e
    //plot([pin2x pin5x], [pin2y pin5y],'c','linewidth',4); hold on     % f
//    plot([pin2x pin6x], [pin2y pin6y],'m','linewidth',4); hold on     % h
//     plot([pin4x pin6x], [pin4y pin6y],'r','linewidth',4); hold on     % l
//    
//      plot([pin7x pin6x], [pin7y pin6y],'black','linewidth',4); hold on     % u
//     plot([pin7x pin5x], [pin7y pin5y],'y','linewidth',4); hold on     % g
//    plot([pin8x pin6x], [pin8y pin6y],'b','linewidth',4); hold on     % k
//     plot([pin7x pin8x], [pin7y pin8y],'r','linewidth',4); hold on     %j    
//     
     plot(x,y);
     
     //axis([-900 600 -900 600]);
   // pause(0.0001)
  //  hold off         %Stop execution for 0.1 sec so that the animation can be seen
// avi(i) = getframe(gca);
end
xnet(count,:)=x;
ynet(count,:)=y;
 set(gca(),"auto_clear","off")
m(count,2:(size(y,"*")+1))=y;
m(count,1)=theta;
count=count+1;

end
int=[0:0.1:2*3.147];
cd=find(int==1.500);
ab=find(int==4.7);
soln=m(:,cd+1:cd+2);//%front edge
soln1=m(:,ab+1);//%back edge

soln2=soln1-soln(:,1);
soln1(:,2)=soln1;
soln=soln-soln1;

soln(:,2:3)=soln ;
soln(:,1)=m(:,1);
figure(5)
plot(soln(:,1),soln(:,2));
  set(gca(),"auto_clear","off")
plot(soln(:,1),soln(:,3))
 set(gca(),"auto_clear","off")
plot(soln(:,1),soln2)
 set(gca(),"auto_clear","off")

 figure(6)
for i=1:count-1
    
     plot(xnet(i,:),ynet(i,:));
      set(gca(),"auto_clear","off")
end


