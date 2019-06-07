% 1D diffusion equation
kappa=1;
L=1;
t=[1e-8 0.01:0.01:1];
x=[-3/2*L:0.01:3/2*L];
% Method of images
sig=sqrt(2*kappa*t);
TG=zeros(length(x),length(t));
nimag=20;
Timag=zeros([size(TG) nimag+1]);
Timag(:,:,1)=(ones(length(x),1)*(1./sig)).*exp(-x'.^2*(1./sig.^2)/2)/sqrt(2*pi);
for ii=1:nimag
Timag(:,:,ii+1)=Timag(:,:,ii)+(-1)^ii*(ones(length(x),1)*(1./sig)).*exp(-(x+ii*L)'.^2*(1./sig.^2)/2)/sqrt(2*pi)+...
    (-1)^ii*(ones(length(x),1)*(1./sig)).*exp(-(x-ii*L)'.^2*(1./sig.^2)/2)/sqrt(2*pi);
end
% Separation of variables
n=20;
T=zeros([size(TG) n+1]);
T(:,:,1)=2/L*sin(pi/L*(x'+L/2))*exp(-(pi/L)^2*kappa*t);    
for ii=3:2:2*n+1
T(:,:,(ii+1)/2)=T(:,:,(ii-1)/2)+(-1)^((ii-1)/2)*2/L*sin(ii*pi/L*(x'+L/2))*exp(-(ii*pi/L)^2*kappa*t);    
end
% Matrix Stability Analysis for FTCS for thermal diffusion
Ngrid=61;
h=L/(Ngrid-1); 
%tsig=h^2/2/kappa;
tsig=1;
tstep=logspace(-2,2,11);
D=zeros(Ngrid);
for ii=2:Ngrid-1
    D(ii,ii)=-2;
    D(ii,ii-1)=1;
    D(ii,ii+1)=1;
end
nPower=20;
rho=zeros(size(tstep));
rho_eig=zeros(size(tstep));
for it=1:length(tstep)
A=eye(Ngrid)+tstep(it)/2/tsig*D;
rho(it)=abs(poweig(A,nPower));
rho_eig(it)=max(abs(eig(A)));
end
loglog(tstep,rho_eig,'*',tstep,rho,'o',tstep,ones(1,length(tstep)),'--')
xlabel('Time step'); ylabel('Spectral radius')
legend('MATLAB eig','Power method')