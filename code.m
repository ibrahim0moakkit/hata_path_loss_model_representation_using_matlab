%**Hata Path Loss Model**


%where
% fc : carrier frequency [Hz]
% d  : distance between the transmitter and the receiver [m]
% hr and ht : height of receiver and transmitter respectively [m] 

d=[1:2:31].^2;
%(fc,ht,d,hr)

PL1=hata_pl_urban(160*10^6,1000,d,2000);%fc=160MHz
PL2=hata_pl_suburban(200*10^6,1000,d,2000);%fc=200MHz
PL3=hata_pl_open_area(220*10^6,1000,d,2000);%fc=220MHz

subplot(131),semilogx(d,PL1),grid on,title('Hata Path Loss Urban Area'),xlabel('distance[m]'),ylabel('path loss [dB]')
subplot(132),semilogx(d,PL2),grid on,title('Hata Path Loss SubUrban Area'),xlabel('distance[m]'),ylabel('path loss [dB]')
subplot(133),semilogx(d,PL3),grid on,title('Hata Path Loss Open Area'),xlabel('distance[m]'),ylabel('path loss [dB]')



%For Urban area:
function PLu=hata_pl_urban(fc,ht,d,hr)
if(fc>=150*10^6&&fc<=200*10^6)
Cr=8.29*(log10(1.54*hr)).^2-1.1;

elseif (fc>=200*10^6&&fc<=1500*10^6)
Cr=3.2*(log10(11.75*hr))^2-4.97;

else
Cr=0.8+(1.1*log10(fc)-0.7)*hr-1.56*log10(fc);
end
PLu=69.55+26.16*log10(fc)-13.82*log10(ht)-Cr+(44.9-6.55*log10(ht)).*log10(d);
end
%For suburban area:
function PLsu=hata_pl_suburban(fc,ht,d,hr)
if(fc>=150*10^6&&fc<=200*10^6)
Cr=8.29*(log10(1.54*hr))^2-1.1;

elseif (fc>=200*10^6&&fc<=1500*10^6)
Cr=3.2*(log10(11.75*hr))^2-4.97;

else
Cr=0.8+(1.1*log10(fc)-0.7)*hr-1.56*log10(fc);
end
 
PLu=69.55+26.16*log10(fc)-13.82*log10(ht)-Cr+(44.9-6.55*log10(ht))*log10(d);
PLsu=PLu-2*(log10(fc/28))^2-5.4;
end
%For Open area:
function PLo=hata_pl_open_area(fc,ht,d,hr)
if(fc>=150*10^6&&fc<=200*10^6)
Cr=8.29*(log10(1.54*hr))^2-1.1;

elseif (fc>=200*10^6&&fc<=1500*10^6)
Cr=3.2*(log10(11.75*hr))^2-4.97;

else
Cr=0.8+(1.1*log10(fc)-0.7)*hr-1.56*log10(fc);
end
 
PLu=69.55+26.16*log10(fc)-13.82*log10(ht)-Cr+(44.9-6.55*log10(ht))*log10(d);
PLo=PLu-4.78*(log10(fc))^2+18.33*log10(fc)-40.97;
end



%  *************************************
%  * DONE BY: IBRAHIM MOAKKIT          *
%  * EMAIL: ibrahimmoakkit@outlook.com *
%  *************************************
